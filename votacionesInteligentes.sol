// "SPDX-License-Identifier: MIT"
pragma solidity ^0.8.0;
// Contrato de votaciones
    // registrar candidatos
    // persmiso a alguien de votar
    // votar
    
contract Votes {
    // variables
    uint256 totalVotos;
    
    address public encargadoDeContrato;

     constructor() {
        encargadoDeContrato = msg.sender;
        votantes[encargadoDeContrato].weight = 1;
    
    }
    
    // fecha y hora final de la votacion en epoch
    uint finRegistroCandidatos = 1666018800; // 17/10/2022 - 15:00hs.
    uint finVotacion = 1668697200;// 17/11/2022 - 15:00hs.

    struct Votante{
        bool voto;
        bool puedeVotar;
    }
    
        struct Candidato {
        string nombre;        
        string sexo;        
        uint edad;        
        bool enlistado;
        uint256 votos;
    }

    mapping(address => Votante) public votantes;
    
////////////////////////////////////// Registrar Candidato /////////////////////////////////////////////
   
    mapping(address => Candidato) public registro; // Esta en public para revisar el registro, se puede consultar con el address

    function registrar(string memory _name, string memory _sexo, uint _edad) public{
        require(_edad > 18, "Solo candidatos mayores de 18 pueden registrarse");
        require(block.timestamp > finRegistroCandidatos);
        require(!registro[msg.sender].enlistado, "Ya estas registrado");

        registro[msg.sender] = Candidato({
            nombre: _name,
            sexo: _sexo,
            edad: _edad,
            enlistado: true,
            votos: 0
        });
   
   } 
//////////////////////////////////////////////////////////////////////////////////////


    // funciones
// darle permiso a alguien de votar
    function permisoVotar(address votante) public {
        require(block.timestamp > finVotacion);
        require(msg.sender == encargadoDeContrato, "Solo encargados pueden dar el permiso de votar.");
        require(!votantes[votante].votoRegistrado, "Ya has votado.");
        require(votantes[votante].weight == 0);votantes[votante].weight = 1;
    }
    

}
    // votar
    function votar(uint Candidato) public {
        Votante storage sender = votantes[msg.sender];
        require(sender.weight != 0, "No tienes permiso de votar.");
        require(!sender.votoRegistrado, "Ya has votado.");
        sender.votoRegistrado = true;
        sender.votar = Candidato;

        Candidatos[Candidato].cuentaDeVoto += sender.weight;

    }
  
