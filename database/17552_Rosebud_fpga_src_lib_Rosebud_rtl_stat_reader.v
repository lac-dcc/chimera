// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

module stat_reader # (
  parameter KEEP_WIDTH        = 8,
  parameter PORT_COUNT        = 4,
  parameter BYTE_COUNT_WIDTH  = 32,
  parameter FRAME_COUNT_WIDTH = 32,
  parameter PORT_CLUSTERS     = 2,

  // If KEEP_ENABLE is not 1, byte_count represents word count
  parameter KEEP_ENABLE       = KEEP_WIDTH>1,
  parameter PORT_WIDTH        = $clog2(PORT_COUNT)
) (
  input  wire                             clk,
  input  wire [PORT_COUNT-1:0]            port_rst,
  input  wire [PORT_COUNT-1:0]            port_clear,

  input  wire [PORT_COUNT*KEEP_WIDTH-1:0] monitor_axis_tkeep,
  input  wire [PORT_COUNT-1:0]            monitor_axis_tvalid,
  input  wire [PORT_COUNT-1:0]            monitor_axis_tready,
  input  wire [PORT_COUNT-1:0]            monitor_axis_tlast,
  input  wire [PORT_COUNT-1:0]            monitor_drop_pulse,

  input  wire [PORT_WIDTH-1:0]            port_select,
  input  wire [1:0]                       stat_addr,
  output reg  [31:0]                      stat_data
);

(* KEEP = "TRUE" *) reg [PORT_COUNT*KEEP_WIDTH-1:0] monitor_axis_tkeep_r;
(* KEEP = "TRUE" *) reg [PORT_COUNT-1:0]            monitor_axis_tvalid_r;
(* KEEP = "TRUE" *) reg [PORT_COUNT-1:0]            monitor_axis_tready_r;
(* KEEP = "TRUE" *) reg [PORT_COUNT-1:0]            monitor_axis_tlast_r;
(* KEEP = "TRUE" *) reg [PORT_COUNT-1:0]            monitor_drop_pulse_r;

always @ (posedge clk) begin
  monitor_axis_tkeep_r  <= monitor_axis_tkeep;
  monitor_axis_tvalid_r <= monitor_axis_tvalid & ~port_rst;
  monitor_axis_tready_r <= monitor_axis_tready;
  monitor_axis_tlast_r  <= monitor_axis_tlast;
  monitor_drop_pulse_r  <= monitor_drop_pulse;
end

localparam CEIL_PORT_COUNT   = 2**($clog2(PORT_COUNT));
localparam PORTS_PER_CLUSTER = CEIL_PORT_COUNT / PORT_CLUSTERS;
localparam LAST_SEL_BITS     = (PORTS_PER_CLUSTER>1) ? $clog2(PORTS_PER_CLUSTER) : 1 ;

(* KEEP = "TRUE" *) reg [PORT_WIDTH-1:0]                  port_select_r;
(* KEEP = "TRUE" *) reg [PORT_CLUSTERS*LAST_SEL_BITS-1:0] port_select_rr;
(* KEEP = "TRUE" *) reg [1:0]                             stat_addr_r;
(* KEEP = "TRUE" *) reg [PORT_CLUSTERS*2-1:0]             stat_addr_rr;
(* KEEP = "TRUE" *) reg [CEIL_PORT_COUNT*2-1:0]           stat_addr_rrr;

always @ (posedge clk) begin
  port_select_r  <= port_select;
  port_select_rr <= {PORT_CLUSTERS{port_select_r[LAST_SEL_BITS-1:0]}};

  stat_addr_r    <= stat_addr;
  stat_addr_rr   <= {PORT_CLUSTERS{stat_addr_r}};
  stat_addr_rrr  <= {PORTS_PER_CLUSTER{stat_addr_rr}};
end

wire [CEIL_PORT_COUNT*BYTE_COUNT_WIDTH-1:0]  byte_count_int;
wire [CEIL_PORT_COUNT*FRAME_COUNT_WIDTH-1:0] frame_count_int;
wire [CEIL_PORT_COUNT*FRAME_COUNT_WIDTH-1:0] drop_count_int;
wire [CEIL_PORT_COUNT*FRAME_COUNT_WIDTH-1:0] stall_count_int;

