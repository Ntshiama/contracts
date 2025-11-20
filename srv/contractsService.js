const cds = require("@sap/cds");

module.exports = (srv) => {
  srv.before(["*"], "Contracts", async (req) => {
    const { startdate, enddate } = req.data;
    const LOG = cds.log("contracts-service");
    LOG.info( req );
    if (enddate <= startdate) {
      req.error(400, "End date must be after start date");
    }
  });
};
