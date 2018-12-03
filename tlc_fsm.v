`default_nettype none
`define onesecond 50000000 // Got these definitions from the pre-lab manual
`define threeseconds 150000000
`define fifteenseconds 750000000
`define thirtyseconds 1500000000
module tlc_fsm(
    output reg [2:0] state, // output for debugging
    output reg RstCount, // use an always block
    output reg [1:0] highwaySignal, farmSignal,
    input wire [30:0] Count, // use n computed earlier
    input wire Clk, Rst, // clock and reset
    // Now add experiment 2 port
    input wire farmSensor
);
parameter S0 = 3'b000, // These are the state parameters
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100,
    S5 = 3'b101,
    red = 2'b00, // Red is supposed to be 01
    yellow = 2'b01, // 10
    green = 2'b11; // 11, but mine are different
reg [2:0] nextState;
always@(Count)
    case (state)
            // state 1
        S0: begin
        if (Count == `threeseconds) // if we reached 1 second
            begin
                highwaySignal = red; // results of state 1
                farmSignal = red;
                RstCount = 1;
                nextState = S1;
           
            end
        else
            begin
                highwaySignal = red; // otherwise, stay
                farmSignal = red;
                RstCount = 0;
                nextState = S0;
            end
        end
            // state 2
            S1: begin
            if((Count >= `thirtyseconds) && (farmSensor == 1))    
                begin
                    highwaySignal = green; // Traffic lights
                    farmSignal = red;       
                    RstCount = 1; // Reset the count, move states
                    nextState = S2; // move states
                end
            else
                begin
                    highwaySignal = green;
                    farmSignal = red;
                    RstCount = 0;
                    nextState = S1;
                end
            end
           // state 3
            S2: begin
            if(Count == `threeseconds)     // if reached 3 seconds
                begin
                    highwaySignal = yellow; // results of state 3
                    farmSignal = red;  
                    RstCount = 1;
                    nextState = S3;
                end
            else
                begin
                    highwaySignal = yellow; // otherwise, stay
                    farmSignal = red;
                    RstCount = 0;
                    nextState = S2;
                end
            end
            S3: begin
            if(Count == `onesecond)    
                begin
                    highwaySignal = red; // Both are red
                    farmSignal = red;  
                    RstCount = 1; // rst count
                    nextState = S4;
                end
            else
                begin
                    highwaySignal = red;
                    farmSignal = red;
                    RstCount = 0;
                    nextState = S3;
                end
            end
            S4: begin
            if ((Count == `fifteenseconds) || ((farmSensor == 1) && (Count >= `threeseconds)))
                // These conditions are for the second experiment
                begin
                    highwaySignal = red;
                    farmSignal = green;  
                    RstCount = 1;
                    nextState = S5;
                end
            else
                begin
                    highwaySignal = red;
                    farmSignal = green;
                    RstCount = 0;
                    nextState = S4;
                end
            end
        S5: begin
        if (Count == `threeseconds)    
            begin
                highwaySignal = red;
                farmSignal = yellow;  
                RstCount = 1;
                nextState = S0;
            end
        else
        begin
            highwaySignal = red;
            farmSignal = yellow;
            RstCount = 0;
            nextState = S5;
        end
        end
        endcase
always@ (posedge Clk)
        if(Rst)
            state <= S0; // If there's the reset
        else
            state <= nextState; // Otherwise move to next state
endmodule