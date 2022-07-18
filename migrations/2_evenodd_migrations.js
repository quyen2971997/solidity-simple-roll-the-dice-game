const EvenOdd = artifacts.require("EvenOdd");

module.exports = function (deployer) {
  deployer.deploy(EvenOdd);
};
