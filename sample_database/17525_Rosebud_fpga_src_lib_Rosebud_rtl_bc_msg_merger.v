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

module bc_msg_merger # (
  parameter CORE_COUNT      = 16,
  parameter BC_MSG_CLUSTERS = 4,
  parameter BC_REGION_SIZE  = 8192,
  parameter CORE_WIDTH      = $clog2(CORE_COUNT),
  parameter CORE_MSG_WIDTH  = 32+4+$clog2(BC_REGION_SIZE)-2,
  parameter REG_TYPE        = 0 // Default bypass
) (
  input  wire                             clk,
  input  wire                             rst,

  // Input from all RPUs
  input  wire [CORE_COUNT*CORE_MSG_WIDTH-1:0] s_axis_tdata,
  input  wire [CORE_COUNT*CORE_WIDTH-1:0]     s_axis_tuser,
  input  wire [CORE_COUNT-1:0]                s_axis_tvalid,
  output wire [CORE_COUNT-1:0]                s_axis_tready,

  // Merged output going to all RPUs, no ready as they will accept
  output wire [CORE_COUNT*CORE_MSG_WIDTH-1:0] m_axis_tdata,
  output wire [CORE_COUNT*CORE_WIDTH-1:0]     m_axis_tuser,
  output wire [CORE_COUNT-1:0]                m_axis_tvalid
);

  localparam CORES_PER_CLUSTER = CORE_COUNT / BC_MSG_CLUSTERS;

  // Register core message outputs
  wire [CORE_COUNT*CORE_MSG_WIDTH-1:0] s_axis_tdata_r;
  wire [CORE_COUNT*CORE_WIDTH-1:0]     s_axis_tuser_r;
  wire [CORE_COUNT-1:0]                s_axis_tvalid_r;
  wire [CORE_COUNT-1:0]                s_axis_tready_r;

  genvar n;
  generate
    for (n=0; n<CORE_COUNT; n=n+1) begin: bc_msg_out_regs
      axis_register # (
        .DATA_WIDTH(CORE_MSG_WIDTH),
        .KEEP_ENABLE(0),
        .KEEP_WIDTH(1),
        .LAST_ENABLE(0),
        .DEST_ENABLE(0),
        .USER_ENABLE(1),
        .USER_WIDTH(CORE_WIDTH),
        .ID_ENABLE(0),
        .REG_TYPE(REG_TYPE)
      ) bc_msg_out_register (
        .clk(clk),
        .rst(rst),

        .s_axis_tdata(s_axis_tdata[n*CORE_MSG_WIDTH +: CORE_MSG_WIDTH]),
        .s_axis_tkeep(1'b0),
        .s_axis_tvalid(s_axis_tvalid[n]),
        .s_axis_tready(s_axis_tready[n]),
        .s_axis_tlast(1'b0),
        .s_axis_tid(8'd0),
        .s_axis_tdest(8'd0),
        .s_axis_tuser(s_axis_tuser[n*CORE_WIDTH +: CORE_WIDTH]),

        .m_axis_tdata(s_axis_tdata_r[n*CORE_MSG_WIDTH +: CORE_MSG_WIDTH]),
        .m_axis_tkeep(),
        .m_axis_tvalid(s_axis_tvalid_r[n]),
        .m_axis_tready(s_axis_tready_r[n]),
        .m_axis_tlast(),
        .m_axis_tid(),
        .m_axis_tdest(),
        .m_axis_tuser(s_axis_tuser_r[n*CORE_WIDTH +: CORE_WIDTH])
      );
    end
  endgenerate

  // Merge the boradcast messages
  wire [CORE_MSG_WIDTH-1:0]            core_msg_merged_data;
  wire [CORE_WIDTH-1:0]                core_msg_merged_user;
  wire                                 core_msg_merged_valid;
  wire                                 core_msg_merged_ready;

  axis_simple_arb_2lvl # (
      .S_COUNT         (CORE_COUNT),
      .DATA_WIDTH      (CORE_MSG_WIDTH),
      .USER_ENABLE     (1),
      .USER_WIDTH      (CORE_WIDTH),
      .CLUSTER_COUNT   (BC_MSG_CLUSTERS),
      .STAGE_FIFO_DEPTH(16)
  ) cores_to_broadcaster (

      .clk(clk),
      .rst(rst),

      .s_axis_tdata(s_axis_tdata_r),
      .s_axis_tvalid(s_axis_tvalid_r),
      .s_axis_tready(s_axis_tready_r),
      .s_axis_tuser(s_axis_tuser_r),

      .m_axis_tdata(core_msg_merged_data),
      .m_axis_tvalid(core_msg_merged_valid),
      .m_axis_tready(core_msg_merged_ready),
      .m_axis_tuser(core_msg_merged_user)
  );

  (* KEEP = "TRUE" *) reg [BC_MSG_CLUSTERS*CORE_MSG_WIDTH-1:0] core_msg_merged_data_r;
  (* KEEP = "TRUE" *) reg [BC_MSG_CLUSTERS*CORE_WIDTH-1:0]     core_msg_merged_user_r;
  (* KEEP = "TRUE" *) reg [BC_MSG_CLUSTERS-1:0]                core_msg_merged_valid_r;

  always @ (posedge clk) begin
      core_msg_merged_data_r  <= {BC_MSG_CLUSTERS{core_msg_merged_data}};
      core_msg_merged_user_r  <= {BC_MSG_CLUSTERS{core_msg_merged_user}};
      core_msg_merged_valid_r <= {BC_MSG_CLUSTERS{core_msg_merged_valid}};
      if (rst)
        core_msg_merged_valid_r <= {BC_MSG_CLUSTERS{1'b0}};
  end

  assign core_msg_merged_ready = 1'b1;

  // Broadcast the arbitted core messages.
  (* KEEP = "TRUE" *) reg [CORE_COUNT*CORE_MSG_WIDTH-1:0] m_axis_tdata_n;
  (* KEEP = "TRUE" *) reg [CORE_COUNT*CORE_WIDTH-1:0]     m_axis_tuser_n;
  (* KEEP = "TRUE" *) reg [CORE_COUNT-1:0]                m_axis_tvalid_n;

  always @ (posedge clk) begin
      m_axis_tdata_n  <= {CORES_PER_CLUSTER{core_msg_merged_data_r}};
      m_axis_tuser_n  <= {CORES_PER_CLUSTER{core_msg_merged_user_r}};
      m_axis_tvalid_n <= {CORES_PER_CLUSTER{core_msg_merged_valid_r}};
      if (rst)
          m_axis_tvalid_n <= {CORE_COUNT{1'b0}};
  end

  // Additional register level.
  (* KEEP = "TRUE" *) reg [CORE_COUNT*CORE_MSG_WIDTH-1:0] m_axis_tdata_r;
  (* KEEP = "TRUE" *) reg [CORE_COUNT*CORE_WIDTH-1:0]     m_axis_tuser_r;
  (* KEEP = "TRUE" *) reg [CORE_COUNT-1:0]                m_axis_tvalid_r;

  always @ (posedge clk) begin
      m_axis_tdata_r  <= m_axis_tdata_n;
      m_axis_tuser_r  <= m_axis_tuser_n;
      m_axis_tvalid_r <= m_axis_tvalid_n;
      if (rst)
          m_axis_tvalid_r <= {CORE_COUNT{1'b0}};
  end

  assign m_axis_tdata  = m_axis_tdata_r;
  assign m_axis_tuser  = m_axis_tuser_r;
  assign m_axis_tvalid = m_axis_tvalid_r;

endmodule

`resetall
