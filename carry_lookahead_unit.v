// This module describes the carry look ahead unit
module carry_lookahead_unit(C,G,P,C0);
output wire [4:1] C; // C4, C3, C2, C1
input wire [3:0] G,P; // generates and propagates
input wire C0; // input carry in
wire carryInandP; // Now I'm going to call all of the and gates up 
wire andOne, andTwo, andThree, andFour, andFive, andSix, andSeven, andEight, andNine;
assign #2 carryInandP = C0 & P[3] & P[2] & P[1] & P[0];
assign #2 andOne = P[3] & P[2] & P[1] & G[0];
assign #2 andTwo = P[3] & P[2] & G[1];
assign #2 andThree = P[3] & G[2];
assign #2 andFour = P[2] & P[1] & P[0] & C0;
assign #2 andFive = P[2] & P[1] & G[0];
assign #2 andSix = P[2] & G[1];
assign #2 andSeven = P[1] & P[0] & C0;
assign #2 andEight = P[1] & G[0];
assign #2 andNine = P[0] & C0; // Now do the Or gates
assign #2 C[4] = carryInandP | andOne | andTwo | andThree | G[3];
assign #2 C[3] = andFour | andFive | andSix | G[2];
assign #2 C[2] = G[1] | andSeven | andEight;
assign #2 C[1] = G[0] | andNine;
endmodule
