`timescale 1ns / 1ps
`default_nettype none

module mux_4bit_4to1(Y, A, B, C, D, S); // define the module

    output reg [3:0] Y; // declare the output as reg because of the 
                // always block
    input wire [3:0] A, B, C, D; // input wires 4 bits
    input wire [1:0] S; // 2 bit for select
    
    always @(*) // sensitive while there are changes
        case(S) // based on s, select
            2'b00: Y = A; // when S is 00
            2'b01: Y = B; 
            2'b10: Y = C;
            2'b11: Y = D; // when s is 11
        endcase // end the case statement
endmodule // end it