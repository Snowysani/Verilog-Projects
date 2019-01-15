`timescale 1ns / 1ps
`default_nettype none

module four_bit_mux(Y, A, B, S); // define the module

    output reg [3:0] Y; 
    // declare the output as reg because of the 
                // always block
    input wire [3:0] A, B; // these inputs are 4 bit
    input wire S; // this input is 1 bit, select
    
    always @(A or B or S)
        begin // block
            if (S == 1'b0) // comparison, use 2 equals
                Y = A;
            else
                Y = B;
        end // end the block
        
endmodule // end it