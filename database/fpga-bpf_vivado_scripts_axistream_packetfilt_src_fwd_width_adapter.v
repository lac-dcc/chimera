//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
`default_nettype none

/*

fwd_width_adapter.v

The interal packet memory must have a minimum port width of 32, which means
that both ports together make 64 bits. However, it should be possible for a
narrower snooper/forwarder to use the packet memory. These width converters
take care of that

This module works in a similar way to the cpu_adapter in the P3 system, but
is quite a bit easier because we never have to straddle two words.

*/

`ifdef ICARUS_VERILOG
`define localparam parameter
`else /* For Vivado */
`define localparam localparam
`endif

module fwd_width_adapter # (
    parameter MEM_WIDTH = 64,
    parameter FWD_WIDTH = 32,
    parameter MEM_ADDR_WIDTH = 9,
    parameter FWD_ADDR_WIDTH = 10,
    parameter MEM_LAT = 1
) (
    input wire clk,
    
    //Interface to forwarder
    input wire [FWD_ADDR_WIDTH-1:0] fwd_addr,
    output wire [FWD_WIDTH-1:0] fwd_rd_data,
    
    //Interface to packet mem
    output wire [MEM_ADDR_WIDTH-1:0] mem_addr,
    input wire [MEM_WIDTH-1:0] mem_rd_data
);
    
    `localparam N = FWD_ADDR_WIDTH - MEM_ADDR_WIDTH;
    `localparam RATIO = MEM_WIDTH/FWD_WIDTH;
    `localparam THISISFALSE = 0;
    genvar i;
    
//Double-check that MEM_WIDTH is a power-of-2 multiple of FWD_WIDTH.
//Sadly, Vivado always throws an error about a nonexistent wire, even if the
//condition is false. So we can only use this inside Icarus. Oh well, it's 
//better than nothing!
generate if (((MEM_WIDTH/FWD_WIDTH) != (2**N)) || ((MEM_WIDTH % FWD_WIDTH) != 0)) begin
`ifdef ICARUS_VERILOG
    assign mem_width_must_be_power_of_two_multiple_of_fwd_width = 0;
`else
    `localparam BAD_WIDTHS_IN_FWD_WIDTH_ADAPTER = 0;
`endif
end endgenerate
    
    //Offset into bigword where next value is read from
    //We need to hold onto each offset for MEM_LAT cycles
    wire [N -1:0] offset = fwd_addr[N -1:0];
    reg [N -1:0] offset_r[0: MEM_LAT - 1];
generate for (i = 0; i < MEM_LAT; i = i + 1) begin
    initial offset_r[i] = 0;
    if (i == 0) begin
        always @(posedge clk) offset_r[i] <= offset;
    end else begin
        always @(posedge clk) offset_r[i] <= offset_r[i - 1];
    end
end endgenerate
    
    //Assign outputs
    wire [FWD_WIDTH -1 :0] segments[0: RATIO-1];
    generate for (i = 0; i < RATIO; i = i+1) begin
        assign segments[i] = mem_rd_data[(i+1)*FWD_WIDTH-1 -: FWD_WIDTH];
    end endgenerate
    
    assign mem_addr = fwd_addr[FWD_ADDR_WIDTH -1: N];
    
    assign fwd_rd_data = segments[offset_r[MEM_LAT-1]];
    
endmodule

`undef localparam
