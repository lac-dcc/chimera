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

/*
 * AXI4-Stream switch
 */
module axis_switch_2lvl # (
    // Number of AXI stream inputs
    parameter S_COUNT = 4,
    // Number of AXI stream outputs
    parameter M_COUNT = 4,
    // Width of AXI stream interfaces in bits
    parameter S_DATA_WIDTH = 8,
    // Propagate tkeep signal
    parameter S_KEEP_ENABLE = (S_DATA_WIDTH>8),
    // tkeep signal width (words per cycle)
    parameter S_KEEP_WIDTH = S_KEEP_ENABLE ? (S_DATA_WIDTH/8) : 1,
    // no need for tdest if there is only single output
    parameter S_DEST_ENABLE = (M_COUNT >1),
    // tdest signal width
    // must be wide enough to uniquely address outputs
    parameter S_DEST_WIDTH = S_DEST_ENABLE ? $clog2(M_COUNT) : 1,
    // Width of AXI stream interfaces in bits
    parameter M_DATA_WIDTH = 8,
    // Propagate tkeep signal
    parameter M_KEEP_ENABLE = (M_DATA_WIDTH>8),
    // tkeep signal width (words per cycle)
    parameter M_KEEP_WIDTH  = M_KEEP_ENABLE ? (M_DATA_WIDTH/8) : 1,
    // output tdest signal
    parameter M_DEST_ENABLE = (S_DEST_ENABLE && (S_DEST_WIDTH > $clog2(M_COUNT))),
    // output tdest width
    parameter M_DEST_WIDTH  = M_DEST_ENABLE ? S_DEST_WIDTH-$clog2(M_COUNT) : 1,
    // Propagate tid signal
    parameter ID_ENABLE = 0,
    // tid signal width
    parameter ID_WIDTH = 1,
    // Propagate tuser signal
    parameter USER_ENABLE = 1,
    // tuser signal width
    parameter USER_WIDTH = 1,
    // Input interface register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter S_REG_TYPE = 2,
    // Output interface register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter M_REG_TYPE = 2,
    // select round robin arbitration
    parameter ARB_TYPE_ROUND_ROBIN = 1,
    // LSB priority selection
    parameter ARB_LSB_HIGH_PRIORITY = 1,
    // Number of second stage switches
    parameter CLUSTER_COUNT = 4,
    // To use stage FIFO
    // Size of stage FIFOes
    parameter STAGE_FIFO_DEPTH = 8192,
    // Frame FIFO mode - operate on frames instead of cycles
    // When set, m_axis_tvalid will not be deasserted within a frame
    // Requires LAST_ENABLE set
    parameter FRAME_FIFO = 0,
    parameter SEPARATE_CLOCKS = 0,
    parameter USE_SIMPLE_SW = 1,
    parameter RAM_PIPELINE = 2
) (
    /*
     * AXI Stream inputs
     */
    input  wire                            s_clk,
    input  wire                            s_rst,
    input  wire [S_COUNT*S_DATA_WIDTH-1:0] s_axis_tdata,
    input  wire [S_COUNT*S_KEEP_WIDTH-1:0] s_axis_tkeep,
    input  wire [S_COUNT-1:0]              s_axis_tvalid,
    output wire [S_COUNT-1:0]              s_axis_tready,
    input  wire [S_COUNT-1:0]              s_axis_tlast,
    input  wire [S_COUNT*ID_WIDTH-1:0]     s_axis_tid,
    input  wire [S_COUNT*S_DEST_WIDTH-1:0] s_axis_tdest,
    input  wire [S_COUNT*USER_WIDTH-1:0]   s_axis_tuser,

    /*
     * AXI Stream outputs
     */
    input  wire                            m_clk,
    input  wire                            m_rst,
    output wire [M_COUNT*M_DATA_WIDTH-1:0] m_axis_tdata,
    output wire [M_COUNT*M_KEEP_WIDTH-1:0] m_axis_tkeep,
    output wire [M_COUNT-1:0]              m_axis_tvalid,
    input  wire [M_COUNT-1:0]              m_axis_tready,
    output wire [M_COUNT-1:0]              m_axis_tlast,
    output wire [M_COUNT*ID_WIDTH-1:0]     m_axis_tid,
    output wire [M_COUNT*M_DEST_WIDTH-1:0] m_axis_tdest,
    output wire [M_COUNT*USER_WIDTH-1:0]   m_axis_tuser
);

initial begin
    if ((STAGE_FIFO_DEPTH==0)&&((M_DATA_WIDTH!=S_DATA_WIDTH)||SEPARATE_CLOCKS)) begin
        $error("Error: There needs to be a FIFO for width conversion or clock domain crossing");
        $finish;
    end
end

// reset_sync
wire s_rst_r, m_rst_r;
sync_reset sync_s_rst_inst (
  .clk(s_clk),
  .rst(s_rst),
  .out(s_rst_r)
);

sync_reset sync_m_rst_inst (
  .clk(m_clk),
  .rst(m_rst),
  .out(m_rst_r)
);

