// This module generates syncro and control signals for HUS
//
// Wave DMA start conditions, or:   1. FIFO is full
//
// Wave DMA stop conditions, or:    1. FIFO is empty (also on reset)

`include "../include/tune.v"


module hus_sync(

// clocks
	input wire clk,

// controls
	input wire reset,
    input wire tick_stb,
    input wire fifo_full,
    input wire fifo_empty,
    output wire tick,
    output reg [1:0] dac_ws,
    output wire fifo_re,
    output wire play_on,
    
// control variables
    input wire [7:0] sample_rate,
    input wire [9:0] tick_rate,     // at samplerate 50kHz is 1000 ticks for 125 bpm, 10 bits is enough

);


// controls
    reg play_on;
    assign fifo_re = sample & play_on & (stb0 | stb1);
    
    always @(posedge clk)
    begin
        dac_ws[0] <= sample & play_on & stb0;
        dac_ws[1] <= sample & play_on & stb1;
    end
    
    always @(posedge clk)
    begin
        if (fifo_full)
            play_on <= 1;
        if (fifo_empty)
            play_on <= 0;
    end

    
// primary clock divider
    reg [3:0] div;
    wire stb0 = (div == 4'b1110);            // 1,75MHz strobe
    wire stb1 = (div == 4'b1111);            // 1,75MHz strobe
    
    always @(posedge clk)
        div <= div + 1;


// sample strobe
    reg [8:0] cnt;
    wire sample = cnt[8];
    
    always @(posedge clk)
    begin
        if (reset)
            cnt[8] <= 1;
        else
        if (stb2)
            cnt <= sample ? {1'b0, sample_rate} : cnt - 1;
    end
    
    
// tick counter
    reg [10:0] tck;
    assign tick = tck[10];
    
    always @(posedge clk)
    begin
        if (reset)
            tck[10] <= 1;
        else
        if (tick_stb | tick)
            tck <= tick ? {1'b0, tick_rate} : tck - 1;
        
    end
    
    
endmodule