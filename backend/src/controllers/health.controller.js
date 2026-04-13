const getHealth = (req, res) => {
  res.status(200).json({
    message: "Backend Node OK ",
  });
};

module.exports = {
  getHealth,
};
