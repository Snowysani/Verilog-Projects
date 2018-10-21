`timescale 1ns / 1ps
`default_nettype none

module priority_encoder(
    input wire [3:0] W,
    output wire zero, 
    // y outputs 2 bit reg
    output reg [1:0] Y
    );
    
    assign zero = (W == 4'b0000); 
    
    always@(W) // trigger when W changes
        begin
            casex(W) // case based on  W
                4'b0001: Y = 2'b00; // w[0] lit up
                4'b001X: Y = 2'b01; // w[1]
                4'b01XX: Y = 2'b10; // w[2]
                4'b1XXX: Y = 2'b11; // w[3]
                default: Y = 2'bXX; // Don't cares for the rest
            endcase
        end
endmodule // end it