`timescale 1ns / 1ps
`default_nettype none

module four_bit_alu(
    output wire [3:0] Result, //outputting 4 bits
    output wire Overflow, //1 bit overflow, 1 or 0 
    input wire [3:0] opA, opB, //4 bit operands
    /* 
    00 - AND
    01 - ADD
    10 - AND
    11 - SUB
    */
    input wire [1:0] ctrl //2 bit control 
    );
    //A0-3
    //B0-3
    wire [3:0] andAB;
    wire [3:0] ResultAdder;
    wire Overflow1;
    assign andAB = opA & opB; //A and B
    //AND0-3 for A and B

    //this feeds into the first part of the mux
    // A0-3, B0-3, feeds into adder which feeds into MUX
    add_sub mux1(ResultAdder, Overflow1, opA, opB, ctrl[1]);
    four_bit_mux muxSomething(Result, andAB, ResultAdder, ctrl[0]); // make the mux
    assign Overflow = ctrl[0] & Overflow1; // final overflow
endmodule