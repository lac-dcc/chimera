// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2022 Moein Khazraee

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

module cmd_stat_sys # (
  parameter CORE_COUNT      = 16,
  parameter PORT_COUNT      = 5,
  parameter LB_PORT_COUNT   = 3,
  parameter KEEP_WIDTH      = 8,
  parameter BC_MSG_CLUSTERS = 4,
  parameter STAT_CLUSTERS   = 2,
  parameter RX_LINES_WIDTH  = 8,
  parameter CORE_WIDTH      = $clog2(CORE_COUNT),
  parameter PORT_WIDTH      = $clog2(PORT_COUNT),
  parameter CMD_PIPE_LEN    = 2
) (
  input  wire                                    core_clk,
  input  wire                                    core_rst,
  input  wire                                    sys_clk,
  input  wire                                    sys_rst,

  // Host command and readback data
  input  wire [31:0]                             host_cmd,
  input  wire [31:0]                             host_cmd_wr_data,
  output wire [31:0]                             host_cmd_rd_data,
  input  wire                                    host_cmd_valid,

  // Filtered host command for load balancer and rpus, and lb read back data
  output wire [28:0]                             host_cmd_lb,
  output wire                                    host_cmd_lb_for_ints,
  input  wire [31:0]                             host_cmd_lb_rd_data,
  output wire                                    host_cmd_lb_valid,

  output wire                                    host_cmd_rpus_valid,
  output wire [3:0]                              host_cmd_rpus_reg,
  output wire [CORE_WIDTH-1:0]                   host_cmd_rpus_dest,
  output wire [31:0]                             host_cmd_ext_wr_data,

  // Status inputs from interfaces and core, and enable output for interfaces
  output wire [CORE_COUNT*4-1:0]                 rpu_stat_addr,
  input  wire [CORE_COUNT*32-1:0]                rpu_stat_data,
  input  wire [LB_PORT_COUNT*RX_LINES_WIDTH-1:0] rx_line_count,
  output reg  [LB_PORT_COUNT-1:0]                rx_int_enable,

  // RX and TX channels for monitorring
  input  wire [PORT_COUNT*KEEP_WIDTH-1:0]        rx_axis_tkeep,
  input  wire [PORT_COUNT-1:0]                   rx_axis_tvalid,
  input  wire [PORT_COUNT-1:0]                   rx_axis_tready,
  input  wire [PORT_COUNT-1:0]                   rx_axis_tlast,
  input  wire [PORT_COUNT-1:0]                   rx_drop_pulse,

  input  wire [PORT_COUNT*KEEP_WIDTH-1:0]        tx_axis_tkeep,
  input  wire [PORT_COUNT-1:0]                   tx_axis_tvalid,
  input  wire [PORT_COUNT-1:0]                   tx_axis_tready,
  input  wire [PORT_COUNT-1:0]                   tx_axis_tlast,
  input  wire [PORT_COUNT-1:0]                   tx_drop_pulse
);

  localparam BYTE_COUNT_WIDTH  = 32;
  localparam FRAME_COUNT_WIDTH = 32;
  localparam CORES_PER_CLUSTER = CORE_COUNT / BC_MSG_CLUSTERS;
  localparam LAST_SEL_BITS     = CORE_WIDTH + 4 - $clog2(BC_MSG_CLUSTERS);

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////// Host command parsing and registering ////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  // host_cmd bit 31 is WR/RD. bits 30:29 are target, 00 is for cores,
  // 01 is for interfaces, and 1* is for load balancer.
  // also latching the output
  reg  [31:0] host_cmd_n;
  reg  [31:0] host_cmd_wr_data_n;
  reg         host_cmd_lb_wr_n;
  reg         host_to_cores_wr_n;
  reg         host_to_ints_wr_n;

  always @ (posedge sys_clk) begin
    if (sys_rst) begin
      host_cmd_lb_wr_n   <= 1'b0;
      host_to_cores_wr_n <= 1'b0;
      host_to_ints_wr_n  <= 1'b0;
    end else begin
      host_cmd_lb_wr_n   <= host_cmd_valid && host_cmd[30] && host_cmd[31];
      host_to_cores_wr_n <= host_cmd_valid &&
                           (host_cmd[30:29]==2'b00) && host_cmd[31];
      host_to_ints_wr_n  <= host_cmd_valid &&
                           (host_cmd[30:29]==2'b01) && host_cmd[31];
    end

    if (host_cmd_valid) begin
      host_cmd_n         <= host_cmd;
      host_cmd_wr_data_n <= host_cmd_wr_data;
    end

  end

  // Pipe_reg to help with the timing
  wire [31:0] host_cmd_r;
  wire [31:0] host_cmd_wr_data_r;
  wire        host_to_cores_wr_r;
  wire        host_to_ints_wr_r;
  wire        host_cmd_lb_wr_r;

  pipe_reg #(.WIDTH(32+32+3), .N(CMD_PIPE_LEN)) host_cmd_wr_pipe_reg (
    .clk(sys_clk),
    .in( {host_cmd_wr_data_n, host_cmd_n, host_cmd_lb_wr_n,
          host_to_cores_wr_n, host_to_ints_wr_n}),
    .out({host_cmd_wr_data_r, host_cmd_r, host_cmd_lb_wr_r,
          host_to_cores_wr_r, host_to_ints_wr_r})
  );

  ///////////////////////////////////////////////////////////////////////////////
  /////////////////////// Host command split and readback ///////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  // Splitting the host cmd for readback
  wire [1:0]            host_cmd_type     = host_cmd_r[30:29];
  wire [PORT_WIDTH-1:0] interface_sel     = host_cmd_r[PORT_WIDTH+4-1:4];
  wire [3:0]            host_reg_sel      = host_cmd_r[3:0];
  wire [1:0]            interface_reg_sel = host_cmd_r[1:0];

  // Data selection for load balancer and interface, interface has only one type of write.
  always @ (posedge sys_clk)
    if (sys_rst)
      rx_int_enable <= {LB_PORT_COUNT{1'b1}};
    else if (host_to_ints_wr_r)
      rx_int_enable <= host_cmd_wr_data_r[LB_PORT_COUNT-1:0];

  wire [31:0] host_rd_lb_data;

  assign host_cmd_lb          = host_cmd_r[28:0]; // bit 31-29 used elsewhere
  assign host_cmd_lb_for_ints = host_cmd_r[29];
  assign host_rd_lb_data      = host_cmd_lb_rd_data;
  assign host_cmd_lb_valid    = host_cmd_lb_wr_r;
  assign host_cmd_ext_wr_data = host_cmd_wr_data_r;
  assign host_cmd_rpus_valid  = host_to_cores_wr_r;
  assign host_cmd_rpus_dest   = host_cmd_r[CORE_WIDTH+4-1:4];
  assign host_cmd_rpus_reg    = host_reg_sel;

  reg [RX_LINES_WIDTH-1:0] rx_line_muxed;
  always @ (posedge sys_clk)
    rx_line_muxed <= rx_line_count[interface_sel*RX_LINES_WIDTH +: RX_LINES_WIDTH];

  wire [31:0] interface_in_stat_data;
  wire [31:0] interface_out_stat_data;
  reg  [31:0] int_stat_data_muxed;
  always @ (*) begin
    casex (host_reg_sel)
      4'b0000: int_stat_data_muxed = {{(32-LB_PORT_COUNT){1'b0}}, rx_int_enable};
      4'b0100: int_stat_data_muxed = {{(32-RX_LINES_WIDTH){1'b0}}, rx_line_muxed};
      4'b10??: int_stat_data_muxed = interface_in_stat_data;
      4'b11??: int_stat_data_muxed = interface_out_stat_data;
      default: int_stat_data_muxed = 32'hFEFEFEFE;
    endcase
  end

  wire [31:0] rpu_stat_data_muxed;
  reg  [31:0] host_cmd_rd_data_n;
  always @ (posedge sys_clk)
    casex (host_cmd_type)
      2'b00: host_cmd_rd_data_n <= rpu_stat_data_muxed;
      2'b01: host_cmd_rd_data_n <= int_stat_data_muxed;
      2'b1?: host_cmd_rd_data_n <= host_rd_lb_data;
    endcase

  // Clock crossing and pipe register for host readback
  pipe_reg #(.WIDTH(32), .N(CMD_PIPE_LEN)) host_cmd_rd_pipe_reg (
    .clk(sys_clk),
    .in(host_cmd_rd_data_n),
    .out(host_cmd_rd_data)
  );

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////// RX and TX monitors with selection ///////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  stat_reader # (
    .KEEP_WIDTH(KEEP_WIDTH),
    .PORT_COUNT(PORT_COUNT),
    .BYTE_COUNT_WIDTH(BYTE_COUNT_WIDTH),
    .FRAME_COUNT_WIDTH(FRAME_COUNT_WIDTH),
    .PORT_WIDTH(PORT_WIDTH),
    .PORT_CLUSTERS(STAT_CLUSTERS)
  ) interface_incoming_stat (
    .clk(sys_clk),
    .port_rst({PORT_COUNT{sys_rst}}),
    .port_clear({PORT_COUNT{1'b0}}),

    .monitor_axis_tkeep (rx_axis_tkeep),
    .monitor_axis_tvalid(rx_axis_tvalid),
    .monitor_axis_tready(rx_axis_tready),
    .monitor_axis_tlast (rx_axis_tlast),
    .monitor_drop_pulse (rx_drop_pulse),

    .port_select(interface_sel),
    .stat_addr(interface_reg_sel),
    .stat_data(interface_in_stat_data)
  );

  stat_reader # (
    .KEEP_WIDTH(KEEP_WIDTH),
    .PORT_COUNT(PORT_COUNT),
    .BYTE_COUNT_WIDTH(BYTE_COUNT_WIDTH),
    .FRAME_COUNT_WIDTH(FRAME_COUNT_WIDTH),
    .PORT_WIDTH(PORT_WIDTH),
    .PORT_CLUSTERS(STAT_CLUSTERS)
  ) interface_outgoing_stat (
    .clk(sys_clk),
    .port_rst({PORT_COUNT{sys_rst}}),
    .port_clear({PORT_COUNT{1'b0}}),

    .monitor_axis_tkeep (tx_axis_tkeep),
    .monitor_axis_tvalid(tx_axis_tvalid),
    .monitor_axis_tready(tx_axis_tready),
    .monitor_axis_tlast (tx_axis_tlast),
    .monitor_drop_pulse (tx_drop_pulse),

    .port_select(interface_sel),
    .stat_addr(interface_reg_sel),
    .stat_data(interface_out_stat_data)
  );

  ///////////////////////////////////////////////////////////////////////////////
  /////////////////////////////// RPU stat mux //////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  wire [CORE_WIDTH-1:0] host_core_select;
  wire [3:0]            host_reg_core;
  simple_sync_sig # (.RST_VAL(1'b0),.WIDTH(CORE_WIDTH+4)) host_to_core_sync_reg (
    .dst_clk(core_clk),
    .dst_rst(core_rst),
    .in({host_cmd_r[CORE_WIDTH+4-1:4], host_cmd_r[3:0]}),
    .out({host_core_select, host_reg_core})
  );

  (* KEEP = "TRUE" *) reg [CORE_WIDTH+4-1:0] core_select_r;
  (* KEEP = "TRUE" *) reg [BC_MSG_CLUSTERS*LAST_SEL_BITS-1:0] core_select_rr;
  (* KEEP = "TRUE" *) reg [CORE_COUNT*32-1:0] rpu_stat_data_r;

  always @ (posedge core_clk) begin
    core_select_r    <= {host_core_select, host_reg_core};
    core_select_rr   <= {BC_MSG_CLUSTERS{core_select_r[LAST_SEL_BITS-1:0]}};
    rpu_stat_data_r <= rpu_stat_data;
  end

  (* KEEP = "TRUE" *) reg  [CORE_COUNT*4-1:0] rpu_stat_addr_r;
  reg [BC_MSG_CLUSTERS*32-1:0] rpu_stat_data_rr;
  genvar p;
  generate
    for (p=0; p<BC_MSG_CLUSTERS; p=p+1) begin : in_cluster_stat_sel

      wire [$clog2(CORES_PER_CLUSTER)-1:0] cluster_core_sel =
        core_select_rr[p*LAST_SEL_BITS+4+:$clog2(CORES_PER_CLUSTER)];


      wire [CORES_PER_CLUSTER*32-1:0]  cluster_stat_data =
                          rpu_stat_data_r[p*CORES_PER_CLUSTER*32
                                          +: CORES_PER_CLUSTER*32];
      always @ (posedge core_clk) begin
        rpu_stat_data_rr [p*32 +: 32] <=
            cluster_stat_data [cluster_core_sel*32 +: 32];

      rpu_stat_addr_r[p*CORES_PER_CLUSTER*4 +: 4*CORES_PER_CLUSTER] <=
        {CORES_PER_CLUSTER{core_select_rr[p*LAST_SEL_BITS +: 4]}};
      end

    end
  endgenerate

  assign rpu_stat_addr = rpu_stat_addr_r;

  reg [31:0] rpu_stat_data_muxed_n;
  if (BC_MSG_CLUSTERS == 1) begin: single_cluster
    always @ (posedge core_clk)
      rpu_stat_data_muxed_n <= rpu_stat_data_rr;
  end else begin: cluster_stat_sel
    always @ (posedge core_clk)
      rpu_stat_data_muxed_n <=
        rpu_stat_data_rr[core_select_r[CORE_WIDTH+4-1:LAST_SEL_BITS]*32  +: 32];
  end

  // Core stat clock crossing or extra pipe registesr
  simple_sync_sig # (.RST_VAL(1'b0),.WIDTH(32)) rpu_stat_data_sync_reg (
    .dst_clk(sys_clk),
    .dst_rst(sys_rst),
    .in (rpu_stat_data_muxed_n),
    .out(rpu_stat_data_muxed)
  );

endmodule

`resetall
