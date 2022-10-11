// "SPDX-License-Identifier: MIT"
pragma solidity ^0.8.0;
// Contrato de votaciones
    // registrar candidatos
    // persmiso a alguien de votar
    // votar
    
contract Votes {
    // variables
    uint256 totalVotos;

    struct Votante{
        bool voto;
        bool puedeVotar;
    }

    mapping(address => Votante) vota;

    struct Candidato {
        string nombre;
        uint256 votos;
    }

    Candidato public canditato1 = Candidato({
        nombre: "Mauricio Pinon",
        votos: 0
    });

    Candidato public canditato2 = Candidato({
        nombre: "Robert Carrichi",
        votos: 0
    });
    // funciones
    // darle permiso a laguien de votar - (Solo el INE DEX)
    function permisoVotar(address _votante) public returns(bool, address) {
        vota[_votante].puedeVotar = true;
        return (true, _votante);
    }
    // votar
    


} 
