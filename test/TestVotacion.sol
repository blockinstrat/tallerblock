pragma solidity ^0.5.6;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Votacion.sol";

contract TestVotacion {

  function testVotarSatoshi() public {
    Votacion contrato = Votacion(DeployedAddresses.Votacion());
    
    //contrato.nuevoCandidato("Satoshi");
    Assert.equal(uint(contrato.votosTotales("Satoshi")), uint(0), "El numero de votos deberia ser 0");
    
    contrato.votar("Satoshi");
    Assert.equal(uint(contrato.votosTotales("Satoshi")), uint(1), "El numero de votos deberia ser 1");
  }

  function testVotarPepe() public {
    Votacion contrato = Votacion(DeployedAddresses.Votacion());

    Assert.equal(uint(contrato.votosTotales("Pepe")), uint(1), "Funciona correctamente y lanza excepcion");
  }
}
