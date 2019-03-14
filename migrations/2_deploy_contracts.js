var Votacion = artifacts.require("./Votacion.sol");
module.exports = function(deployer) {
  deployer.deploy(Votacion, "Satoshi", {gas: 6700000});
};