`default_nettype none

module tlc_controller_ver1(
    output wire [1:0] highwaySignal, farmSignal, //connected LEDs
    output wire [3:0] JB,
    input wire Clk,
    input wire Rst, // reset signal
    input wire Sensor
);

    wire RstSync;
    wire RstCount;
    reg [30:0] Count;
    assign JB[3] = RstCount;
    synchronizer syncRst(RstSync, Rst, Clk);
    // Synchronizer now added, syncs our signal
    tlc_fsm FSM(
        .state(JB[2:0]), // State inputs
        .RstCount(RstCount),
        .highwaySignal(highwaySignal),
        .farmSignal(farmSignal),
        .Count(Count), // Just the regular count
        .Clk(Clk), // Clock signal works
        .Rst(RstSync),
        .farmSensor(Sensor) // This is the farm sensor signal I just added
    );
    
    // Counter with a synchronous reset
    always@ (posedge Clk)
            if(Rst)
                Count = 0; // Reset the count to 0, otherwise
            else
                Count = Count + 1;  // Add one to the count
endmodule
    