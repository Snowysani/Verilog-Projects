`timescale 1ns / 1ps
`default_nettype none

module add_sub(
// first declare your input and outputs
    output wire [3:0] Sum, // 4 bit result
    output wire Overflow, // overflow is 1 or 0
    input wire [3:0] opA, opB, // operands are 4 bit
    input wire opSel //C1 from Lab 5, if 1 make it subtract
    ); // end the declaration for setting up input/output
    
    //get the internals
    wire [3:0] notB; // B0-3
    wire c0, c1, c2, c3; // C0 to C3
    
    // get the logic ready
    assign notB[0] = opB[0] ^ opSel; 
    // C1 XOR B0, if C1 = 1, complement it 
    assign notB[1] = opB[1] ^ opSel; // C1 XOR B1
    assign notB[2] = opB[2] ^ opSel; // C1 XOR B2
    assign notB[3] = opB[3] ^ opSel; // C1 XOR B3

    //get full adders together for carry ripple effect
    full_adder adder0(Sum[0], c0, opA[0], notB[0], opSel);
    full_adder adder1(Sum[1], c1, opA[1], notB[1], c0);
    full_adder adder2(Sum[2], c2, opA[2], notB[2], c1);
    full_adder adder3(Sum[3], c3, opA[3], notB[3], c2);
    //assign the overflow
    assign Overflow = c3 ^ c2;//
    
endmodule