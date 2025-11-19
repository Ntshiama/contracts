module.exports = (srv) => {
    srv.before(['CREATE', 'UPDATE'], 'Contracts', async (req) => {
        const { startedate, enddate } = req.data;
        if (enddate <= startedate) {
            req.error(400, 'End date must be after start date');
        }
    })
};