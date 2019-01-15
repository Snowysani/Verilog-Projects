`timescale 1ns / 1ps
`default_nettype none

module two_four_decoder(
    input wire [1:0] W, //2 bit W input
    input wire En, //input wire Enable
    output reg [3:0] Y // reg 4 bit output Y
    );
    
    always@(W or En) // Trigger when En or W changes
        begin
            if(En == 1'b1) // if enable is 1 
                case(W) // start the case
                    2'b00: Y = 4'b0001; // 4 bit, y[0]
                    2'b01: Y = 4'b0010; // y[1]
                    2'b10: Y = 4'b0100; // y[2]
                    2'b11: Y = 4'b1000; // light up y[3]
                endcase // end the case
            else // if enable is not on, disable output
                Y = 4'b0000; // set them all to 0
        end
endmodule // end it
