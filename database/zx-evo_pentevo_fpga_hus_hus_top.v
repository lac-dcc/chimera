`include "../include/tune.v"


module hus_top(

// clocks
	input wire clk,

// control
	input wire reset,
	// input wire tick,
    
// Z80 signals
    input wire [15:0] zdata,    // from fmaps
    input wire [15:0] zaddr,
    input wire [6:0] hus_wr,
    input wire hus_we,
    
// DAC
    output wire [1:0] dac_we,       // [1] - right / [0] - left
    output wire [15:0] fifo_out     // this is data for the DACs

);


    assign dac_we = stb[2:1];

    wire [2:0] stb;
    wire [31:0] reload,
    wire [7:0] sample_rate,
    wire [9:0] tick_rate  
    wire [7:0] fifo_used,
    wire [7:0] desc_addr,
    wire [15:0] desc_data,

    
    hus_parm hus_parm(
        .clk         (clk),
        .zdata       (zdata[7:0]),
        .hus_wr      (hus_wr),
        .reload      (reload),
        .sample_rate (sample_rate),
        .tick_rate   (tick_rate)
    );
    
    
    hus_sync hus_sync(
        .clk         (clk),
        .reset       (reset),
        .sample_rate (sample_rate),
        .tick_rate   (tick_rate),
        .tick_stb    (tick_stb),
        .tick        (tick),
        .stb         (stb)
    );

    
    hus_desc hus_desc(
        .rdaddress  (desc_addr),
        .q          (desc_data),
        .rdclock    (clk),
        .wraddress  (zaddr[8:1]),
        .data       (zdata),
        .wrclock    (clk),
        .wren       (hus_we)
	);


    hus_fifo hus_fifo(
        .aclr   (reset),
        .clock  (clk),
        .data   (fifo_in),
        .q      (fifo_out),
        .rdreq  (fifo_re),
        .wrreq  (fifo_we),
        .empty  (fifo_empty),
        .full   (fifo_full),
        .usedw  (fifo_used)
	);

    
endmodule