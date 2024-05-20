// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// Top Level Module

`timescale 1ns / 1ps
module TopLevelModule(seg, an, clk, dp, start, stop, dswitch, reset, lap, TimeSet);
    output [0:6] seg;
    output [3:0] an;
    output [0:0] dp;
    input clk, start, stop, dswitch, reset, lap, TimeSet;

    reg [0:3] dots = 4'b1010;
    reg tick = 1'b0;
    reg running = 1'b0;
    reg flashing = 1'b0;
    reg started = 1'b0;
    reg countDirection = 1'b1;
    reg resetState = 1'b0;
    reg lapState = 1'b0;
    reg setState = 1'b0;
    
    wire [3:0] A;
    wire [3:0] B;
    wire [3:0] C;
    wire [3:0] D;
    
    reg [3:0] lapA;
    reg [3:0] lapB;
    reg [3:0] lapC;
    reg [3:0] lapD;

    integer count = 0;

    always @(posedge clk)
    begin
        // Start stop
        if(start)
        begin
            running = 1'b1;
            flashing = 1'b0;
            lapState = 1'b0;
        end
        
        if(stop)
        begin
            running = 1'b0;
            flashing = 1'b0;
        end

        // Count Direction
        if(!running) // only change direction when stopped
            countDirection = dswitch; // take value of direction switch

        // Reset
        if(!running) //only reset when not counting
            resetState = reset; // take value of reset button
        if(reset)
            started = 0;
        if(resetState)
            lapState = 0;

        // Stop at 0 and flash
        if(A == 0 && B == 0 && C == 0 && D == 0 && started && setState == 0)
        begin
            running = 0;
            flashing = 1;
            started = 0;
        end
        
        // Started
        if(A != 0 || B != 0 || C != 0 || D != 0)
        begin
            started = 1;
            flashing = 0;
        end
        
        // Lap Button
        if(lap && (countDirection == 1'b1)) // Ensures counting must be up to enable Lap
            lapState = 1'b1; //enable Lap
        
        // Lap Display
        if(!lapState)
        begin
            lapA = A;
            lapB = B;
            lapC = C;
            lapD = D;
        end
        
        // Set speed of the counting process (setState)
        if(!running)
            setState = TimeSet;
        
        if(!setState)
            count = count + 1; // Standard counting speed
        else
            count = count + 5; // 5x speed increase. Numbers still readable
            
        if(count >= 5000000) // reset clock if out of range
        begin
            tick = tick + 1'b1;
            count = 0;
        end
    end

    CounterModule counter(A, B, C, D, tick, resetState, running, countDirection);

    fourdigitdriver driver(lapA, lapB, lapC, lapD, clk, dots, seg, an, dp, flashing);

endmodule
