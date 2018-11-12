// This module describes the summation unit
module summation_unit(S,P,C);
output wire [15:0] S; // sum vector
input wire [15:0] P;
input wire [15:0] C; // propagate and carry vectors
//input wire Cin;
assign #2 S = P ^ C; /*
assign S[15] = P[15] ^ C[15];
assign S[14] = P[14] ^ C[14];
assign S[13] = P[13] ^ C[13];
assign S[12] = P[12] ^ C[12];
assign S[11] = P[11] ^ C[11];
assign S[10] = P[10] ^ C[10];
assign S[9] = P[9] ^ C[9];
assign S[8] = P[8] ^ C[8];
assign S[7] = P[7] ^ C[7];
assign S[6] = P[6] ^ C[6];
assign S[5] = P[5] ^ C[5];
assign S[4] = P[4] ^ C[4];
assign S[3] = P[3] ^ C[3];
assign S[2] = P[2] ^ C[2];
assign S[1] = P[1] ^ C[1];
assign S[0] = P[0] ^ C[0];
*/
endmodule