if (CEIL_PORT_COUNT != PORT_COUNT) begin
  assign byte_count_int [CEIL_PORT_COUNT*BYTE_COUNT_WIDTH -1:PORT_COUNT*BYTE_COUNT_WIDTH ]
                     = {(CEIL_PORT_COUNT-PORT_COUNT)*BYTE_COUNT_WIDTH{1'b0}};
  assign frame_count_int[CEIL_PORT_COUNT*FRAME_COUNT_WIDTH-1:PORT_COUNT*FRAME_COUNT_WIDTH]
                     = {(CEIL_PORT_COUNT-PORT_COUNT)*FRAME_COUNT_WIDTH{1'b0}};
  assign drop_count_int [CEIL_PORT_COUNT*FRAME_COUNT_WIDTH-1:PORT_COUNT*FRAME_COUNT_WIDTH]
                     = {(CEIL_PORT_COUNT-PORT_COUNT)*FRAME_COUNT_WIDTH{1'b0}};
  assign stall_count_int[CEIL_PORT_COUNT*FRAME_COUNT_WIDTH-1:PORT_COUNT*FRAME_COUNT_WIDTH]
                     = {(CEIL_PORT_COUNT-PORT_COUNT)*FRAME_COUNT_WIDTH{1'b0}};
end

genvar i;
generate
  for (i=0; i<PORT_COUNT; i=i+1) begin: axis_stat_counters
    axis_stat # (
      .KEEP_WIDTH(KEEP_WIDTH),
      .KEEP_ENABLE(KEEP_ENABLE),
      .BYTE_COUNT_WIDTH (BYTE_COUNT_WIDTH),
      .FRAME_COUNT_WIDTH(FRAME_COUNT_WIDTH)
    ) axis_stat_inst (
      .clk(clk),
      .rst(port_rst[i]),
      .clear(port_clear[i]),

      .monitor_axis_tkeep(monitor_axis_tkeep_r[i*KEEP_WIDTH+:KEEP_WIDTH]),
      .monitor_axis_tvalid(monitor_axis_tvalid_r[i]),
      .monitor_axis_tready(monitor_axis_tready_r[i]),
      .monitor_axis_tlast(monitor_axis_tlast_r[i]),
      .monitor_drop_pulse(monitor_drop_pulse_r[i]),

      .byte_count(byte_count_int[i*BYTE_COUNT_WIDTH +: BYTE_COUNT_WIDTH]),
      .frame_count(frame_count_int[i*FRAME_COUNT_WIDTH +: FRAME_COUNT_WIDTH]),
      .drop_count(drop_count_int[i*FRAME_COUNT_WIDTH +: FRAME_COUNT_WIDTH]),
      .stall_count(stall_count_int[i*FRAME_COUNT_WIDTH +: FRAME_COUNT_WIDTH])
    );
  end
endgenerate

// Two step selection
(* KEEP = "TRUE" *) reg [CEIL_PORT_COUNT*32-1:0] stat_data_int_r;
(* KEEP = "TRUE" *) reg [PORT_CLUSTERS*32-1:0]   stat_data_int_rr;

genvar k;
generate
  for (k=0; k<CEIL_PORT_COUNT; k=k+1) begin: stat_select
    always @ (posedge clk) begin
      case (stat_addr_rrr[k*2+:2])
        2'b00: stat_data_int_r[k*32+:32] <=
                  byte_count_int[k*BYTE_COUNT_WIDTH +: BYTE_COUNT_WIDTH];
        2'b01: stat_data_int_r[k*32+:32] <=
                  frame_count_int[k*FRAME_COUNT_WIDTH +: FRAME_COUNT_WIDTH];
        2'b10: stat_data_int_r[k*32+:32] <=
                  drop_count_int[k*FRAME_COUNT_WIDTH +: FRAME_COUNT_WIDTH];
        2'b11: stat_data_int_r[k*32+:32] <=
                  stall_count_int[k*FRAME_COUNT_WIDTH +: FRAME_COUNT_WIDTH];
      endcase
    end
  end
endgenerate

genvar j;
generate
  for (j=0; j<PORT_CLUSTERS; j=j+1) begin : select_lvl1
    // Selecting each cluster bits
    wire [LAST_SEL_BITS-1:0] cluster_port_sel =
                            port_select_rr[j*LAST_SEL_BITS +: LAST_SEL_BITS];

		wire [PORTS_PER_CLUSTER*32-1:0] cluster_stat_data =
	           stat_data_int_r[j*PORTS_PER_CLUSTER*32 +: PORTS_PER_CLUSTER*32];

    // First level selection among ports in a cluster
    always @ (posedge clk)
      stat_data_int_rr[j*32+:32]<= cluster_stat_data[cluster_port_sel*32+:32];
  end
endgenerate

// 2nd and last level of selection
if (PORT_CLUSTERS == 1) begin: single_cluster
  always @ (posedge clk) begin
    stat_data  <= stat_data_int_rr;
  end
end else begin: cluster_select
  always @ (posedge clk) begin
    stat_data  <= stat_data_int_rr
                  [port_select_r[PORT_WIDTH-1:LAST_SEL_BITS]*32 +: 32];
  end
end

endmodule

`resetall
