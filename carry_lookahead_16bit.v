`timescale 1ns / 1ps
`default_nettype none

// 16 bit 2 level carry lookahead adder
module carry_lookahead_16bit(Cout, S, X, Y, Cin);
output wire Cout; // C_16
// use wires cause using structural abstraction
output wire [15:0] S; // sum
input wire [15:0] X, Y; // 16 bit addends
input wire Cin; // input carry
// intermediate nets/wires
wire [16:0] C; // 5 bit carry vector
wire [15:0] P, G; // generate and propagate vectors
wire [3:0] P_star, G_star; // gen/prop for block cau
// input/output carry
assign C[0] = Cin;
assign Cout = C[16];
// Sub module setup 
generate_propagate_unit gpu1(G,P,X,Y); // this is 16 bit wide
block_carry_lookahead_unit BCLAU0(
    .G_star (G_star[0]),
    .P_star (P_star[0]),
    .C (C[3:1]),
    .G (G[3:0]),
    .P (P[3:0]),
    .C0 (C[0])
);
block_carry_lookahead_unit BCLAU1(
    .G_star (G_star[1]),
    .P_star (P_star[1]),
    .C (C[7:5]),
    .G (G[7:4]),
    .P (P[7:4]),
    .C0 (C[4])
);
block_carry_lookahead_unit BCLAU2(
    .G_star (G_star[2]),
    .P_star (P_star[2]),
    .C (C[11:9]),
    .G (G[11:8]),
    .P (P[11:8]),
    .C0 (C[8])
); // Just following the diagram...
block_carry_lookahead_unit BCLAU3(
    .G_star (G_star[3]),
    .P_star (P_star[3]),
    .C (C[15:13]),
    .G (G[15:12]),
    .P (P[15:12]),
    .C0 (C[12])
);
carry_lookahead_unit CLAU( //instantiate the CLAU
    //Concatentation syntax for the carry vector
    .C({C[16], C[12], C[8], C[4]}),
    .G (G_star),
    .P (P_star),
    .C0 (C[0])
);
// Now get the summation unit working
summation_unit SU1(S,P,C);
endmodule