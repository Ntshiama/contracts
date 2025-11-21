const cds = require("@sap/cds");

module.exports = (srv) => {
  srv.before(["*"], "Contracts", async (req) => {
    const { startdate, enddate } = req.data;
    const LOG = cds.log("contracts-service");
    LOG.info(req.event);
    if (enddate <= startdate) {
      req.error(400, "End date must be after start date");
    }
  });
  // -------------------------------------------------------------
  // Nodemailer Konfiguration
  // -------------------------------------------------------------
  const Nodemailer = require("nodemailer");
  const mail = Nodemailer.createTransport({
    host: "smtp.example.com",
    port: 587,
    secure: false,
    auth: {
      user: process.env.MAIl_USER,
      pass: process.env.MAIL_PASSWORD,
    },
  });
  // -------------------------------------------------------------
  // Prüfen, ob enddate in < / > 3 Monaten liegt
  // -------------------------------------------------------------
  function checkDateWindow(enddate) {
    const now = new Date();
    const ebd = new Date(enddate);

    const diffMoths =
      (ebd.getFullYear() - now.getFullYear()) * 12 +
      (ebd.getMonth() - now.getMonth());
    return diffMoths;
  }
  // -------------------------------------------------------------
  // Nach dem Anlegen / Ändern eines Vertrags eine E-Mail-Benachrichtigung senden, wenn enddate in <= 3 Monaten liegt
  // -------------------------------------------------------------
  srv.after(["CREATE", "UPDATE"], "Contracts", async (data, req) => {
    const { enddate, internalcontactname, internalcontactmail, title } =
      req.data;
    if (!enddate || !internalcontactmail) return;
    if (checkDateWindow(enddate) <= 3) {
      try {
        const mailService = await cds.connect.to("mail");
        await mailService.send({
          to: internalcontactmail,
          subject: `Contract "${title}" is about to expire`,
          text: `Dear ${internalcontactname},\n\nder Vertrag "${title}" läuft am ${enddate.toDateString()} aus. Bitte ergreifen Sie die erforderlichen Maßnahmen.\n\nBest regards,\nContracts Management System`,
        });
        const LOG = cds.log("contracts-service");
        LOG.info(
          `Email notification sent to ${
            internalcontactmail
          } for contract "${title}":${enddate.toDateString()}`
        );
      } catch (error) {
        const LOG = cds.log("contracts-service");
        LOG.error(
          `Failed to send email notification for contract "${title}": ${error.message}`
        );
      }
    }
  });
};
