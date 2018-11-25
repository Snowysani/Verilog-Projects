`timescale 1ns / 1ps
 module combination_lock_fsm(
   output reg [2:0] state,
   output wire [3:0] Lock, // this is an output wire
   input wire Key0, Key1, // these are the unlocks
   input wire [3:0] Password, //indicate number
   input wire Reset, //the reset button
   input wire Clk // clock
);
parameter  S0=3'b000,
           S1=3'b001, 
           S2=3'b010, 
           S3=3'b011,
           S4=3'b100;
           
reg [2:0] nextState; // 3 bits, 000 to 111
always@(*)
case(state)
    S0: begin
          if((Key0 == 1) && (Password == 4'b1101)) // pass = 13
            nextState = S1;
          else nextState = S0;
         end
    
    S1: begin
          if( (Key1 == 1) && (Password== 4'b0111)) // pass = 7
              nextState=S2;
          else if((Key1 == 1) && (Password !== 4'b0111))
               nextState=S0;
          else nextState=S1;
         end
    
    S2: begin
          if((Key0 == 1) && (Password == 4'b1001))
              nextState=S3;
           else if(Reset == 1'b1)
               nextState=S0;
          else nextState=S2; // otherwise
         end
    S3: begin
        if((Key1 == 1) && (Key0 == 1) && (Password == 4'b1110))
            nextState = S4;
        else if(Reset == 1'b1)
            nextState = S0;
        else nextState = S3;
        end
    S4: begin
          if(Reset == 1'b1)
               nextState=S0;
          else nextState=S4;
         end

    endcase
 always@(posedge Clk)
     if(Reset)
        state <= S0;
     else 
        state <= nextState;

assign Lock = (state == S4)? 4'b1111:4'b0000;

endmodule /*
 module combination_lock_fsm(
  output reg [1:0] state,
  output wire [3:0] Lock, // this is an output wire
  input wire Key0, Key1, // these are the unlocks
  input wire [3:0] Password, //indicate number
  input wire Reset, //the reset button
  input wire Clk // clock
);
parameter  S0=2'b00,
          S1=2'b01, 
          S2=2'b10, 
          S3=2'b11; 
reg [2:0] nextState; // 3 bits, 000 to 111
always@(*)
case(state)
   S0: begin
         if((Key0 == 1) && (Password == 4'b1101)) // pass = 13
           nextState = S1;
         else nextState = S0;
        end
   
   S1: begin
         if( (Key1 == 1) && (Password== 4'b0111)) // pass = 7
             nextState=S2;
         else if((Key1 == 1) && (Password !== 4'b0111))
              nextState=S0;
         else nextState=S1;
        end
   
   S2: begin
         if((Key0 == 1) && (Password == 4'b1001))
             nextState=S3;
          else if(Reset == 1'b1)
              nextState=S0;
         else nextState=S2; // otherwise
        end
   
   S3: begin

         if(Reset == 1'b1)
              nextState=S0;
         else nextState=S3;
        end

   endcase
always@(posedge Clk)
    if(Reset)
       state <= S0;
    else 
       state <= nextState;

assign Lock = (state == S3)? 4'b1111:4'b0000;

endmodule*/