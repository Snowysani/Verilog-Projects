`timescale 1ns / 1ps
`default_nettype none
//setup the module
module two_one_mux(Y, A, B, S);
    output wire Y;
    input wire A, B, S;
    // these are the wires
    wire notS;
    wire andA;
    wire andB;
    // these are the gates
    not not0(notS, S);
    and and0(andA, notS, A);
    and and1(andB, S, B);
    or or0(Y, andA, andB);
    
endmodule // end it 
