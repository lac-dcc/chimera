// This module latches the HUS parameters

`include "../include/tune.v"


module hus_parm(

// clocks
	input wire clk,

// controls
    input wire tick_stb,
    input wire [6:0] hus_wr,

// Z80 signals
    input wire [7:0] zdata,    // from fmaps
    
// parameters
    output reg [31:0] reload,
    output reg [ 7:0] sample_rate,
    output reg [ 9:0] tick_rate  

);


    wire [3:0] reload_we = hus_wr[3:0];
    wire sample_we = hus_wr[4];
    wire [1:0] tick_we = hus_wr[6:5];


    always @(posedge clk)
    begin
        if (tick_stb)
            reload <= 0;
        if (reload_we[0])
            reload[7:0] <= zdata;
        if (reload_we[1])
            reload[15:8] <= zdata;
        if (reload_we[2])
            reload[23:16] <= zdata;
        if (reload_we[3])
            reload[31:24] <= zdata;
        if (sample_we)
            sample_rate <= zdata;
        if (tick_we[0])
            tick_rate[7:0] <= zdata;
        if (tick_we[1])
            tick_rate[9:8] <= zdata[1:0];
    end


endmodule