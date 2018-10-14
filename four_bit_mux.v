`timescale 1ns / 1ps
`default_nettype none
//Connect 4 2:1 muxes together

module four_bit_mux(Y, A, B, S);
    //declare output and input ports
    //output a 4 bit wide wire
    
    input wire [3:0] A, B; // A and B are each 4 bits long
    input wire S; // the select input for mux is a single bit
    output wire [3:0] Y;
    
    //now make the 2:1 muxes
    
    two_one_mux MUX0(Y[0], A[0], B[0], S);
    two_one_mux MUX1(Y[1], A[1], B[1], S);
    two_one_mux MUX2(Y[2], A[2], B[2], S);
    two_one_mux MUX3(Y[3], A[3], B[3], S);
    //these are the 4 2:1 muxes for a 4 bit mux
endmodule