if (S_COUNT >= M_COUNT) begin: shrink
    if ((S_DATA_WIDTH==M_DATA_WIDTH)||(S_COUNT==CLUSTER_COUNT)||USE_SIMPLE_SW) begin
        axis_simple_sw_shrink # (
            .S_COUNT              (S_COUNT),
            .M_COUNT              (M_COUNT),
            .S_DATA_WIDTH         (S_DATA_WIDTH),
            .S_KEEP_ENABLE        (S_KEEP_ENABLE),
            .S_KEEP_WIDTH         (S_KEEP_WIDTH),
            .S_DEST_ENABLE        (S_DEST_ENABLE),
            .S_DEST_WIDTH         (S_DEST_WIDTH),
            .M_DATA_WIDTH         (M_DATA_WIDTH),
            .M_KEEP_ENABLE        (M_KEEP_ENABLE),
            .M_KEEP_WIDTH         (M_KEEP_WIDTH),
            .M_DEST_ENABLE        (M_DEST_ENABLE),
            .M_DEST_WIDTH         (M_DEST_WIDTH),
            .ID_ENABLE            (ID_ENABLE),
            .ID_WIDTH             (ID_WIDTH),
            .USER_ENABLE          (USER_ENABLE),
            .USER_WIDTH           (USER_WIDTH),
            .S_REG_TYPE           (S_REG_TYPE),
            .M_REG_TYPE           (M_REG_TYPE),
            .ARB_TYPE_ROUND_ROBIN (ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
            .CLUSTER_COUNT        (CLUSTER_COUNT),
            .STAGE_FIFO_DEPTH     (STAGE_FIFO_DEPTH),
            .RAM_PIPELINE         (RAM_PIPELINE),
            .FRAME_FIFO           (FRAME_FIFO),
            .SEPARATE_CLOCKS      (SEPARATE_CLOCKS)
        ) axis_switch_2lvl_shrink_inst (
            .s_clk        (s_clk),
            .s_rst        (s_rst_r),
            .s_axis_tdata (s_axis_tdata),
            .s_axis_tkeep (s_axis_tkeep),
            .s_axis_tvalid(s_axis_tvalid),
            .s_axis_tready(s_axis_tready),
            .s_axis_tlast (s_axis_tlast),
            .s_axis_tid   (s_axis_tid),
            .s_axis_tdest (s_axis_tdest),
            .s_axis_tuser (s_axis_tuser),

            .m_clk        (m_clk),
            .m_rst        (m_rst_r),
            .m_axis_tdata (m_axis_tdata),
            .m_axis_tkeep (m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(m_axis_tready),
            .m_axis_tlast (m_axis_tlast),
            .m_axis_tid   (m_axis_tid),
            .m_axis_tdest (m_axis_tdest),
            .m_axis_tuser (m_axis_tuser)
        );
    end else begin
        axis_ram_sw_shrink # (
            .S_COUNT              (S_COUNT),
            .M_COUNT              (M_COUNT),
            .S_DATA_WIDTH         (S_DATA_WIDTH),
            .S_KEEP_ENABLE        (S_KEEP_ENABLE),
            .S_KEEP_WIDTH         (S_KEEP_WIDTH),
            .S_DEST_ENABLE        (S_DEST_ENABLE),
            .S_DEST_WIDTH         (S_DEST_WIDTH),
            .M_DATA_WIDTH         (M_DATA_WIDTH),
            .M_KEEP_ENABLE        (M_KEEP_ENABLE),
            .M_KEEP_WIDTH         (M_KEEP_WIDTH),
            .M_DEST_ENABLE        (M_DEST_ENABLE),
            .M_DEST_WIDTH         (M_DEST_WIDTH),
            .ID_ENABLE            (ID_ENABLE),
            .ID_WIDTH             (ID_WIDTH),
            .USER_ENABLE          (USER_ENABLE),
            .USER_WIDTH           (USER_WIDTH),
            .S_REG_TYPE           (S_REG_TYPE),
            .M_REG_TYPE           (M_REG_TYPE),
            .ARB_TYPE_ROUND_ROBIN (ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
            .CLUSTER_COUNT        (CLUSTER_COUNT),
            .STAGE_FIFO_DEPTH     (STAGE_FIFO_DEPTH),
            .RAM_PIPELINE         (RAM_PIPELINE),
            .FRAME_FIFO           (FRAME_FIFO),
            .SEPARATE_CLOCKS      (SEPARATE_CLOCKS)
        ) axis_switch_2lvl_shrink_inst (
            .s_clk        (s_clk),
            .s_rst        (s_rst_r),
            .s_axis_tdata (s_axis_tdata),
            .s_axis_tkeep (s_axis_tkeep),
            .s_axis_tvalid(s_axis_tvalid),
            .s_axis_tready(s_axis_tready),
            .s_axis_tlast (s_axis_tlast),
            .s_axis_tid   (s_axis_tid),
            .s_axis_tdest (s_axis_tdest),
            .s_axis_tuser (s_axis_tuser),

            .m_clk        (m_clk),
            .m_rst        (m_rst_r),
            .m_axis_tdata (m_axis_tdata),
            .m_axis_tkeep (m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(m_axis_tready),
            .m_axis_tlast (m_axis_tlast),
            .m_axis_tid   (m_axis_tid),
            .m_axis_tdest (m_axis_tdest),
            .m_axis_tuser (m_axis_tuser)
        );
    end
end else begin: grow
    if ((S_DATA_WIDTH==M_DATA_WIDTH)||(M_COUNT==CLUSTER_COUNT)||USE_SIMPLE_SW) begin
        axis_simple_sw_grow # (
            .S_COUNT              (S_COUNT),
            .M_COUNT              (M_COUNT),
            .S_DATA_WIDTH         (S_DATA_WIDTH),
            .S_KEEP_ENABLE        (S_KEEP_ENABLE),
            .S_KEEP_WIDTH         (S_KEEP_WIDTH),
            .S_DEST_ENABLE        (S_DEST_ENABLE),
            .S_DEST_WIDTH         (S_DEST_WIDTH),
            .M_DATA_WIDTH         (M_DATA_WIDTH),
            .M_KEEP_ENABLE        (M_KEEP_ENABLE),
            .M_KEEP_WIDTH         (M_KEEP_WIDTH),
            .M_DEST_ENABLE        (M_DEST_ENABLE),
            .M_DEST_WIDTH         (M_DEST_WIDTH),
            .ID_ENABLE            (ID_ENABLE),
            .ID_WIDTH             (ID_WIDTH),
            .USER_ENABLE          (USER_ENABLE),
            .USER_WIDTH           (USER_WIDTH),
            .S_REG_TYPE           (S_REG_TYPE),
            .M_REG_TYPE           (M_REG_TYPE),
            .ARB_TYPE_ROUND_ROBIN (ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
            .CLUSTER_COUNT        (CLUSTER_COUNT),
            .STAGE_FIFO_DEPTH     (STAGE_FIFO_DEPTH),
            .RAM_PIPELINE         (RAM_PIPELINE),
            .FRAME_FIFO           (FRAME_FIFO),
            .SEPARATE_CLOCKS      (SEPARATE_CLOCKS)
        ) axis_switch_2lvl_grow_inst (
            .s_clk        (s_clk),
            .s_rst        (s_rst_r),
            .s_axis_tdata (s_axis_tdata),
            .s_axis_tkeep (s_axis_tkeep),
            .s_axis_tvalid(s_axis_tvalid),
            .s_axis_tready(s_axis_tready),
            .s_axis_tlast (s_axis_tlast),
            .s_axis_tid   (s_axis_tid),
            .s_axis_tdest (s_axis_tdest),
            .s_axis_tuser (s_axis_tuser),

            .m_clk        (m_clk),
            .m_rst        (m_rst_r),
            .m_axis_tdata (m_axis_tdata),
            .m_axis_tkeep (m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(m_axis_tready),
            .m_axis_tlast (m_axis_tlast),
            .m_axis_tid   (m_axis_tid),
            .m_axis_tdest (m_axis_tdest),
            .m_axis_tuser (m_axis_tuser)
        );
    end else begin
        axis_ram_sw_grow # (
            .S_COUNT              (S_COUNT),
            .M_COUNT              (M_COUNT),
            .S_DATA_WIDTH         (S_DATA_WIDTH),
            .S_KEEP_ENABLE        (S_KEEP_ENABLE),
            .S_KEEP_WIDTH         (S_KEEP_WIDTH),
            .S_DEST_ENABLE        (S_DEST_ENABLE),
            .S_DEST_WIDTH         (S_DEST_WIDTH),
            .M_DATA_WIDTH         (M_DATA_WIDTH),
            .M_KEEP_ENABLE        (M_KEEP_ENABLE),
            .M_KEEP_WIDTH         (M_KEEP_WIDTH),
            .M_DEST_ENABLE        (M_DEST_ENABLE),
            .M_DEST_WIDTH         (M_DEST_WIDTH),
            .ID_ENABLE            (ID_ENABLE),
            .ID_WIDTH             (ID_WIDTH),
            .USER_ENABLE          (USER_ENABLE),
            .USER_WIDTH           (USER_WIDTH),
            .S_REG_TYPE           (S_REG_TYPE),
            .M_REG_TYPE           (M_REG_TYPE),
            .ARB_TYPE_ROUND_ROBIN (ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
            .CLUSTER_COUNT        (CLUSTER_COUNT),
            .STAGE_FIFO_DEPTH     (STAGE_FIFO_DEPTH),
            .RAM_PIPELINE         (RAM_PIPELINE),
            .FRAME_FIFO           (FRAME_FIFO),
            .SEPARATE_CLOCKS      (SEPARATE_CLOCKS)
        ) axis_switch_2lvl_grow_inst (
            .s_clk        (s_clk),
            .s_rst        (s_rst_r),
            .s_axis_tdata (s_axis_tdata),
            .s_axis_tkeep (s_axis_tkeep),
            .s_axis_tvalid(s_axis_tvalid),
            .s_axis_tready(s_axis_tready),
            .s_axis_tlast (s_axis_tlast),
            .s_axis_tid   (s_axis_tid),
            .s_axis_tdest (s_axis_tdest),
            .s_axis_tuser (s_axis_tuser),

            .m_clk        (m_clk),
            .m_rst        (m_rst_r),
            .m_axis_tdata (m_axis_tdata),
            .m_axis_tkeep (m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(m_axis_tready),
            .m_axis_tlast (m_axis_tlast),
            .m_axis_tid   (m_axis_tid),
            .m_axis_tdest (m_axis_tdest),
            .m_axis_tuser (m_axis_tuser)
        );
    end
end

endmodule

module axis_simple_sw_shrink # (
    parameter S_COUNT               = 4,
    parameter M_COUNT               = 4,
    parameter S_DATA_WIDTH          = 8,
    parameter S_KEEP_ENABLE         = (S_DATA_WIDTH>8),
    parameter S_KEEP_WIDTH          = S_KEEP_ENABLE ? (S_DATA_WIDTH/8) : 1,
    parameter S_DEST_ENABLE         = (M_COUNT>1),
    parameter S_DEST_WIDTH          = S_DEST_ENABLE ? $clog2(M_COUNT) : 1,
    parameter M_DATA_WIDTH          = 8,
    parameter M_KEEP_ENABLE         = (M_DATA_WIDTH>8),
    parameter M_KEEP_WIDTH          = M_KEEP_ENABLE ? (M_DATA_WIDTH/8) : 1,
    parameter M_DEST_ENABLE         = 0,
    parameter M_DEST_WIDTH          = 1,
    parameter ID_ENABLE             = 0,
    parameter ID_WIDTH              = 1,
    parameter USER_ENABLE           = 1,
    parameter USER_WIDTH            = 1,
    parameter S_REG_TYPE            = 2,
    parameter M_REG_TYPE            = 2,
    parameter ARB_TYPE_ROUND_ROBIN  = 1,
    parameter ARB_LSB_HIGH_PRIORITY = 1,
    parameter CLUSTER_COUNT         = 4,
    parameter STAGE_FIFO_DEPTH      = 8192,
    parameter RAM_PIPELINE          = 2,
    parameter FRAME_FIFO            = 0,
    parameter SEPARATE_CLOCKS       = 0
) (
    /*
     * AXI Stream inputs
     */
    input  wire                            s_clk,
    input  wire                            s_rst,
    input  wire [S_COUNT*S_DATA_WIDTH-1:0] s_axis_tdata,
    input  wire [S_COUNT*S_KEEP_WIDTH-1:0] s_axis_tkeep,
    input  wire [S_COUNT-1:0]              s_axis_tvalid,
    output wire [S_COUNT-1:0]              s_axis_tready,
    input  wire [S_COUNT-1:0]              s_axis_tlast,
    input  wire [S_COUNT*ID_WIDTH-1:0]     s_axis_tid,
    input  wire [S_COUNT*S_DEST_WIDTH-1:0] s_axis_tdest,
    input  wire [S_COUNT*USER_WIDTH-1:0]   s_axis_tuser,

    /*
     * AXI Stream outputs
     */
    input  wire                            m_clk,
    input  wire                            m_rst,
    output wire [M_COUNT*M_DATA_WIDTH-1:0] m_axis_tdata,
    output wire [M_COUNT*M_KEEP_WIDTH-1:0] m_axis_tkeep,
    output wire [M_COUNT-1:0]              m_axis_tvalid,
    input  wire [M_COUNT-1:0]              m_axis_tready,
    output wire [M_COUNT-1:0]              m_axis_tlast,
    output wire [M_COUNT*ID_WIDTH-1:0]     m_axis_tid,
    output wire [M_COUNT*M_DEST_WIDTH-1:0] m_axis_tdest,
    output wire [M_COUNT*USER_WIDTH-1:0]   m_axis_tuser
);

    wire select_m_clk = SEPARATE_CLOCKS ? m_clk : s_clk;
    wire select_m_rst = SEPARATE_CLOCKS ? m_rst : s_rst;

    localparam S_PER_CLUSTER     = S_COUNT/CLUSTER_COUNT;
    localparam STAGE_FIFO_ENABLE = (STAGE_FIFO_DEPTH>0);

    wire [S_COUNT*S_DATA_WIDTH-1:0] s_axis_tdata_r;
    wire [S_COUNT*S_KEEP_WIDTH-1:0] s_axis_tkeep_r;
    wire [S_COUNT-1:0]              s_axis_tvalid_r;
    wire [S_COUNT-1:0]              s_axis_tready_r;
    wire [S_COUNT-1:0]              s_axis_tlast_r;
    wire [S_COUNT*ID_WIDTH-1:0]     s_axis_tid_r;
    wire [S_COUNT*S_DEST_WIDTH-1:0] s_axis_tdest_r;
    wire [S_COUNT*USER_WIDTH-1:0]   s_axis_tuser_r;

    genvar k;
    generate
      for (k=0; k<S_COUNT; k=k+1) begin: input_registers
        axis_register # (
              .DATA_WIDTH(S_DATA_WIDTH),
              .KEEP_ENABLE(S_KEEP_ENABLE),
              .KEEP_WIDTH(S_KEEP_WIDTH),
              .DEST_ENABLE(S_DEST_ENABLE),
              .DEST_WIDTH(S_DEST_WIDTH),
              .USER_ENABLE(USER_ENABLE),
              .USER_WIDTH(USER_WIDTH),
              .ID_ENABLE(ID_ENABLE),
              .ID_WIDTH(ID_WIDTH),
              .REG_TYPE(S_REG_TYPE)
        ) input_register (
          .clk(s_clk),
          .rst(s_rst),

          .s_axis_tdata(s_axis_tdata[k*S_DATA_WIDTH +: S_DATA_WIDTH]),
          .s_axis_tkeep(s_axis_tkeep[k*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
          .s_axis_tvalid(s_axis_tvalid[k]),
          .s_axis_tready(s_axis_tready[k]),
          .s_axis_tlast(s_axis_tlast[k]),
          .s_axis_tid(s_axis_tid[k*ID_WIDTH +: ID_WIDTH]),
          .s_axis_tdest(s_axis_tdest[k*S_DEST_WIDTH +: S_DEST_WIDTH]),
          .s_axis_tuser(s_axis_tuser[k*USER_WIDTH +: USER_WIDTH]),

          .m_axis_tdata(s_axis_tdata_r[k*S_DATA_WIDTH +: S_DATA_WIDTH]),
          .m_axis_tkeep(s_axis_tkeep_r[k*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
          .m_axis_tvalid(s_axis_tvalid_r[k]),
          .m_axis_tready(s_axis_tready_r[k]),
          .m_axis_tlast(s_axis_tlast_r[k]),
          .m_axis_tid(s_axis_tid_r[k*ID_WIDTH +: ID_WIDTH]),
          .m_axis_tdest(s_axis_tdest_r[k*S_DEST_WIDTH +: S_DEST_WIDTH]),
          .m_axis_tuser(s_axis_tuser_r[k*USER_WIDTH +: USER_WIDTH])
        );
      end
    endgenerate

    // Level 1
    // First level doesn't do any routing, so no change to tdest
    wire [CLUSTER_COUNT*M_DATA_WIDTH-1:0] int_axis_tdata_f;
    wire [CLUSTER_COUNT*M_KEEP_WIDTH-1:0] int_axis_tkeep_f;
    wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest_f;
    wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser_f;
    wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid_f;
    wire [CLUSTER_COUNT-1:0]              int_axis_tvalid_f,
                                          int_axis_tready_f,
                                          int_axis_tlast_f;
    genvar j;
    generate
        if (S_PER_CLUSTER == 1) begin: bypass
            // TODO add fifo if async

            assign int_axis_tdata_f  = s_axis_tdata_r;
            assign int_axis_tkeep_f  = s_axis_tkeep_r;
            assign int_axis_tdest_f  = s_axis_tdest_r;
            assign int_axis_tuser_f  = s_axis_tuser_r;
            assign int_axis_tid_f    = s_axis_tid_r;
            assign int_axis_tvalid_f = s_axis_tvalid_r;
            assign int_axis_tlast_f  = s_axis_tlast_r;
            assign s_axis_tready_r   = int_axis_tready_f;

        end else begin: clusters

            wire [CLUSTER_COUNT*S_DATA_WIDTH-1:0] int_axis_tdata;
            wire [CLUSTER_COUNT*S_KEEP_WIDTH-1:0] int_axis_tkeep;
            wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest;
            wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser;
            wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid;
            wire [CLUSTER_COUNT-1:0]              int_axis_tvalid,
                                                  int_axis_tready,
                                                  int_axis_tlast;

            wire [CLUSTER_COUNT*S_DATA_WIDTH-1:0] int_axis_tdata_r;
            wire [CLUSTER_COUNT*S_KEEP_WIDTH-1:0] int_axis_tkeep_r;
            wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest_r;
            wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser_r;
            wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid_r;
            wire [CLUSTER_COUNT-1:0]              int_axis_tvalid_r,
                                                  int_axis_tready_r,
                                                  int_axis_tlast_r;

            for (j=0; j<CLUSTER_COUNT; j=j+1) begin : arb_n_fifo
                axis_arb_mux #
                (
                    .S_COUNT(S_PER_CLUSTER),
                    .DATA_WIDTH(S_DATA_WIDTH),
                    .KEEP_ENABLE(S_KEEP_ENABLE),
                    .KEEP_WIDTH(S_KEEP_WIDTH),
                    .DEST_ENABLE(S_DEST_ENABLE),
                    .DEST_WIDTH(S_DEST_WIDTH),
                    .USER_ENABLE(USER_ENABLE),
                    .USER_WIDTH(USER_WIDTH),
                    .ID_ENABLE(ID_ENABLE),
                    .S_ID_WIDTH(ID_WIDTH),
                    .M_ID_WIDTH(ID_WIDTH),
                    .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
                    .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
                ) sw_lvl1 (

                    .clk(s_clk),
                    .rst(s_rst),

                    /*
                     * AXI Stream inputs
                     */
                    .s_axis_tdata(s_axis_tdata_r[j*S_PER_CLUSTER*S_DATA_WIDTH +: S_PER_CLUSTER*S_DATA_WIDTH]),
                    .s_axis_tkeep(s_axis_tkeep_r[j*S_PER_CLUSTER*S_KEEP_WIDTH +: S_PER_CLUSTER*S_KEEP_WIDTH]),
                    .s_axis_tvalid(s_axis_tvalid_r[j*S_PER_CLUSTER +: S_PER_CLUSTER]),
                    .s_axis_tready(s_axis_tready_r[j*S_PER_CLUSTER +: S_PER_CLUSTER]),
                    .s_axis_tlast(s_axis_tlast_r[j*S_PER_CLUSTER +: S_PER_CLUSTER]),
                    .s_axis_tid(s_axis_tid_r[j*S_PER_CLUSTER*ID_WIDTH +: S_PER_CLUSTER*ID_WIDTH]),
                    .s_axis_tdest(s_axis_tdest_r[j*S_PER_CLUSTER*S_DEST_WIDTH +: S_PER_CLUSTER*S_DEST_WIDTH]),
                    .s_axis_tuser(s_axis_tuser_r[j*S_PER_CLUSTER*USER_WIDTH +: S_PER_CLUSTER*USER_WIDTH]),

                    /*
                     * AXI Stream outputs
                     */
                    .m_axis_tdata(int_axis_tdata[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    .m_axis_tkeep(int_axis_tkeep[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                    .m_axis_tvalid(int_axis_tvalid[j]),
                    .m_axis_tready(int_axis_tready[j]),
                    .m_axis_tlast(int_axis_tlast[j]),
                    .m_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                    .m_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                    .m_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH])

                );

                axis_register #
                (
                    .DATA_WIDTH(S_DATA_WIDTH),
                    .KEEP_ENABLE(S_KEEP_ENABLE),
                    .KEEP_WIDTH(S_KEEP_WIDTH),
                    .DEST_ENABLE(S_DEST_ENABLE),
                    .DEST_WIDTH(S_DEST_WIDTH),
                    .USER_ENABLE(USER_ENABLE),
                    .USER_WIDTH(USER_WIDTH),
                    .ID_ENABLE(ID_ENABLE),
                    .ID_WIDTH(ID_WIDTH),
                    .REG_TYPE(M_REG_TYPE)
                ) sw_lvl1_register (
                    .clk(s_clk),
                    .rst(s_rst),

                    .s_axis_tdata(int_axis_tdata[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    .s_axis_tkeep(int_axis_tkeep[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                    .s_axis_tvalid(int_axis_tvalid[j]),
                    .s_axis_tready(int_axis_tready[j]),
                    .s_axis_tlast(int_axis_tlast[j]),
                    .s_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                    .s_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                    .s_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]),

                    .m_axis_tdata(int_axis_tdata_r[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    .m_axis_tkeep(int_axis_tkeep_r[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                    .m_axis_tvalid(int_axis_tvalid_r[j]),
                    .m_axis_tready(int_axis_tready_r[j]),
                    .m_axis_tlast(int_axis_tlast_r[j]),
                    .m_axis_tid(int_axis_tid_r[j*ID_WIDTH +: ID_WIDTH]),
                    .m_axis_tdest(int_axis_tdest_r[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                    .m_axis_tuser(int_axis_tuser_r[j*USER_WIDTH +: USER_WIDTH])
                );

                if (STAGE_FIFO_ENABLE) begin: fifos
                    if (SEPARATE_CLOCKS) begin: async_fifos
                        axis_async_fifo_adapter # (
                            .DEPTH(STAGE_FIFO_DEPTH),
                            .S_DATA_WIDTH(S_DATA_WIDTH),
                            .S_KEEP_ENABLE(S_KEEP_ENABLE),
                            .S_KEEP_WIDTH(S_KEEP_WIDTH),
                            .M_DATA_WIDTH(M_DATA_WIDTH),
                            .M_KEEP_ENABLE(M_KEEP_ENABLE),
                            .M_KEEP_WIDTH(M_KEEP_WIDTH),
                            .DEST_ENABLE(S_DEST_ENABLE),
                            .DEST_WIDTH(S_DEST_WIDTH),
                            .USER_ENABLE(USER_ENABLE),
                            .USER_WIDTH(USER_WIDTH),
                            .ID_ENABLE(ID_ENABLE),
                            .ID_WIDTH(ID_WIDTH),
                            .RAM_PIPELINE(RAM_PIPELINE),
                            .FRAME_FIFO(FRAME_FIFO)
                        ) stage_fifo (

                            .s_clk(s_clk),
                            .s_rst(s_rst),
                            .s_axis_tdata(int_axis_tdata_r[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                            .s_axis_tkeep(int_axis_tkeep_r[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                            .s_axis_tvalid(int_axis_tvalid_r[j]),
                            .s_axis_tready(int_axis_tready_r[j]),
                            .s_axis_tlast(int_axis_tlast_r[j]),
                            .s_axis_tid(int_axis_tid_r[j*ID_WIDTH +: ID_WIDTH]),
                            .s_axis_tdest(int_axis_tdest_r[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                            .s_axis_tuser(int_axis_tuser_r[j*USER_WIDTH +: USER_WIDTH]),

                            .m_clk(select_m_clk),
                            .m_rst(select_m_rst),
                            .m_axis_tdata(int_axis_tdata_f[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                            .m_axis_tkeep(int_axis_tkeep_f[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                            .m_axis_tvalid(int_axis_tvalid_f[j]),
                            .m_axis_tready(int_axis_tready_f[j]),
                            .m_axis_tlast(int_axis_tlast_f[j]),
                            .m_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                            .m_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                            .m_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]),

                            .s_status_overflow(),
                            .s_status_bad_frame(),
                            .s_status_good_frame(),
                            .m_status_overflow(),
                            .m_status_bad_frame(),
                            .m_status_good_frame()
                        );
                    end else begin: normal_fifos
                        axis_fifo_adapter # (
                            .DEPTH(STAGE_FIFO_DEPTH),
                            .S_DATA_WIDTH(S_DATA_WIDTH),
                            .S_KEEP_ENABLE(S_KEEP_ENABLE),
                            .S_KEEP_WIDTH(S_KEEP_WIDTH),
                            .M_DATA_WIDTH(M_DATA_WIDTH),
                            .M_KEEP_ENABLE(M_KEEP_ENABLE),
                            .M_KEEP_WIDTH(M_KEEP_WIDTH),
                            .DEST_ENABLE(S_DEST_ENABLE),
                            .DEST_WIDTH(S_DEST_WIDTH),
                            .USER_ENABLE(USER_ENABLE),
                            .USER_WIDTH(USER_WIDTH),
                            .ID_ENABLE(ID_ENABLE),
                            .ID_WIDTH(ID_WIDTH),
                            .RAM_PIPELINE(RAM_PIPELINE),
                            .FRAME_FIFO(FRAME_FIFO)
                        ) stage_fifo (
                            .clk(s_clk),
                            .rst(s_rst),

                            .s_axis_tdata(int_axis_tdata_r[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                            .s_axis_tkeep(int_axis_tkeep_r[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                            .s_axis_tvalid(int_axis_tvalid_r[j]),
                            .s_axis_tready(int_axis_tready_r[j]),
                            .s_axis_tlast(int_axis_tlast_r[j]),
                            .s_axis_tid(int_axis_tid_r[j*ID_WIDTH +: ID_WIDTH]),
                            .s_axis_tdest(int_axis_tdest_r[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                            .s_axis_tuser(int_axis_tuser_r[j*USER_WIDTH +: USER_WIDTH]),

                            .m_axis_tdata(int_axis_tdata_f[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                            .m_axis_tkeep(int_axis_tkeep_f[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                            .m_axis_tvalid(int_axis_tvalid_f[j]),
                            .m_axis_tready(int_axis_tready_f[j]),
                            .m_axis_tlast(int_axis_tlast_f[j]),
                            .m_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                            .m_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                            .m_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]),

                            .status_overflow(),
                            .status_bad_frame(),
                            .status_good_frame()
                        );
                    end


                end else begin: no_fifo
                    assign int_axis_tdata_f  = int_axis_tdata_r;
                    assign int_axis_tkeep_f  = int_axis_tkeep_r;
                    assign int_axis_tdest_f  = int_axis_tdest_r;
                    assign int_axis_tuser_f  = int_axis_tuser_r;
                    assign int_axis_tid_f    = int_axis_tid_r;
                    assign int_axis_tvalid_f = int_axis_tvalid_r;
                    assign int_axis_tlast_f  = int_axis_tlast_r;
                    assign int_axis_tready_r = int_axis_tready_f;
                end
            end
        end
    endgenerate

    // Level 2
    wire [M_COUNT*S_DEST_WIDTH-1:0] m_axis_tdest_r;
    wire [M_COUNT*M_DATA_WIDTH-1:0] m_axis_tdata_n;
    wire [M_COUNT*M_KEEP_WIDTH-1:0] m_axis_tkeep_n;
    wire [M_COUNT-1:0]              m_axis_tvalid_n;
    wire [M_COUNT-1:0]              m_axis_tready_n;
    wire [M_COUNT-1:0]              m_axis_tlast_n;
    wire [M_COUNT*ID_WIDTH-1:0]     m_axis_tid_n;
    wire [M_COUNT*M_DEST_WIDTH-1:0] m_axis_tdest_n;
    wire [M_COUNT*USER_WIDTH-1:0]   m_axis_tuser_n;

    if (M_COUNT==1) begin: last_level_arbiter

        axis_arb_mux #
        (
            .S_COUNT(CLUSTER_COUNT),
            .DATA_WIDTH(M_DATA_WIDTH),
            .KEEP_WIDTH(M_KEEP_WIDTH),
            .KEEP_ENABLE(M_KEEP_ENABLE),
            .DEST_ENABLE(S_DEST_ENABLE),
            .DEST_WIDTH(S_DEST_WIDTH),
            .USER_ENABLE(USER_ENABLE),
            .USER_WIDTH(USER_WIDTH),
            .ID_ENABLE(ID_ENABLE),
            .S_ID_WIDTH(ID_WIDTH),
            .M_ID_WIDTH(ID_WIDTH),
            .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
        ) sw_lvl2
        (
            .clk(select_m_clk),
            .rst(select_m_rst),

            /*
             * AXI Stream inputs
             */
            .s_axis_tdata(int_axis_tdata_f),
            .s_axis_tkeep(int_axis_tkeep_f),
            .s_axis_tvalid(int_axis_tvalid_f),
            .s_axis_tready(int_axis_tready_f),
            .s_axis_tlast(int_axis_tlast_f),
            .s_axis_tid(int_axis_tid_f),
            .s_axis_tdest(int_axis_tdest_f),
            .s_axis_tuser(int_axis_tuser_f),

            /*
             * AXI Stream outputs
             */
            .m_axis_tdata(m_axis_tdata_n),
            .m_axis_tkeep(m_axis_tkeep_n),
            .m_axis_tvalid(m_axis_tvalid_n),
            .m_axis_tready(m_axis_tready_n),
            .m_axis_tlast(m_axis_tlast_n),
            .m_axis_tid(m_axis_tid_n),
            .m_axis_tdest(m_axis_tdest_n),
            .m_axis_tuser(m_axis_tuser_n)

        );

        axis_register # (
            .DATA_WIDTH(M_DATA_WIDTH),
            .KEEP_WIDTH(M_KEEP_WIDTH),
            .KEEP_ENABLE(M_KEEP_ENABLE),
            .DEST_ENABLE(S_DEST_ENABLE),
            .DEST_WIDTH(S_DEST_WIDTH),
            .USER_ENABLE(USER_ENABLE),
            .USER_WIDTH(USER_WIDTH),
            .ID_ENABLE(ID_ENABLE),
            .ID_WIDTH(ID_WIDTH),
            .REG_TYPE(S_REG_TYPE)
        ) output_pipeline_register (
            .clk(select_m_clk),
            .rst(select_m_rst),

            .s_axis_tdata(m_axis_tdata_n),
            .s_axis_tkeep(m_axis_tkeep_n),
            .s_axis_tvalid(m_axis_tvalid_n),
            .s_axis_tready(m_axis_tready_n),
            .s_axis_tlast(m_axis_tlast_n),
            .s_axis_tid(m_axis_tid_n),
            .s_axis_tdest(m_axis_tdest_n),
            .s_axis_tuser(m_axis_tuser_n),

            .m_axis_tdata(m_axis_tdata),
            .m_axis_tkeep(m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(m_axis_tready),
            .m_axis_tlast(m_axis_tlast),
            .m_axis_tid(m_axis_tid),
            .m_axis_tdest(m_axis_tdest_r),
            .m_axis_tuser(m_axis_tuser)
        );


    end else begin: last_level_sw //M_COUNT!=1

        simple_axis_switch #
        (
            .S_COUNT(CLUSTER_COUNT),
            .M_COUNT(M_COUNT),
            .DATA_WIDTH(M_DATA_WIDTH),
            .KEEP_ENABLE(M_KEEP_ENABLE),
            .KEEP_WIDTH(M_KEEP_WIDTH),
            .DEST_WIDTH(S_DEST_WIDTH),
            .USER_ENABLE(USER_ENABLE),
            .USER_WIDTH(USER_WIDTH),
            .ID_ENABLE(ID_ENABLE),
            .ID_WIDTH(ID_WIDTH),
            .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
            .S_REG_TYPE(2),
            .M_REG_TYPE(M_REG_TYPE)
        ) sw_lvl2
        (
            .clk(select_m_clk),
            .rst(select_m_rst),

            /*
             * AXI Stream inputs
             */
            .s_axis_tdata(int_axis_tdata_f),
            .s_axis_tkeep(int_axis_tkeep_f),
            .s_axis_tvalid(int_axis_tvalid_f),
            .s_axis_tready(int_axis_tready_f),
            .s_axis_tlast(int_axis_tlast_f),
            .s_axis_tid(int_axis_tid_f),
            .s_axis_tdest(int_axis_tdest_f),
            .s_axis_tuser(int_axis_tuser_f),

            /*
             * AXI Stream outputs
             */
            .m_axis_tdata(m_axis_tdata),
            .m_axis_tkeep(m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(m_axis_tready),
            .m_axis_tlast(m_axis_tlast),
            .m_axis_tid(m_axis_tid),
            .m_axis_tdest(m_axis_tdest_r),
            .m_axis_tuser(m_axis_tuser)
        );
    end

    genvar i;
    generate
        for (i=0; i<M_COUNT; i=i+1) begin: tdest_cut
            assign m_axis_tdest[i*M_DEST_WIDTH +: M_DEST_WIDTH] =
                M_DEST_ENABLE ? m_axis_tdest_r[i*S_DEST_WIDTH +: M_DEST_WIDTH] : 1'b0;
        end
    endgenerate

endmodule

module axis_simple_arb_2lvl # (
    parameter S_COUNT               = 16,
    parameter DATA_WIDTH            = 8,
    parameter USER_ENABLE           = 1,
    parameter USER_WIDTH            = 1,
    parameter ARB_TYPE_ROUND_ROBIN  = 1,
    parameter ARB_LSB_HIGH_PRIORITY = 1,
    parameter CLUSTER_COUNT         = 4,
    parameter STAGE_FIFO_DEPTH      = 64
) (
    input  wire                          clk,
    input  wire                          rst,

    input  wire [S_COUNT*DATA_WIDTH-1:0] s_axis_tdata,
    input  wire [S_COUNT-1:0]            s_axis_tvalid,
    output wire [S_COUNT-1:0]            s_axis_tready,
    input  wire [S_COUNT*USER_WIDTH-1:0] s_axis_tuser,

    output wire [DATA_WIDTH-1:0]         m_axis_tdata,
    output wire                          m_axis_tvalid,
    input  wire                          m_axis_tready,
    output wire [USER_WIDTH-1:0]         m_axis_tuser
);

    wire rst_r;
    sync_reset sync_rst_inst (
      .clk(clk),
      .rst(rst),
      .out(rst_r)
    );

    localparam S_PER_CLUSTER     = S_COUNT/CLUSTER_COUNT;
    localparam STAGE_FIFO_ENABLE = (STAGE_FIFO_DEPTH>0);

    wire [S_COUNT*DATA_WIDTH-1:0] s_axis_tdata_r;
    wire [S_COUNT-1:0]            s_axis_tvalid_r;
    wire [S_COUNT-1:0]            s_axis_tready_r;
    wire [S_COUNT*USER_WIDTH-1:0] s_axis_tuser_r;

    genvar k;
    generate
      for (k=0; k<S_COUNT; k=k+1) begin: input_registers
        axis_register # (
              .DATA_WIDTH(DATA_WIDTH),
              .KEEP_ENABLE(0),
              .KEEP_WIDTH(1),
              .DEST_ENABLE(0),
              .USER_ENABLE(USER_ENABLE),
              .USER_WIDTH(USER_WIDTH),
              .ID_ENABLE(0),
              .REG_TYPE(2)
        ) input_register (
          .clk(clk),
          .rst(rst_r),

          .s_axis_tdata(s_axis_tdata[k*DATA_WIDTH +: DATA_WIDTH]),
          .s_axis_tkeep(1'b1),
          .s_axis_tvalid(s_axis_tvalid[k]),
          .s_axis_tready(s_axis_tready[k]),
          .s_axis_tlast(1'b1),
          .s_axis_tid(8'd0),
          .s_axis_tdest(8'd0),
          .s_axis_tuser(s_axis_tuser[k*USER_WIDTH +: USER_WIDTH]),

          .m_axis_tdata(s_axis_tdata_r[k*DATA_WIDTH +: DATA_WIDTH]),
          .m_axis_tkeep(),
          .m_axis_tvalid(s_axis_tvalid_r[k]),
          .m_axis_tready(s_axis_tready_r[k]),
          .m_axis_tlast(),
          .m_axis_tid(),
          .m_axis_tdest(),
          .m_axis_tuser(s_axis_tuser_r[k*USER_WIDTH +: USER_WIDTH])
        );
      end
    endgenerate

    // Level 1
    wire [CLUSTER_COUNT*DATA_WIDTH-1:0] int_axis_tdata_f;
    wire [CLUSTER_COUNT*USER_WIDTH-1:0] int_axis_tuser_f;
    wire [CLUSTER_COUNT-1:0]            int_axis_tvalid_f,
                                        int_axis_tready_f;
    genvar j;
    generate
        if (S_PER_CLUSTER == 1) begin: bypass
            // TODO add fifo if async

            assign int_axis_tdata_f  = s_axis_tdata_r;
            assign int_axis_tuser_f  = s_axis_tuser_r;
            assign int_axis_tvalid_f = s_axis_tvalid_r;
            assign s_axis_tready_r   = int_axis_tready_f;

        end else begin: clusters

            wire [CLUSTER_COUNT*DATA_WIDTH-1:0] int_axis_tdata;
            wire [CLUSTER_COUNT*USER_WIDTH-1:0] int_axis_tuser;
            wire [CLUSTER_COUNT-1:0]            int_axis_tvalid,
                                                int_axis_tready;

            wire [CLUSTER_COUNT*DATA_WIDTH-1:0] int_axis_tdata_r;
            wire [CLUSTER_COUNT*USER_WIDTH-1:0] int_axis_tuser_r;
            wire [CLUSTER_COUNT-1:0]            int_axis_tvalid_r,
                                                int_axis_tready_r;

            for (j=0; j<CLUSTER_COUNT; j=j+1) begin : arb_n_fifo
                axis_arb_mux #
                (
                    .S_COUNT(S_PER_CLUSTER),
                    .DATA_WIDTH(DATA_WIDTH),
                    .KEEP_ENABLE(0),
                    .KEEP_WIDTH(1),
                    .DEST_ENABLE(0),
                    .USER_ENABLE(USER_ENABLE),
                    .USER_WIDTH(USER_WIDTH),
                    .ID_ENABLE(0),
                    .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
                    .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
                ) arb_lvl1 (

                    .clk(clk),
                    .rst(rst_r),

                    /*
                     * AXI Stream inputs
                     */
                    .s_axis_tdata(s_axis_tdata_r[j*S_PER_CLUSTER*DATA_WIDTH +: S_PER_CLUSTER*DATA_WIDTH]),
                    .s_axis_tkeep({S_PER_CLUSTER{1'b1}}),
                    .s_axis_tvalid(s_axis_tvalid_r[j*S_PER_CLUSTER +: S_PER_CLUSTER]),
                    .s_axis_tready(s_axis_tready_r[j*S_PER_CLUSTER +: S_PER_CLUSTER]),
                    .s_axis_tlast({S_PER_CLUSTER{1'b1}}),
                    .s_axis_tid({S_PER_CLUSTER{8'd0}}),
                    .s_axis_tdest({S_PER_CLUSTER{8'd0}}),
                    .s_axis_tuser(s_axis_tuser_r[j*S_PER_CLUSTER*USER_WIDTH +: S_PER_CLUSTER*USER_WIDTH]),

                    /*
                     * AXI Stream outputs
                     */
                    .m_axis_tdata(int_axis_tdata[j*DATA_WIDTH +: DATA_WIDTH]),
                    .m_axis_tkeep(),
                    .m_axis_tvalid(int_axis_tvalid[j]),
                    .m_axis_tready(int_axis_tready[j]),
                    .m_axis_tlast(),
                    .m_axis_tid(),
                    .m_axis_tdest(),
                    .m_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH])

                );

                if (STAGE_FIFO_ENABLE) begin: fifos

                    basic_fifo # (
                      .DEPTH(STAGE_FIFO_DEPTH),
                      .DATA_WIDTH(DATA_WIDTH+USER_WIDTH)
                    ) stage_fifo (
                      .clk(clk),
                      .rst(rst_r),
                      .clear(1'b0),

                      .din_valid(int_axis_tvalid[j]),
                      .din({int_axis_tdata[j*DATA_WIDTH +: DATA_WIDTH],
                            int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]}),
                      .din_ready(int_axis_tready[j]),

                      .dout_valid(int_axis_tvalid_f[j]),
                      .dout({int_axis_tdata_f[j*DATA_WIDTH +: DATA_WIDTH],
                            int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]}),
                      .dout_ready(int_axis_tready_f[j]),

                      .item_count(),
                      .full(),
                      .empty()
                    );

                end else begin: no_fifo
                    assign int_axis_tdata_f  = int_axis_tdata;
                    assign int_axis_tuser_f  = int_axis_tuser;
                    assign int_axis_tvalid_f = int_axis_tvalid;
                    assign int_axis_tready   = int_axis_tready_f;
                end
            end
        end
    endgenerate

    // Level 2
    wire [DATA_WIDTH-1:0] m_axis_tdata_n;
    wire                  m_axis_tvalid_n;
    wire                  m_axis_tready_n;
    wire [USER_WIDTH-1:0] m_axis_tuser_n;

    axis_arb_mux #
    (
        .S_COUNT(CLUSTER_COUNT),
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_WIDTH(1),
        .KEEP_ENABLE(0),
        .DEST_ENABLE(0),
        .USER_ENABLE(USER_ENABLE),
        .USER_WIDTH(USER_WIDTH),
        .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
        .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
    ) arb_lvl2
    (
        .clk(clk),
        .rst(rst_r),

        /*
         * AXI Stream inputs
         */
        .s_axis_tdata(int_axis_tdata_f),
        .s_axis_tkeep({CLUSTER_COUNT{1'b1}}),
        .s_axis_tvalid(int_axis_tvalid_f),
        .s_axis_tready(int_axis_tready_f),
        .s_axis_tlast({CLUSTER_COUNT{1'b1}}),
        .s_axis_tid({CLUSTER_COUNT{8'd0}}),
        .s_axis_tdest({CLUSTER_COUNT{8'd0}}),
        .s_axis_tuser(int_axis_tuser_f),

        /*
         * AXI Stream outputs
         */
        .m_axis_tdata(m_axis_tdata_n),
        .m_axis_tkeep(),
        .m_axis_tvalid(m_axis_tvalid_n),
        .m_axis_tready(m_axis_tready_n),
        .m_axis_tlast(),
        .m_axis_tid(),
        .m_axis_tdest(),
        .m_axis_tuser(m_axis_tuser_n)
    );

    axis_register # (
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_WIDTH(1),
        .KEEP_ENABLE(0),
        .DEST_ENABLE(0),
        .USER_ENABLE(USER_ENABLE),
        .USER_WIDTH(USER_WIDTH),
        .ID_ENABLE(0),
        .REG_TYPE(2)
    ) output_pipeline_register (
        .clk(clk),
        .rst(rst_r),

        .s_axis_tdata(m_axis_tdata_n),
        .s_axis_tkeep(1'b1),
        .s_axis_tvalid(m_axis_tvalid_n),
        .s_axis_tready(m_axis_tready_n),
        .s_axis_tlast(1'b1),
        .s_axis_tid(8'd0),
        .s_axis_tdest(8'd0),
        .s_axis_tuser(m_axis_tuser_n),

        .m_axis_tdata(m_axis_tdata),
        .m_axis_tkeep(),
        .m_axis_tvalid(m_axis_tvalid),
        .m_axis_tready(m_axis_tready),
        .m_axis_tlast(),
        .m_axis_tid(),
        .m_axis_tdest(),
        .m_axis_tuser(m_axis_tuser)
    );

endmodule

module axis_ram_sw_shrink # (
    parameter S_COUNT               = 4,
    parameter M_COUNT               = 4,
    parameter S_DATA_WIDTH          = 8,
    parameter S_KEEP_ENABLE         = (S_DATA_WIDTH>8),
    parameter S_KEEP_WIDTH          = S_KEEP_ENABLE ? (S_DATA_WIDTH/8) : 1,
    parameter S_DEST_ENABLE         = (M_COUNT>1),
    parameter S_DEST_WIDTH          = S_DEST_ENABLE ? $clog2(M_COUNT) : 1,
    parameter M_DATA_WIDTH          = 8,
    parameter M_KEEP_ENABLE         = (M_DATA_WIDTH>8),
    parameter M_KEEP_WIDTH          = M_KEEP_ENABLE ? (M_DATA_WIDTH/8) : 1,
    parameter M_DEST_ENABLE         = 0,
    parameter M_DEST_WIDTH          = 1,
    parameter ID_ENABLE             = 0,
    parameter ID_WIDTH              = 1,
    parameter USER_ENABLE           = 1,
    parameter USER_WIDTH            = 1,
    parameter S_REG_TYPE            = 2,
    parameter M_REG_TYPE            = 2,
    parameter ARB_TYPE_ROUND_ROBIN  = 1,
    parameter ARB_LSB_HIGH_PRIORITY = 1,
    parameter CLUSTER_COUNT         = 4,
    parameter STAGE_FIFO_DEPTH      = 8192,
    parameter RAM_PIPELINE          = 2,
    parameter FRAME_FIFO            = 0,
    parameter SEPARATE_CLOCKS       = 0
) (
    /*
     * AXI Stream inputs
     */
    input  wire                            s_clk,
    input  wire                            s_rst,
    input  wire [S_COUNT*S_DATA_WIDTH-1:0] s_axis_tdata,
    input  wire [S_COUNT*S_KEEP_WIDTH-1:0] s_axis_tkeep,
    input  wire [S_COUNT-1:0]              s_axis_tvalid,
    output wire [S_COUNT-1:0]              s_axis_tready,
    input  wire [S_COUNT-1:0]              s_axis_tlast,
    input  wire [S_COUNT*ID_WIDTH-1:0]     s_axis_tid,
    input  wire [S_COUNT*S_DEST_WIDTH-1:0] s_axis_tdest,
    input  wire [S_COUNT*USER_WIDTH-1:0]   s_axis_tuser,

    /*
     * AXI Stream outputs
     */
    input  wire                            m_clk,
    input  wire                            m_rst,
    output wire [M_COUNT*M_DATA_WIDTH-1:0] m_axis_tdata,
    output wire [M_COUNT*M_KEEP_WIDTH-1:0] m_axis_tkeep,
    output wire [M_COUNT-1:0]              m_axis_tvalid,
    input  wire [M_COUNT-1:0]              m_axis_tready,
    output wire [M_COUNT-1:0]              m_axis_tlast,
    output wire [M_COUNT*ID_WIDTH-1:0]     m_axis_tid,
    output wire [M_COUNT*M_DEST_WIDTH-1:0] m_axis_tdest,
    output wire [M_COUNT*USER_WIDTH-1:0]   m_axis_tuser
);

    wire select_m_clk = SEPARATE_CLOCKS ? m_clk : s_clk;
    wire select_m_rst = SEPARATE_CLOCKS ? m_rst : s_rst;

    localparam S_PER_CLUSTER = S_COUNT/CLUSTER_COUNT;

    wire [S_COUNT*S_DATA_WIDTH-1:0] s_axis_tdata_r;
    wire [S_COUNT*S_KEEP_WIDTH-1:0] s_axis_tkeep_r;
    wire [S_COUNT-1:0]              s_axis_tvalid_r;
    wire [S_COUNT-1:0]              s_axis_tready_r;
    wire [S_COUNT-1:0]              s_axis_tlast_r;
    wire [S_COUNT*ID_WIDTH-1:0]     s_axis_tid_r;
    wire [S_COUNT*S_DEST_WIDTH-1:0] s_axis_tdest_r;
    wire [S_COUNT*USER_WIDTH-1:0]   s_axis_tuser_r;

    genvar k;
    generate
      for (k=0; k<S_COUNT; k=k+1) begin: input_registers
        axis_slr_register # (
              .DATA_WIDTH(S_DATA_WIDTH),
              .KEEP_ENABLE(S_KEEP_ENABLE),
              .KEEP_WIDTH(S_KEEP_WIDTH),
              .DEST_ENABLE(S_DEST_ENABLE),
              .DEST_WIDTH(S_DEST_WIDTH),
              .USER_ENABLE(USER_ENABLE),
              .USER_WIDTH(USER_WIDTH),
              .ID_ENABLE(ID_ENABLE),
              .ID_WIDTH(ID_WIDTH)
        ) input_register (
          .clk(s_clk),
          .rst(s_rst),

          .s_axis_tdata(s_axis_tdata[k*S_DATA_WIDTH +: S_DATA_WIDTH]),
          .s_axis_tkeep(s_axis_tkeep[k*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
          .s_axis_tvalid(s_axis_tvalid[k]),
          .s_axis_tready(s_axis_tready[k]),
          .s_axis_tlast(s_axis_tlast[k]),
          .s_axis_tid(s_axis_tid[k*ID_WIDTH +: ID_WIDTH]),
          .s_axis_tdest(s_axis_tdest[k*S_DEST_WIDTH +: S_DEST_WIDTH]),
          .s_axis_tuser(s_axis_tuser[k*USER_WIDTH +: USER_WIDTH]),

          .m_axis_tdata(s_axis_tdata_r[k*S_DATA_WIDTH +: S_DATA_WIDTH]),
          .m_axis_tkeep(s_axis_tkeep_r[k*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
          .m_axis_tvalid(s_axis_tvalid_r[k]),
          .m_axis_tready(s_axis_tready_r[k]),
          .m_axis_tlast(s_axis_tlast_r[k]),
          .m_axis_tid(s_axis_tid_r[k*ID_WIDTH +: ID_WIDTH]),
          .m_axis_tdest(s_axis_tdest_r[k*S_DEST_WIDTH +: S_DEST_WIDTH]),
          .m_axis_tuser(s_axis_tuser_r[k*USER_WIDTH +: USER_WIDTH])
        );
      end
    endgenerate

    // Level 1
    // First level doesn't do any routing, so no change to tdest
    wire [CLUSTER_COUNT*M_DATA_WIDTH-1:0] int_axis_tdata;
    wire [CLUSTER_COUNT*M_KEEP_WIDTH-1:0] int_axis_tkeep;
    wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest;
    wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser;
    wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid;
    wire [CLUSTER_COUNT-1:0]              int_axis_tvalid,
                                          int_axis_tready,
                                          int_axis_tlast;


    wire [CLUSTER_COUNT*M_DATA_WIDTH-1:0] int_axis_tdata_f;
    wire [CLUSTER_COUNT*M_KEEP_WIDTH-1:0] int_axis_tkeep_f;
    wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest_f;
    wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser_f;
    wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid_f;
    wire [CLUSTER_COUNT-1:0]              int_axis_tvalid_f,
                                          int_axis_tready_f,
                                          int_axis_tlast_f;
    genvar j;
    generate
        for (j=0; j<CLUSTER_COUNT; j=j+1) begin : axis_ram_sw_n_fifo
            axis_ram_switch # (
                .FIFO_DEPTH(STAGE_FIFO_DEPTH),
                .CMD_FIFO_DEPTH(64),
                .S_COUNT(S_PER_CLUSTER),
                .S_DATA_WIDTH(S_DATA_WIDTH),
                .S_KEEP_ENABLE(S_KEEP_ENABLE),
                .S_KEEP_WIDTH(S_KEEP_WIDTH),
                .M_COUNT(1),
                .M_DATA_WIDTH(M_DATA_WIDTH),
                .M_KEEP_ENABLE(M_KEEP_ENABLE),
                .M_KEEP_WIDTH(M_KEEP_WIDTH),
                .DEST_WIDTH(S_DEST_WIDTH),
                .USER_ENABLE(USER_ENABLE),
                .USER_WIDTH(USER_WIDTH),
                .ID_ENABLE(ID_ENABLE),
                .ID_WIDTH(ID_WIDTH),
                .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
                .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
                .RAM_PIPELINE(RAM_PIPELINE)
            ) sw_lvl1 (
                .clk(s_clk),
                .rst(s_rst),

                /*
                 * AXI Stream inputs
                 */
                .s_axis_tdata(s_axis_tdata_r[j*S_PER_CLUSTER*S_DATA_WIDTH +: S_PER_CLUSTER*S_DATA_WIDTH]),
                .s_axis_tkeep(s_axis_tkeep_r[j*S_PER_CLUSTER*S_KEEP_WIDTH +: S_PER_CLUSTER*S_KEEP_WIDTH]),
                .s_axis_tvalid(s_axis_tvalid_r[j*S_PER_CLUSTER +: S_PER_CLUSTER]),
                .s_axis_tready(s_axis_tready_r[j*S_PER_CLUSTER +: S_PER_CLUSTER]),
                .s_axis_tlast(s_axis_tlast_r[j*S_PER_CLUSTER +: S_PER_CLUSTER]),
                .s_axis_tid(s_axis_tid_r[j*S_PER_CLUSTER*ID_WIDTH +: S_PER_CLUSTER*ID_WIDTH]),
                .s_axis_tdest(s_axis_tdest_r[j*S_PER_CLUSTER*S_DEST_WIDTH +: S_PER_CLUSTER*S_DEST_WIDTH]),
                .s_axis_tuser(s_axis_tuser_r[j*S_PER_CLUSTER*USER_WIDTH +: S_PER_CLUSTER*USER_WIDTH]),

                /*
                 * AXI Stream outputs
                 */
                .m_axis_tdata(int_axis_tdata[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                .m_axis_tkeep(int_axis_tkeep[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                .m_axis_tvalid(int_axis_tvalid[j]),
                .m_axis_tready(int_axis_tready[j]),
                .m_axis_tlast(int_axis_tlast[j]),
                .m_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                .m_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                .m_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]),

                .status_overflow(),
                .status_bad_frame(),
                .status_good_frame()
            );

            if (SEPARATE_CLOCKS) begin: async_fifo
                axis_async_fifo_adapter # (
                    .DEPTH(32*M_KEEP_WIDTH),
                    .S_DATA_WIDTH(M_DATA_WIDTH),
                    .S_KEEP_ENABLE(M_KEEP_ENABLE),
                    .S_KEEP_WIDTH(M_KEEP_WIDTH),
                    .M_DATA_WIDTH(M_DATA_WIDTH),
                    .M_KEEP_ENABLE(M_KEEP_ENABLE),
                    .M_KEEP_WIDTH(M_KEEP_WIDTH),
                    .DEST_ENABLE(S_DEST_ENABLE),
                    .DEST_WIDTH(S_DEST_WIDTH),
                    .USER_ENABLE(USER_ENABLE),
                    .USER_WIDTH(USER_WIDTH),
                    .ID_ENABLE(ID_ENABLE),
                    .ID_WIDTH(ID_WIDTH),
                    .RAM_PIPELINE(2),
                    .FRAME_FIFO(0)
                ) async_fifo (

                    .s_clk(s_clk),
                    .s_rst(s_rst),
                    .s_axis_tdata(int_axis_tdata[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                    .s_axis_tkeep(int_axis_tkeep[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                    .s_axis_tvalid(int_axis_tvalid[j]),
                    .s_axis_tready(int_axis_tready[j]),
                    .s_axis_tlast(int_axis_tlast[j]),
                    .s_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                    .s_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                    .s_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]),

                    .m_clk(select_m_clk),
                    .m_rst(select_m_rst),
                    .m_axis_tdata(int_axis_tdata_f[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                    .m_axis_tkeep(int_axis_tkeep_f[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                    .m_axis_tvalid(int_axis_tvalid_f[j]),
                    .m_axis_tready(int_axis_tready_f[j]),
                    .m_axis_tlast(int_axis_tlast_f[j]),
                    .m_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                    .m_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                    .m_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]),

                    .s_status_overflow(),
                    .s_status_bad_frame(),
                    .s_status_good_frame(),
                    .m_status_overflow(),
                    .m_status_bad_frame(),
                    .m_status_good_frame()
                );
            end else begin: no_fifo

                axis_register # (
                    .DATA_WIDTH(M_DATA_WIDTH),
                    .KEEP_WIDTH(M_KEEP_WIDTH),
                    .KEEP_ENABLE(M_KEEP_ENABLE),
                    .DEST_ENABLE(S_DEST_ENABLE),
                    .DEST_WIDTH(S_DEST_WIDTH),
                    .USER_ENABLE(USER_ENABLE),
                    .USER_WIDTH(USER_WIDTH),
                    .ID_ENABLE(ID_ENABLE),
                    .ID_WIDTH(ID_WIDTH),
                    .REG_TYPE(0)
                ) middle_pipeline_register (
                    .clk(select_m_clk),
                    .rst(select_m_rst),

                    .s_axis_tdata(int_axis_tdata[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                    .s_axis_tkeep(int_axis_tkeep[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                    .s_axis_tvalid(int_axis_tvalid[j]),
                    .s_axis_tready(int_axis_tready[j]),
                    .s_axis_tlast(int_axis_tlast[j]),
                    .s_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                    .s_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                    .s_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]),

                    .m_axis_tdata(int_axis_tdata_f[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                    .m_axis_tkeep(int_axis_tkeep_f[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                    .m_axis_tvalid(int_axis_tvalid_f[j]),
                    .m_axis_tready(int_axis_tready_f[j]),
                    .m_axis_tlast(int_axis_tlast_f[j]),
                    .m_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                    .m_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: S_DEST_WIDTH]),
                    .m_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH])
                );

            end
        end
    endgenerate

    // Level 2
    wire [M_COUNT*S_DEST_WIDTH-1:0] m_axis_tdest_r;
    wire [M_COUNT*M_DATA_WIDTH-1:0] m_axis_tdata_n;
    wire [M_COUNT*M_KEEP_WIDTH-1:0] m_axis_tkeep_n;
    wire [M_COUNT-1:0]              m_axis_tvalid_n;
    wire [M_COUNT-1:0]              m_axis_tready_n;
    wire [M_COUNT-1:0]              m_axis_tlast_n;
    wire [M_COUNT*ID_WIDTH-1:0]     m_axis_tid_n;
    wire [M_COUNT*M_DEST_WIDTH-1:0] m_axis_tdest_n;
    wire [M_COUNT*USER_WIDTH-1:0]   m_axis_tuser_n;

    if (M_COUNT==1) begin: last_level_arbiter

        axis_arb_mux #
        (
            .S_COUNT(CLUSTER_COUNT),
            .DATA_WIDTH(M_DATA_WIDTH),
            .KEEP_WIDTH(M_KEEP_WIDTH),
            .KEEP_ENABLE(M_KEEP_ENABLE),
            .DEST_ENABLE(S_DEST_ENABLE),
            .DEST_WIDTH(S_DEST_WIDTH),
            .USER_ENABLE(USER_ENABLE),
            .USER_WIDTH(USER_WIDTH),
            .ID_ENABLE(ID_ENABLE),
            .S_ID_WIDTH(ID_WIDTH),
            .M_ID_WIDTH(ID_WIDTH),
            .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
        ) sw_lvl2
        (
            .clk(select_m_clk),
            .rst(select_m_rst),

            /*
             * AXI Stream inputs
             */
            .s_axis_tdata(int_axis_tdata_f),
            .s_axis_tkeep(int_axis_tkeep_f),
            .s_axis_tvalid(int_axis_tvalid_f),
            .s_axis_tready(int_axis_tready_f),
            .s_axis_tlast(int_axis_tlast_f),
            .s_axis_tid(int_axis_tid_f),
            .s_axis_tdest(int_axis_tdest_f),
            .s_axis_tuser(int_axis_tuser_f),

            /*
             * AXI Stream outputs
             */
            .m_axis_tdata(m_axis_tdata_n),
            .m_axis_tkeep(m_axis_tkeep_n),
            .m_axis_tvalid(m_axis_tvalid_n),
            .m_axis_tready(m_axis_tready_n),
            .m_axis_tlast(m_axis_tlast_n),
            .m_axis_tid(m_axis_tid_n),
            .m_axis_tdest(m_axis_tdest_n),
            .m_axis_tuser(m_axis_tuser_n)

        );

        axis_register # (
            .DATA_WIDTH(M_DATA_WIDTH),
            .KEEP_WIDTH(M_KEEP_WIDTH),
            .KEEP_ENABLE(M_KEEP_ENABLE),
            .DEST_ENABLE(S_DEST_ENABLE),
            .DEST_WIDTH(S_DEST_WIDTH),
            .USER_ENABLE(USER_ENABLE),
            .USER_WIDTH(USER_WIDTH),
            .ID_ENABLE(ID_ENABLE),
            .ID_WIDTH(ID_WIDTH),
            .REG_TYPE(S_REG_TYPE)
        ) output_pipeline_register (
            .clk(select_m_clk),
            .rst(select_m_rst),

            .s_axis_tdata(m_axis_tdata_n),
            .s_axis_tkeep(m_axis_tkeep_n),
            .s_axis_tvalid(m_axis_tvalid_n),
            .s_axis_tready(m_axis_tready_n),
            .s_axis_tlast(m_axis_tlast_n),
            .s_axis_tid(m_axis_tid_n),
            .s_axis_tdest(m_axis_tdest_n),
            .s_axis_tuser(m_axis_tuser_n),

            .m_axis_tdata(m_axis_tdata),
            .m_axis_tkeep(m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(m_axis_tready),
            .m_axis_tlast(m_axis_tlast),
            .m_axis_tid(m_axis_tid),
            .m_axis_tdest(m_axis_tdest_r),
            .m_axis_tuser(m_axis_tuser)
        );

    end else begin: last_level_sw //M_COUNT!=1

        simple_axis_switch #
        (
            .S_COUNT(CLUSTER_COUNT),
            .M_COUNT(M_COUNT),
            .DATA_WIDTH(M_DATA_WIDTH),
            .KEEP_ENABLE(M_KEEP_ENABLE),
            .KEEP_WIDTH(M_KEEP_WIDTH),
            .DEST_WIDTH(S_DEST_WIDTH),
            .USER_ENABLE(USER_ENABLE),
            .USER_WIDTH(USER_WIDTH),
            .ID_ENABLE(ID_ENABLE),
            .ID_WIDTH(ID_WIDTH),
            .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
            .S_REG_TYPE(0),
            .M_REG_TYPE(M_REG_TYPE)
        ) sw_lvl2
        (
            .clk(select_m_clk),
            .rst(select_m_rst),

            /*
             * AXI Stream inputs
             */
            .s_axis_tdata(int_axis_tdata_f),
            .s_axis_tkeep(int_axis_tkeep_f),
            .s_axis_tvalid(int_axis_tvalid_f),
            .s_axis_tready(int_axis_tready_f),
            .s_axis_tlast(int_axis_tlast_f),
            .s_axis_tid(int_axis_tid_f),
            .s_axis_tdest(int_axis_tdest_f),
            .s_axis_tuser(int_axis_tuser_f),

            /*
             * AXI Stream outputs
             */
            .m_axis_tdata(m_axis_tdata),
            .m_axis_tkeep(m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(m_axis_tready),
            .m_axis_tlast(m_axis_tlast),
            .m_axis_tid(m_axis_tid),
            .m_axis_tdest(m_axis_tdest_r),
            .m_axis_tuser(m_axis_tuser)
        );
    end

    genvar i;
    generate
        for (i=0; i<M_COUNT; i=i+1) begin: tdest_cut
            assign m_axis_tdest[i*M_DEST_WIDTH +: M_DEST_WIDTH] =
                M_DEST_ENABLE ? m_axis_tdest_r[i*S_DEST_WIDTH +: M_DEST_WIDTH] : 1'b0;
        end
    endgenerate

endmodule

module axis_simple_sw_grow # (
    parameter S_COUNT               = 4,
    parameter M_COUNT               = 4,
    parameter S_DATA_WIDTH          = 8,
    parameter S_KEEP_ENABLE         = (S_DATA_WIDTH>8),
    parameter S_KEEP_WIDTH          = S_KEEP_ENABLE ? (S_DATA_WIDTH/8) : 1,
    parameter S_DEST_ENABLE         = (M_COUNT>1), // redundant
    parameter S_DEST_WIDTH          = S_DEST_ENABLE ? $clog2(M_COUNT) : 1,
    parameter M_DATA_WIDTH          = 8,
    parameter M_KEEP_ENABLE         = (M_DATA_WIDTH>8),
    parameter M_KEEP_WIDTH          = M_KEEP_ENABLE ? (M_DATA_WIDTH/8) : 1,
    parameter M_DEST_ENABLE         = 0,
    parameter M_DEST_WIDTH          = 1,
    parameter ID_ENABLE             = 0,
    parameter ID_WIDTH              = 1,
    parameter USER_ENABLE           = 1,
    parameter USER_WIDTH            = 1,
    parameter S_REG_TYPE            = 2,
    parameter M_REG_TYPE            = 2,
    parameter ARB_TYPE_ROUND_ROBIN  = 1,
    parameter ARB_LSB_HIGH_PRIORITY = 1,
    parameter CLUSTER_COUNT         = 4,
    parameter STAGE_FIFO_DEPTH      = 8192,
    parameter RAM_PIPELINE          = 2,
    parameter FRAME_FIFO            = 0,
    parameter SEPARATE_CLOCKS       = 0
) (
    /*
     * AXI Stream inputs
     */
    input  wire                            s_clk,
    input  wire                            s_rst,
    input  wire [S_COUNT*S_DATA_WIDTH-1:0] s_axis_tdata,
    input  wire [S_COUNT*S_KEEP_WIDTH-1:0] s_axis_tkeep,
    input  wire [S_COUNT-1:0]              s_axis_tvalid,
    output wire [S_COUNT-1:0]              s_axis_tready,
    input  wire [S_COUNT-1:0]              s_axis_tlast,
    input  wire [S_COUNT*ID_WIDTH-1:0]     s_axis_tid,
    input  wire [S_COUNT*S_DEST_WIDTH-1:0] s_axis_tdest,
    input  wire [S_COUNT*USER_WIDTH-1:0]   s_axis_tuser,

    /*
     * AXI Stream outputs
     */
    input  wire                            m_clk,
    input  wire                            m_rst,
    output wire [M_COUNT*M_DATA_WIDTH-1:0] m_axis_tdata,
    output wire [M_COUNT*M_KEEP_WIDTH-1:0] m_axis_tkeep,
    output wire [M_COUNT-1:0]              m_axis_tvalid,
    input  wire [M_COUNT-1:0]              m_axis_tready,
    output wire [M_COUNT-1:0]              m_axis_tlast,
    output wire [M_COUNT*ID_WIDTH-1:0]     m_axis_tid,
    output wire [M_COUNT*M_DEST_WIDTH-1:0] m_axis_tdest,
    output wire [M_COUNT*USER_WIDTH-1:0]   m_axis_tuser
);
    wire select_m_clk = SEPARATE_CLOCKS ? m_clk : s_clk;
    wire select_m_rst = SEPARATE_CLOCKS ? m_rst : s_rst;

    localparam M_PER_CLUSTER     = M_COUNT/CLUSTER_COUNT;
    localparam INT_DEST_WIDTH    = S_DEST_WIDTH-$clog2(CLUSTER_COUNT);
    localparam STAGE_FIFO_ENABLE = (STAGE_FIFO_DEPTH>0);

    // Level 1
    wire [CLUSTER_COUNT*S_DATA_WIDTH-1:0] int_axis_tdata;
    wire [CLUSTER_COUNT*S_KEEP_WIDTH-1:0] int_axis_tkeep;
    wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest;
    wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser;
    wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid;
    wire [CLUSTER_COUNT-1:0]              int_axis_tvalid,
                                          int_axis_tready,
                                          int_axis_tlast;

    // Data channel switch
    simple_axis_switch #
    (
        .S_COUNT(S_COUNT),
        .M_COUNT(CLUSTER_COUNT),
        .DATA_WIDTH(S_DATA_WIDTH),
        .KEEP_ENABLE(S_KEEP_ENABLE),
        .KEEP_WIDTH(S_KEEP_WIDTH),
        .DEST_WIDTH(S_DEST_WIDTH),
        .USER_ENABLE(USER_ENABLE),
        .USER_WIDTH(USER_WIDTH),
        .ID_ENABLE(ID_ENABLE),
        .ID_WIDTH(ID_WIDTH),
        .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
        .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
        .S_REG_TYPE(S_REG_TYPE),
        .M_REG_TYPE(M_REG_TYPE)
    ) sw_lvl1
    (
        .clk(s_clk),
        .rst(s_rst),

        /*
         * AXI Stream inputs
         */
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tid(s_axis_tid),
        .s_axis_tdest(s_axis_tdest),
        .s_axis_tuser(s_axis_tuser),

        /*
         * AXI Stream outputs
         */
        .m_axis_tdata(int_axis_tdata),
        .m_axis_tkeep(int_axis_tkeep),
        .m_axis_tvalid(int_axis_tvalid),
        .m_axis_tready(int_axis_tready),
        .m_axis_tlast(int_axis_tlast),
        .m_axis_tid(int_axis_tid),
        .m_axis_tdest(int_axis_tdest),
        .m_axis_tuser(int_axis_tuser)
    );

    // Level 2
    genvar i,j;
    generate
        if (M_PER_CLUSTER == 1) begin: bypass
            // TODO add fifo if async

            assign m_axis_tdata    = int_axis_tdata;
            assign m_axis_tkeep    = int_axis_tkeep;
            assign m_axis_tuser    = int_axis_tuser;
            assign m_axis_tid      = int_axis_tid;
            assign m_axis_tvalid   = int_axis_tvalid;
            assign m_axis_tlast    = int_axis_tlast;
            assign int_axis_tready = m_axis_tready;

            for (j=0; j<CLUSTER_COUNT; j=j+1) begin: tdest_cut
                assign m_axis_tdest[j*M_DEST_WIDTH +: M_DEST_WIDTH] =
                    M_DEST_ENABLE ? int_axis_tdest[j*S_DEST_WIDTH +: M_DEST_WIDTH] : 1'b0;
            end

        end else begin: clusters

            wire [CLUSTER_COUNT*M_DATA_WIDTH-1:0] int_axis_tdata_f;
            wire [CLUSTER_COUNT*M_KEEP_WIDTH-1:0] int_axis_tkeep_f;
            wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest_f;
            wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser_f;
            wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid_f;
            wire [CLUSTER_COUNT-1:0]              int_axis_tvalid_f,
                                                  int_axis_tready_f,
                                                  int_axis_tlast_f;

            wire [M_COUNT*INT_DEST_WIDTH-1:0]     m_axis_tdest_r;


            for (j=0; j<CLUSTER_COUNT; j=j+1) begin : fifo_n_switch
                if (STAGE_FIFO_ENABLE) begin: fifos
                    if (SEPARATE_CLOCKS) begin: async_fifos
                        axis_async_fifo_adapter # (
                            .DEPTH(STAGE_FIFO_DEPTH),
                            .S_DATA_WIDTH(S_DATA_WIDTH),
                            .S_KEEP_ENABLE(S_KEEP_ENABLE),
                            .S_KEEP_WIDTH(S_KEEP_WIDTH),
                            .M_DATA_WIDTH(M_DATA_WIDTH),
                            .M_KEEP_ENABLE(M_KEEP_ENABLE),
                            .M_KEEP_WIDTH(M_KEEP_WIDTH),
                            .DEST_ENABLE(1),
                            .DEST_WIDTH(INT_DEST_WIDTH),
                            .USER_ENABLE(USER_ENABLE),
                            .USER_WIDTH(USER_WIDTH),
                            .ID_ENABLE(ID_ENABLE),
                            .ID_WIDTH(ID_WIDTH),
                            .RAM_PIPELINE(RAM_PIPELINE),
                            .FRAME_FIFO(FRAME_FIFO)
                        ) stage_fifo (
                            .s_clk(s_clk),
                            .s_rst(s_rst),
                            .s_axis_tdata(int_axis_tdata[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                            .s_axis_tkeep(int_axis_tkeep[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                            .s_axis_tvalid(int_axis_tvalid[j]),
                            .s_axis_tready(int_axis_tready[j]),
                            .s_axis_tlast(int_axis_tlast[j]),
                            .s_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                            .s_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                            .s_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]),

                            .m_clk(select_m_clk),
                            .m_rst(select_m_rst),
                            .m_axis_tdata(int_axis_tdata_f[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                            .m_axis_tkeep(int_axis_tkeep_f[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                            .m_axis_tvalid(int_axis_tvalid_f[j]),
                            .m_axis_tready(int_axis_tready_f[j]),
                            .m_axis_tlast(int_axis_tlast_f[j]),
                            .m_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                            .m_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                            .m_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]),

                            .s_status_overflow(),
                            .s_status_bad_frame(),
                            .s_status_good_frame(),
                            .m_status_overflow(),
                            .m_status_bad_frame(),
                            .m_status_good_frame()
                        );
                    end else begin: normal_fifo
                        axis_fifo_adapter # (
                            .DEPTH(STAGE_FIFO_DEPTH),
                            .S_DATA_WIDTH(S_DATA_WIDTH),
                            .S_KEEP_ENABLE(S_KEEP_ENABLE),
                            .S_KEEP_WIDTH(S_KEEP_WIDTH),
                            .M_DATA_WIDTH(M_DATA_WIDTH),
                            .M_KEEP_ENABLE(M_KEEP_ENABLE),
                            .M_KEEP_WIDTH(M_KEEP_WIDTH),
                            .DEST_ENABLE(1),
                            .DEST_WIDTH(INT_DEST_WIDTH),
                            .USER_ENABLE(USER_ENABLE),
                            .USER_WIDTH(USER_WIDTH),
                            .ID_ENABLE(ID_ENABLE),
                            .ID_WIDTH(ID_WIDTH),
                            .RAM_PIPELINE(RAM_PIPELINE),
                            .FRAME_FIFO(FRAME_FIFO)
                        ) stage_fifo (
                            .clk(s_clk),
                            .rst(s_rst),

                            .s_axis_tdata(int_axis_tdata[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                            .s_axis_tkeep(int_axis_tkeep[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                            .s_axis_tvalid(int_axis_tvalid[j]),
                            .s_axis_tready(int_axis_tready[j]),
                            .s_axis_tlast(int_axis_tlast[j]),
                            .s_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                            .s_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                            .s_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]),

                            .m_axis_tdata(int_axis_tdata_f[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                            .m_axis_tkeep(int_axis_tkeep_f[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                            .m_axis_tvalid(int_axis_tvalid_f[j]),
                            .m_axis_tready(int_axis_tready_f[j]),
                            .m_axis_tlast(int_axis_tlast_f[j]),
                            .m_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                            .m_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                            .m_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]),

                            .status_overflow(),
                            .status_bad_frame(),
                            .status_good_frame()
                        );
                    end
                end else begin: no_fifo
                    assign int_axis_tdata_f  = int_axis_tdata;
                    assign int_axis_tkeep_f  = int_axis_tkeep;
                    assign int_axis_tdest_f  = int_axis_tdest;
                    assign int_axis_tuser_f  = int_axis_tuser;
                    assign int_axis_tid_f    = int_axis_tid;
                    assign int_axis_tvalid_f = int_axis_tvalid;
                    assign int_axis_tlast_f  = int_axis_tlast;
                    assign int_axis_tready   = int_axis_tready_f;
                end

                simple_axis_switch #
                (
                    .S_COUNT(1),
                    .M_COUNT(M_PER_CLUSTER),
                    .DATA_WIDTH(M_DATA_WIDTH),
                    .KEEP_WIDTH(M_KEEP_WIDTH),
                    .KEEP_ENABLE(M_KEEP_ENABLE),
                    .DEST_WIDTH(INT_DEST_WIDTH),
                    .USER_ENABLE(USER_ENABLE),
                    .USER_WIDTH(USER_WIDTH),
                    .ID_ENABLE(ID_ENABLE),
                    .ID_WIDTH(ID_WIDTH),
                    .S_REG_TYPE(S_REG_TYPE),
                    .M_REG_TYPE(M_REG_TYPE),
                    .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
                    .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
                ) sw_lvl2
                (
                    .clk(select_m_clk),
                    .rst(select_m_rst),

                    .s_axis_tdata(int_axis_tdata_f[j*M_DATA_WIDTH +: M_DATA_WIDTH]),
                    .s_axis_tkeep(int_axis_tkeep_f[j*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
                    .s_axis_tvalid(int_axis_tvalid_f[j]),
                    .s_axis_tready(int_axis_tready_f[j]),
                    .s_axis_tlast(int_axis_tlast_f[j]),
                    .s_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                    .s_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                    .s_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]),

                    .m_axis_tdata(m_axis_tdata[j*M_PER_CLUSTER*M_DATA_WIDTH +: M_PER_CLUSTER*M_DATA_WIDTH]),
                    .m_axis_tkeep(m_axis_tkeep[j*M_PER_CLUSTER*M_KEEP_WIDTH +: M_PER_CLUSTER*M_KEEP_WIDTH]),
                    .m_axis_tvalid(m_axis_tvalid[j*M_PER_CLUSTER +: M_PER_CLUSTER]),
                    .m_axis_tready(m_axis_tready[j*M_PER_CLUSTER +: M_PER_CLUSTER]),
                    .m_axis_tid(m_axis_tid[j*M_PER_CLUSTER*ID_WIDTH +: M_PER_CLUSTER*ID_WIDTH]),
                    .m_axis_tlast(m_axis_tlast[j*M_PER_CLUSTER +: M_PER_CLUSTER]),
                    .m_axis_tdest(m_axis_tdest_r[j*M_PER_CLUSTER*INT_DEST_WIDTH +: M_PER_CLUSTER*INT_DEST_WIDTH]),
                    .m_axis_tuser(m_axis_tuser[j*M_PER_CLUSTER*USER_WIDTH +: M_PER_CLUSTER*USER_WIDTH])
                );
            end

            for (i=0; i<M_COUNT; i=i+1) begin: tdest_cut
                assign m_axis_tdest[i*M_DEST_WIDTH +: M_DEST_WIDTH] =
                   M_DEST_ENABLE ? m_axis_tdest_r[i*INT_DEST_WIDTH +: M_DEST_WIDTH] : 1'b0;
            end
        end
    endgenerate

endmodule

module axis_ram_sw_grow # (
    parameter S_COUNT               = 4,
    parameter M_COUNT               = 4,
    parameter S_DATA_WIDTH          = 8,
    parameter S_KEEP_ENABLE         = (S_DATA_WIDTH>8),
    parameter S_KEEP_WIDTH          = S_KEEP_ENABLE ? (S_DATA_WIDTH/8) : 1,
    parameter S_DEST_ENABLE         = (M_COUNT>1), // redundant
    parameter S_DEST_WIDTH          = S_DEST_ENABLE ? $clog2(M_COUNT) : 1,
    parameter M_DATA_WIDTH          = 8,
    parameter M_KEEP_ENABLE         = (M_DATA_WIDTH>8),
    parameter M_KEEP_WIDTH          = M_KEEP_ENABLE ? (M_DATA_WIDTH/8) : 1,
    parameter M_DEST_ENABLE         = 0,
    parameter M_DEST_WIDTH          = 1,
    parameter ID_ENABLE             = 0,
    parameter ID_WIDTH              = 1,
    parameter USER_ENABLE           = 1,
    parameter USER_WIDTH            = 1,
    parameter S_REG_TYPE            = 2,
    parameter M_REG_TYPE            = 2,
    parameter ARB_TYPE_ROUND_ROBIN  = 1,
    parameter ARB_LSB_HIGH_PRIORITY = 1,
    parameter CLUSTER_COUNT         = 4,
    parameter STAGE_FIFO_DEPTH      = 8192,
    parameter RAM_PIPELINE          = 2,
    parameter FRAME_FIFO            = 0,
    parameter SEPARATE_CLOCKS       = 0
) (
    /*
     * AXI Stream inputs
     */
    input  wire                            s_clk,
    input  wire                            s_rst,
    input  wire [S_COUNT*S_DATA_WIDTH-1:0] s_axis_tdata,
    input  wire [S_COUNT*S_KEEP_WIDTH-1:0] s_axis_tkeep,
    input  wire [S_COUNT-1:0]              s_axis_tvalid,
    output wire [S_COUNT-1:0]              s_axis_tready,
    input  wire [S_COUNT-1:0]              s_axis_tlast,
    input  wire [S_COUNT*ID_WIDTH-1:0]     s_axis_tid,
    input  wire [S_COUNT*S_DEST_WIDTH-1:0] s_axis_tdest,
    input  wire [S_COUNT*USER_WIDTH-1:0]   s_axis_tuser,

    /*
     * AXI Stream outputs
     */
    input  wire                            m_clk,
    input  wire                            m_rst,
    output wire [M_COUNT*M_DATA_WIDTH-1:0] m_axis_tdata,
    output wire [M_COUNT*M_KEEP_WIDTH-1:0] m_axis_tkeep,
    output wire [M_COUNT-1:0]              m_axis_tvalid,
    input  wire [M_COUNT-1:0]              m_axis_tready,
    output wire [M_COUNT-1:0]              m_axis_tlast,
    output wire [M_COUNT*ID_WIDTH-1:0]     m_axis_tid,
    output wire [M_COUNT*M_DEST_WIDTH-1:0] m_axis_tdest,
    output wire [M_COUNT*USER_WIDTH-1:0]   m_axis_tuser
);
    wire select_m_clk = SEPARATE_CLOCKS ? m_clk : s_clk;
    wire select_m_rst = SEPARATE_CLOCKS ? m_rst : s_rst;

    localparam M_PER_CLUSTER     = M_COUNT/CLUSTER_COUNT;
    localparam INT_DEST_WIDTH    = S_DEST_WIDTH-$clog2(CLUSTER_COUNT);
    localparam STAGE_FIFO_ENABLE = (STAGE_FIFO_DEPTH>0);

    // Level 1
    wire [CLUSTER_COUNT*S_DATA_WIDTH-1:0] int_axis_tdata;
    wire [CLUSTER_COUNT*S_KEEP_WIDTH-1:0] int_axis_tkeep;
    wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest;
    wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser;
    wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid;
    wire [CLUSTER_COUNT-1:0]              int_axis_tvalid,
                                          int_axis_tready,
                                          int_axis_tlast;

    wire [M_COUNT*M_DATA_WIDTH-1:0]       m_axis_tdata_n;
    wire [M_COUNT*M_KEEP_WIDTH-1:0]       m_axis_tkeep_n;
    wire [M_COUNT-1:0]                    m_axis_tvalid_n;
    wire [M_COUNT-1:0]                    m_axis_tready_n;
    wire [M_COUNT-1:0]                    m_axis_tlast_n;
    wire [M_COUNT*ID_WIDTH-1:0]           m_axis_tid_n;
    wire [M_COUNT*M_DEST_WIDTH-1:0]       m_axis_tdest_n;
    wire [M_COUNT*USER_WIDTH-1:0]         m_axis_tuser_n;

    // Data channel switch
    simple_axis_switch #
    (
        .S_COUNT(S_COUNT),
        .M_COUNT(CLUSTER_COUNT),
        .DATA_WIDTH(S_DATA_WIDTH),
        .KEEP_ENABLE(S_KEEP_ENABLE),
        .KEEP_WIDTH(S_KEEP_WIDTH),
        .DEST_WIDTH(S_DEST_WIDTH),
        .USER_ENABLE(USER_ENABLE),
        .USER_WIDTH(USER_WIDTH),
        .ID_ENABLE(ID_ENABLE),
        .ID_WIDTH(ID_WIDTH),
        .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
        .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
        .S_REG_TYPE(S_REG_TYPE),
        .M_REG_TYPE(0)
    ) sw_lvl1
    (
        .clk(s_clk),
        .rst(s_rst),

        /*
         * AXI Stream inputs
         */
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tid(s_axis_tid),
        .s_axis_tdest(s_axis_tdest),
        .s_axis_tuser(s_axis_tuser),

        /*
         * AXI Stream outputs
         */
        .m_axis_tdata(int_axis_tdata),
        .m_axis_tkeep(int_axis_tkeep),
        .m_axis_tvalid(int_axis_tvalid),
        .m_axis_tready(int_axis_tready),
        .m_axis_tlast(int_axis_tlast),
        .m_axis_tid(int_axis_tid),
        .m_axis_tdest(int_axis_tdest),
        .m_axis_tuser(int_axis_tuser)
    );

    wire [CLUSTER_COUNT*S_DATA_WIDTH-1:0] int_axis_tdata_f;
    wire [CLUSTER_COUNT*S_KEEP_WIDTH-1:0] int_axis_tkeep_f;
    wire [CLUSTER_COUNT*S_DEST_WIDTH-1:0] int_axis_tdest_f;
    wire [CLUSTER_COUNT*USER_WIDTH-1:0]   int_axis_tuser_f;
    wire [CLUSTER_COUNT*ID_WIDTH-1:0]     int_axis_tid_f;
    wire [CLUSTER_COUNT-1:0]              int_axis_tvalid_f,
                                          int_axis_tready_f,
                                          int_axis_tlast_f;

    wire [M_COUNT*INT_DEST_WIDTH-1:0]     m_axis_tdest_r;

    // Level 2
    genvar i,j;
    generate
        for (j=0; j<CLUSTER_COUNT; j=j+1) begin : fifo_n_ram_sw
            if (SEPARATE_CLOCKS) begin: async_fifo
                axis_async_fifo_adapter # (
                    .DEPTH(32*S_KEEP_WIDTH),
                    .S_DATA_WIDTH(S_DATA_WIDTH),
                    .S_KEEP_ENABLE(S_KEEP_ENABLE),
                    .S_KEEP_WIDTH(S_KEEP_WIDTH),
                    .M_DATA_WIDTH(S_DATA_WIDTH),
                    .M_KEEP_ENABLE(S_KEEP_ENABLE),
                    .M_KEEP_WIDTH(S_KEEP_WIDTH),
                    .DEST_ENABLE(1),
                    .DEST_WIDTH(INT_DEST_WIDTH),
                    .USER_ENABLE(USER_ENABLE),
                    .USER_WIDTH(USER_WIDTH),
                    .ID_ENABLE(ID_ENABLE),
                    .ID_WIDTH(ID_WIDTH),
                    .RAM_PIPELINE(2),
                    .FRAME_FIFO(0)
                ) stage_fifo (
                    .s_clk(s_clk),
                    .s_rst(s_rst),
                    .s_axis_tdata(int_axis_tdata[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    .s_axis_tkeep(int_axis_tkeep[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                    .s_axis_tvalid(int_axis_tvalid[j]),
                    .s_axis_tready(int_axis_tready[j]),
                    .s_axis_tlast(int_axis_tlast[j]),
                    .s_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                    .s_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                    .s_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]),

                    .m_clk(select_m_clk),
                    .m_rst(select_m_rst),
                    .m_axis_tdata(int_axis_tdata_f[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    .m_axis_tkeep(int_axis_tkeep_f[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                    .m_axis_tvalid(int_axis_tvalid_f[j]),
                    .m_axis_tready(int_axis_tready_f[j]),
                    .m_axis_tlast(int_axis_tlast_f[j]),
                    .m_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                    .m_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                    .m_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]),

                    .s_status_overflow(),
                    .s_status_bad_frame(),
                    .s_status_good_frame(),
                    .m_status_overflow(),
                    .m_status_bad_frame(),
                    .m_status_good_frame()
                );

            end else begin: no_fifo

                axis_register # (
                    .DATA_WIDTH(S_DATA_WIDTH),
                    .KEEP_ENABLE(S_KEEP_ENABLE),
                    .KEEP_WIDTH(S_KEEP_WIDTH),
                    .DEST_ENABLE(1),
                    .DEST_WIDTH(INT_DEST_WIDTH),
                    .USER_ENABLE(USER_ENABLE),
                    .USER_WIDTH(USER_WIDTH),
                    .ID_ENABLE(ID_ENABLE),
                    .ID_WIDTH(ID_WIDTH),
                    .REG_TYPE(0)
                ) middle_pipeline_register (
                    .clk(select_m_clk),
                    .rst(select_m_rst),

                    .s_axis_tdata(int_axis_tdata[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    .s_axis_tkeep(int_axis_tkeep[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                    .s_axis_tvalid(int_axis_tvalid[j]),
                    .s_axis_tready(int_axis_tready[j]),
                    .s_axis_tlast(int_axis_tlast[j]),
                    .s_axis_tid(int_axis_tid[j*ID_WIDTH +: ID_WIDTH]),
                    .s_axis_tdest(int_axis_tdest[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                    .s_axis_tuser(int_axis_tuser[j*USER_WIDTH +: USER_WIDTH]),

                    .m_axis_tdata(int_axis_tdata_f[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    .m_axis_tkeep(int_axis_tkeep_f[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                    .m_axis_tvalid(int_axis_tvalid_f[j]),
                    .m_axis_tready(int_axis_tready_f[j]),
                    .m_axis_tlast(int_axis_tlast_f[j]),
                    .m_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                    .m_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                    .m_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH])
                );
            end

            axis_ram_switch # (
                .FIFO_DEPTH(STAGE_FIFO_DEPTH),
                .CMD_FIFO_DEPTH(128),
                .S_COUNT(1),
                .S_DATA_WIDTH(S_DATA_WIDTH),
                .S_KEEP_ENABLE(S_KEEP_ENABLE),
                .S_KEEP_WIDTH(S_KEEP_WIDTH),
                .M_COUNT(M_PER_CLUSTER),
                .M_DATA_WIDTH(M_DATA_WIDTH),
                .M_KEEP_ENABLE(M_KEEP_ENABLE),
                .M_KEEP_WIDTH(M_KEEP_WIDTH),
                .DEST_WIDTH(INT_DEST_WIDTH),
                .USER_ENABLE(USER_ENABLE),
                .USER_WIDTH(USER_WIDTH),
                .ID_ENABLE(ID_ENABLE),
                .ID_WIDTH(ID_WIDTH),
                .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
                .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY),
                .RAM_PIPELINE(RAM_PIPELINE)
            ) sw_lvl2 (
                .clk(select_m_clk),
                .rst(select_m_rst),

                .s_axis_tdata(int_axis_tdata_f[j*S_DATA_WIDTH +: S_DATA_WIDTH]),
                .s_axis_tkeep(int_axis_tkeep_f[j*S_KEEP_WIDTH +: S_KEEP_WIDTH]),
                .s_axis_tvalid(int_axis_tvalid_f[j]),
                .s_axis_tready(int_axis_tready_f[j]),
                .s_axis_tlast(int_axis_tlast_f[j]),
                .s_axis_tid(int_axis_tid_f[j*ID_WIDTH +: ID_WIDTH]),
                .s_axis_tdest(int_axis_tdest_f[j*S_DEST_WIDTH +: INT_DEST_WIDTH]),
                .s_axis_tuser(int_axis_tuser_f[j*USER_WIDTH +: USER_WIDTH]),

                .m_axis_tdata(m_axis_tdata_n[j*M_PER_CLUSTER*M_DATA_WIDTH +: M_PER_CLUSTER*M_DATA_WIDTH]),
                .m_axis_tkeep(m_axis_tkeep_n[j*M_PER_CLUSTER*M_KEEP_WIDTH +: M_PER_CLUSTER*M_KEEP_WIDTH]),
                .m_axis_tvalid(m_axis_tvalid_n[j*M_PER_CLUSTER +: M_PER_CLUSTER]),
                .m_axis_tready(m_axis_tready_n[j*M_PER_CLUSTER +: M_PER_CLUSTER]),
                .m_axis_tid(m_axis_tid_n[j*M_PER_CLUSTER*ID_WIDTH +: M_PER_CLUSTER*ID_WIDTH]),
                .m_axis_tlast(m_axis_tlast_n[j*M_PER_CLUSTER +: M_PER_CLUSTER]),
                .m_axis_tdest(m_axis_tdest_r[j*M_PER_CLUSTER*INT_DEST_WIDTH +: M_PER_CLUSTER*INT_DEST_WIDTH]),
                .m_axis_tuser(m_axis_tuser_n[j*M_PER_CLUSTER*USER_WIDTH +: M_PER_CLUSTER*USER_WIDTH]),

                .status_overflow(),
                .status_bad_frame(),
                .status_good_frame()
            );

            for (i=0; i<M_COUNT; i=i+1) begin: tdest_cut
                assign m_axis_tdest_n[i*M_DEST_WIDTH +: M_DEST_WIDTH] =
                   M_DEST_ENABLE ? m_axis_tdest_r[i*INT_DEST_WIDTH +: M_DEST_WIDTH] : 1'b0;
            end
        end
    endgenerate

    genvar k;
    generate
      for (k=0; k<M_COUNT; k=k+1) begin: output_registers
        axis_slr_register # (
              .DATA_WIDTH(M_DATA_WIDTH),
              .KEEP_ENABLE(M_KEEP_ENABLE),
              .KEEP_WIDTH(M_KEEP_WIDTH),
              .DEST_ENABLE(M_DEST_ENABLE),
              .DEST_WIDTH(M_DEST_WIDTH),
              .USER_ENABLE(USER_ENABLE),
              .USER_WIDTH(USER_WIDTH),
              .ID_ENABLE(ID_ENABLE),
              .ID_WIDTH(ID_WIDTH)
        ) output_register (
          .clk(select_m_clk),
          .rst(select_m_rst),

          .s_axis_tdata(m_axis_tdata_n[k*M_DATA_WIDTH +: M_DATA_WIDTH]),
          .s_axis_tkeep(m_axis_tkeep_n[k*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
          .s_axis_tvalid(m_axis_tvalid_n[k]),
          .s_axis_tready(m_axis_tready_n[k]),
          .s_axis_tlast(m_axis_tlast_n[k]),
          .s_axis_tid(m_axis_tid_n[k*ID_WIDTH +: ID_WIDTH]),
          .s_axis_tdest(m_axis_tdest_n[k*M_DEST_WIDTH +: M_DEST_WIDTH]),
          .s_axis_tuser(m_axis_tuser_n[k*USER_WIDTH +: USER_WIDTH]),

          .m_axis_tdata(m_axis_tdata[k*M_DATA_WIDTH +: M_DATA_WIDTH]),
          .m_axis_tkeep(m_axis_tkeep[k*M_KEEP_WIDTH +: M_KEEP_WIDTH]),
          .m_axis_tvalid(m_axis_tvalid[k]),
          .m_axis_tready(m_axis_tready[k]),
          .m_axis_tlast(m_axis_tlast[k]),
          .m_axis_tid(m_axis_tid[k*ID_WIDTH +: ID_WIDTH]),
          .m_axis_tdest(m_axis_tdest[k*M_DEST_WIDTH +: M_DEST_WIDTH]),
          .m_axis_tuser(m_axis_tuser[k*USER_WIDTH +: USER_WIDTH])
        );
      end
    endgenerate

endmodule

`resetall
