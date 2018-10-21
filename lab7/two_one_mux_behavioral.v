`timescale 1ns / 1ps
`default_nettype none

module two_one_mux(Y, A, B, S); // define the module
    output reg Y; // declare the output as reg because 
                  // of the always block
    input wire A, B, S; // input wires
    
    always @(A or B or S)
        begin // block
            if (S == 1'b0) // comparison, use 2 equals
                Y = A; // drive Y with A
            else // otherwise S == b1
                Y = B; // drive Y with B
        end // end the block
endmodule // end it
