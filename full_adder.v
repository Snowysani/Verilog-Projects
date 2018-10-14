`timescale 1ns / 1ps
`default_nettype none

module full_adder(S, Cout, A, B, Cin);
//make the module with outputs sum and cout 
//decare the input wires
    input wire A, B, Cin;
    // these are 1 bit
    // now get the outputs
    output wire S, Cout; // 1 bit outputs
    wire andBCin, andACin; // B and Cin, A and Cin, these are internal
    wire andAB; // 1 bit, declare A and B as a wire
    //Now use dataflow for the gate junk'
    assign S = A ^ B ^ Cin; // A XOR B XOR Cin
    assign andAB = A & B; // A AND B 
    assign andBCin = B & Cin; // B AND C 
    assign andACin = A & Cin; // A AND C
 
    assign Cout = andAB | andBCin; // (A AND B) OR (B AND Cin)
    
endmodule 