const cds = require("@sap/cds");

module.exports = (srv) => {
  const { Contracts, Contractitems } = srv.entities;

  srv.after("READ", Contracts, async (data, req) => {
    if (!data) return;

    const row = Array.isArray(data) ? data : [data];
    const tx = cds.tx(req);

    for (const c of row) {
      if (Array.isArray(c.items)) {
        c.amount = sumItems(c.items);
        continue;
      }
      const items = await tx.run(
        SELECT.from(Contractitems)
          .columns("price", "quantity")
          .where({ parent_ID: c.ID }),
      );
      c.amount = sumItems(items);
    }
  });

  function sumItems(items) {
    let total = 0;

    for (const it of items || []) {
      const q = Number(it.quantity ?? 0);
      const p = Number(it.price ?? 0);
      total += q * p;
    }
    return Math.round((total + Number.EPSILON) * 100) / 100;
  }
};
