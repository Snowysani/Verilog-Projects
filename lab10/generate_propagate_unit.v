// This module describes the generate propagate unit
module generate_propagate_unit(G,P,X,Y);
// ports are wires as we will use dataflow
output wire [15:0] G,P;
input wire [15:0] X,Y;
assign #2 G = X & Y;
assign #2 P = X ^ Y; // Erick told me I could to it this way
/*assign G[15] = X[15] & Y[15];
assign G[14] = X[14] & Y[14];
assign G[13] = X[13] & Y[13];
assign G[12] = X[12] & Y[12];
assign G[11] = X[11] & Y[11];
assign G[10] = X[10] & Y[10];
assign G[9] = X[9] & Y[9];
assign G[8] = X[8] & Y[8];
assign G[7] = X[7] & Y[7];
assign G[6] = X[6] & Y[6];
assign G[5] = X[5] & Y[5];
assign G[4] = X[4] & Y[4];
assign G[3] = X[3] & Y[3]; // Add two ns delays
assign G[2] = X[2] & Y[2];
assign G[1] = X[1] & Y[1];
assign G[0] = X[0] & Y[0];
assign P[15] = X[15] ^ Y[15];
assign P[14] = X[14] ^ Y[14];
assign P[13] = X[13] ^ Y[13];
assign P[12] = X[12] ^ Y[12];
assign P[11] = X[11] ^ Y[11];
assign P[10] = X[10] ^ Y[10];
assign P[9] = X[9] ^ Y[9];
assign P[8] = X[8] ^ Y[8];
assign P[7] = X[7] ^ Y[7];
assign P[6] = X[6] ^ Y[6];
assign P[5] = X[5] ^ Y[5];
assign P[4] = X[4] ^ Y[4];
assign P[3] = X[3] ^ Y[3];
assign P[2] = X[2] ^ Y[2];
assign P[1] = X[1] ^ Y[1];
assign P[0] = X[0] ^ Y[0];*/
endmodule
