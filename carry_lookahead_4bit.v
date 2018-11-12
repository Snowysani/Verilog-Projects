`timescale 1ns / 1 ps
// This is the top-level module
module carry_lookahead_4bit(Cout,S,X,Y,Cin);
output wire Cout; // C_4 for a 4-bit adder
output wire [3:0] S; // final 4-bit sum vector
input wire [3:0] X,Y; // 4-bit addends
input wire Cin; // input carry in
wire [3:0] G, P; 
wire [4:1] C;
generate_propagate_unit gpu1(G,P,X,Y);
carry_lookahead_unit clu1(C,G,P,Cin);
summation_unit su1(S,P,C,Cin);
assign Cout = C[4];
endmodule
