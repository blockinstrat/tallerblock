pragma solidity ^0.5.6;

contract Votacion {

  address owner;
  mapping (string => uint8) public votosRecibidos; //mapping que asocia numero de votos a candidato
  mapping (string => bool) public candidatos; //mapping para saber si un candidato es válido

  constructor(string memory _nombreCandidato) public {
    owner = msg.sender;
    candidatos[_nombreCandidato] = true;
    votosRecibidos[_nombreCandidato] = 0;
  }

  function nuevoCandidato(string memory _nombreCandidato) public {
    candidatos[_nombreCandidato] = true;
    votosRecibidos[_nombreCandidato] = 0;
  }

  // Numero total de votos recibidos por un candidato
  function votosTotales(string memory candidato) view public returns (uint8) {
    require(candidatoEsValido(candidato));
    return votosRecibidos[candidato];
  }

  // Incrementa en 1 el numero de votos de un candidato
  function votar(string memory candidato) public {
    require(candidatoEsValido(candidato) == true);
    votosRecibidos[candidato] += 1;
  }

  // Comprueba que un candidato existe
  function candidatoEsValido(string memory candidato) view public returns (bool) {
    return (candidatos[candidato] == true);
  }
}