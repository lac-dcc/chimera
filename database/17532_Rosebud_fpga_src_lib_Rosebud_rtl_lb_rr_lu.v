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

module lb_rr_lu # (
  parameter IF_COUNT        = 3,
  parameter PORT_COUNT      = 5,
  parameter CORE_COUNT      = 8,
  parameter SLOT_COUNT      = 32,
  parameter DATA_WIDTH      = 512,
  parameter RX_LINES_WIDTH  = 13,
  parameter CLUSTER_COUNT   = 2,
  parameter SLOT_WIDTH      = $clog2(SLOT_COUNT+1),
  parameter CORE_ID_WIDTH   = $clog2(CORE_COUNT),
  parameter INTERFACE_WIDTH = $clog2(IF_COUNT),
  parameter PORT_WIDTH      = $clog2(PORT_COUNT),
  parameter TAG_WIDTH       = (SLOT_WIDTH>5)? SLOT_WIDTH:5,
  parameter ID_TAG_WIDTH    = CORE_ID_WIDTH+TAG_WIDTH,
  parameter STRB_WIDTH      = DATA_WIDTH/8
) (
  input  wire                               clk,
  input  wire                               rst,

  // Data input and output streams
  input  wire [IF_COUNT*DATA_WIDTH-1:0]     s_axis_tdata,
  input  wire [IF_COUNT*STRB_WIDTH-1:0]     s_axis_tkeep,
  input  wire [IF_COUNT-1:0]                s_axis_tvalid,
  output wire [IF_COUNT-1:0]                s_axis_tready,
  input  wire [IF_COUNT-1:0]                s_axis_tlast,
  input  wire [IF_COUNT*RX_LINES_WIDTH-1:0] s_axis_line_count,

  output wire [IF_COUNT*DATA_WIDTH-1:0]     m_axis_tdata,
  output wire [IF_COUNT*STRB_WIDTH-1:0]     m_axis_tkeep,
  output wire [IF_COUNT*ID_TAG_WIDTH-1:0]   m_axis_tdest,
  output wire [IF_COUNT*PORT_WIDTH-1:0]     m_axis_tuser,
  output wire [IF_COUNT-1:0]                m_axis_tvalid,
  input  wire [IF_COUNT-1:0]                m_axis_tready,
  output wire [IF_COUNT-1:0]                m_axis_tlast,

  // Host command interface
  input  wire [28:0]                        host_cmd,
  input  wire                               host_cmd_for_ints,
  input  wire [31:0]                        host_cmd_wr_data,
  output reg  [31:0]                        host_cmd_rd_data,
  input  wire                               host_cmd_wr_en,

  // Config registers outputs and slots status inputs
  output reg  [CORE_COUNT-1:0]              enabled_cores,
  output reg  [CORE_COUNT-1:0]              slots_flush,
  input  wire [CORE_COUNT*SLOT_WIDTH-1:0]   slot_counts,
  input  wire [CORE_COUNT-1:0]              slot_valids,
  input  wire [CORE_COUNT-1:0]              slot_busys,
  input  wire [CORE_COUNT-1:0]              slot_ins_errs,

  // Request and response to lb_controller
  // selecting target core and asserting pop, and ready desc
  output wire [CORE_ID_WIDTH-1:0]           selected_core,
  output wire                               desc_pop,
  input  wire [ID_TAG_WIDTH-1:0]            desc_data
);

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////// Host command parsing ////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  wire [CORE_ID_WIDTH-1:0]   stat_read_core      = host_cmd[CORE_ID_WIDTH+4-1:4];
  wire [INTERFACE_WIDTH-1:0] stat_read_interface = host_cmd[INTERFACE_WIDTH+4-1:4];
  wire [3:0]                 host_cmd_reg        = host_cmd[3:0];

  reg [CORE_COUNT-1:0]     income_cores;
  reg [IF_COUNT-1:0]       release_desc;
  reg [RX_LINES_WIDTH-1:0] drop_limit;

  always @ (posedge clk) begin
    if (host_cmd_wr_en)
      case ({host_cmd_for_ints, host_cmd_reg})
        // CORES
        5'h00: begin
          // A core to be reset cannot be an incoming core.
          income_cores  <= income_cores & host_cmd_wr_data[CORE_COUNT-1:0];
          enabled_cores <= host_cmd_wr_data[CORE_COUNT-1:0];
        end
        5'h01: begin
          income_cores  <= host_cmd_wr_data[CORE_COUNT-1:0] & enabled_cores;
        end
        5'h02: begin
          slots_flush   <= host_cmd_wr_data[CORE_COUNT-1:0];
        end
        // INTS
        5'h12: begin
          release_desc  <= host_cmd_wr_data[IF_COUNT-1:0];
        end
        5'h13: begin
          drop_limit    <= host_cmd_wr_data[RX_LINES_WIDTH-1:0];
        end

        default: begin //for one-cycle signals
          release_desc <= {IF_COUNT{1'b0}};
          slots_flush  <= {CORE_COUNT{1'b0}};
        end
      endcase
    else begin // for one-cycle signals
          release_desc <= {IF_COUNT{1'b0}};
          slots_flush  <= {CORE_COUNT{1'b0}};
    end

    if (rst) begin
      income_cores  <= {CORE_COUNT{1'b0}};
      enabled_cores <= {CORE_COUNT{1'b0}};
      release_desc  <= {IF_COUNT{1'b0}};
      slots_flush   <= {CORE_COUNT{1'b0}};
      drop_limit    <= RX_LINES_WIDTH > 4 ?
                       {4'd7, {(RX_LINES_WIDTH-4){1'b0}}}:
                       {1'b1, {(RX_LINES_WIDTH-1){1'b0}}};
    end
  end

  reg [IF_COUNT-1:0] s_axis_almost_full;
  integer l;
  always @ (posedge clk) begin
    for (l=0;l<IF_COUNT;l=l+1)
      s_axis_almost_full[l] <=
          (s_axis_line_count[l*RX_LINES_WIDTH +: RX_LINES_WIDTH] >= drop_limit);
    if (rst)
      s_axis_almost_full <= {IF_COUNT{1'b0}};
  end

  reg  [1:0] port_state [0:IF_COUNT-1];
  reg  [IF_COUNT*ID_TAG_WIDTH-1:0] dest_r;
  wire [IF_COUNT*32-1:0]  drop_count;

  always @ (posedge clk)
    case ({host_cmd_for_ints, host_cmd_reg})
      // CORES
      5'h00:   host_cmd_rd_data <= enabled_cores;
      5'h01:   host_cmd_rd_data <= income_cores;
      5'h03:   host_cmd_rd_data <= slot_counts[stat_read_core * SLOT_WIDTH +: SLOT_WIDTH];
      // INTS
      5'h10:   host_cmd_rd_data <= {14'd0, port_state[stat_read_interface],
                                  {(8-CORE_ID_WIDTH){1'b0}},
                                  dest_r[(stat_read_interface * ID_TAG_WIDTH) + TAG_WIDTH +: CORE_ID_WIDTH],
                                  {(8-TAG_WIDTH){1'b0}},
                                  dest_r[stat_read_interface * ID_TAG_WIDTH +: TAG_WIDTH]};
      5'h12:   host_cmd_rd_data <= drop_count[stat_read_interface*32 +: 32];
      default: host_cmd_rd_data <= 32'hFEFEFEFE;
    endcase

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////// Load balancing policy ///////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  // Selecting the core with most available slots
  // Since slots start from 1, SLOT WIDTH is already 1 bit extra
  localparam CLUSTER_CORES      = CORE_COUNT/CLUSTER_COUNT;
  localparam CLUSTER_WIDTH      = $clog2(CLUSTER_COUNT);
  localparam CLUSTER_CORE_WIDTH = $clog2(CLUSTER_CORES);

  wire [CLUSTER_COUNT-1:0] cluster_max_valid;
  wire [CLUSTER_CORE_WIDTH-1:0] selected_cluster_core [0:CLUSTER_COUNT-1];
  wire [CORE_COUNT-1:0] masks = income_cores & ~slot_busys;

  genvar k;
  generate
    for (k=0; k<CLUSTER_COUNT; k=k+1) begin
      max_finder_tree # (
        .PORT_COUNT(CLUSTER_CORES),
        .DATA_WIDTH(SLOT_WIDTH)
      ) core_selector (
        .values(slot_counts[k*CLUSTER_CORES*SLOT_WIDTH +: CLUSTER_CORES*SLOT_WIDTH]),
        .valids(masks[k*CLUSTER_CORES +: CLUSTER_CORES]),
        .max_val(),
        .max_ptr(selected_cluster_core[k]),
        .max_valid(cluster_max_valid[k])
      );
    end
  endgenerate

  wire                     max_valid;
  wire                     selected_port_v;

  generate
      if (CLUSTER_COUNT==1)
          assign selected_core = {selected_cluster_core[0]};
      else begin
          wire [CLUSTER_WIDTH-1:0] selected_cluster;
          simple_arbiter # (
              .PORTS(CLUSTER_COUNT),
              .ARB_TYPE_ROUND_ROBIN(1),
              .ARB_LSB_HIGH_PRIORITY(1)
          ) max_slot_arbiter (
              .clk(clk),
              .rst(rst),

              .request(cluster_max_valid),
              .taken(selected_port_v), // equal to desc_pop

              .grant(),
              .grant_valid (max_valid),
              .grant_encoded(selected_cluster)
          );

          assign selected_core = {selected_cluster, selected_cluster_core[selected_cluster]};
      end
  endgenerate

  // Adding tdest and tuser to input data from eth, dest based on
  // latched descriptor and stamp the incoming port
  wire [IF_COUNT-1:0]        selected_port;
  wire [INTERFACE_WIDTH-1:0] selected_port_enc;

  reg  [IF_COUNT*ID_TAG_WIDTH-1:0] dest;
  reg  [IF_COUNT*ID_TAG_WIDTH-1:0] dest_rr;

  assign desc_pop                       = selected_port_v && max_valid;
  wire [IF_COUNT-1:0] port_desc_avail   = {IF_COUNT{desc_pop}} & selected_port;
  wire [IF_COUNT-1:0] port_valid        = s_axis_tvalid & s_axis_tready;
  wire [IF_COUNT-1:0] sending_last_word = port_valid & s_axis_tlast;

  // State machine per port
  localparam STALL = 2'b00; // Don't accept until getting a desc
  localparam FIRST = 2'b01; // Ready to get new packet
  localparam WAIT  = 2'b10; // Accept while waiting for new desc
  localparam MID   = 2'b11; // Desc ready, wait for end of the packet

  integer n;
  always @ (posedge clk)
      for (n=0; n<IF_COUNT; n=n+1)
          if (rst) begin
              port_state[n]     <= STALL;
          end else begin
              case (port_state[n])
                  STALL: if (port_desc_avail[n])
                             port_state[n] <= FIRST;
                  FIRST: if (sending_last_word[n])
                             port_state[n] <= STALL;
                         else if (port_valid[n])
                             port_state[n] <= WAIT;
                         // 2 previous ifs already used the desc
                         else if (release_desc[n])
                             port_state[n] <= STALL;
                         // Since the specific core is disabled,
                         // it cannot get desc from the same core
                  WAIT:  if (port_desc_avail[n] && sending_last_word[n])
                             port_state[n] <= FIRST;
                         else if (port_desc_avail[n])
                             port_state[n] <= MID;
                         else if (sending_last_word[n])
                             port_state[n] <= STALL;
                  MID:   if (sending_last_word[n]) begin
                             if (release_desc[n])
                                 port_state[n] <= STALL;
                             else
                                 port_state[n] <= FIRST;
                         // Don't use the reserved desc
                         end else if (release_desc[n]) begin
                                 port_state[n] <= WAIT;
                         end
              endcase
              // When a packet starts latch the tdest
              if ((port_state[n] == FIRST) && port_valid[n])
                  dest_rr[n*ID_TAG_WIDTH +: ID_TAG_WIDTH] <= dest_r[n*ID_TAG_WIDTH +: ID_TAG_WIDTH];
          end

  wire [1:0] state_0 = port_state[0];
  wire [1:0] state_1 = port_state[1];
  wire [1:0] state_2 = port_state[2];

  // Desc request and port ready
  integer p;
  reg [IF_COUNT-1:0] desc_req;
  reg [IF_COUNT-1:0] port_not_stall;
  always @ (*)
      for (p=0; p<IF_COUNT; p=p+1) begin
          // When a packet starts we ask for new desc, or if we are in stall or wait.
          // If request in FIRST is responded during WAIT it would be cancedlled by !selected_port
          desc_req[p] = !(selected_port[p]) && ((port_state[p]==STALL) || (port_state[p]==WAIT) ||
                          ((port_state[p]==FIRST) && port_valid[p]));
          port_not_stall[p] = (port_state[p]!=STALL);
          dest[p*ID_TAG_WIDTH +: ID_TAG_WIDTH] = (port_state[p]==FIRST) ?
              dest_r[p*ID_TAG_WIDTH +: ID_TAG_WIDTH] : dest_rr[p*ID_TAG_WIDTH +: ID_TAG_WIDTH];
      end

  // arbiter among ports for desc request
  arbiter # (
    .PORTS(IF_COUNT),
    .ARB_TYPE_ROUND_ROBIN(1),
    .ARB_LSB_HIGH_PRIORITY(1)
  ) port_selector (
    .clk(clk),
    .rst(rst),

    .request(desc_req),
    .acknowledge({IF_COUNT{1'b0}}),

    .grant(selected_port),
    .grant_valid(selected_port_v),
    .grant_encoded(selected_port_enc)
  );

  // Load the new desc
  always @ (posedge clk)
    if (desc_pop)
      dest_r[selected_port_enc*ID_TAG_WIDTH +: ID_TAG_WIDTH] <= desc_data;

  genvar j;
  generate
    for (j=0; j<IF_COUNT;j=j+1) begin
      assign m_axis_tuser[j*PORT_WIDTH +: PORT_WIDTH] = j;
    end
  endgenerate

  axis_dropper # (
    .PORT_COUNT(IF_COUNT),
    .REG_FOR_DROP(1),
    .SAME_CYCLE_DROP(0),
    .DROP_CNT_WIDTH(32)
  ) axis_dropper_inst (
    .clk(clk),
    .rst(rst),

    // .drop(s_axis_almost_full & ~{IF_COUNT{max_valid}}), // There is no free core
    .drop({IF_COUNT{1'b0}}), // There is a bug, for now disabling it.
    .drop_count(drop_count),

    .s_axis_tvalid(s_axis_tvalid & port_not_stall),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_tready(s_axis_tready),

    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tready(m_axis_tready & port_not_stall)
  );

  assign m_axis_tdata = s_axis_tdata;
  assign m_axis_tkeep = s_axis_tkeep;
  assign m_axis_tdest = dest;

endmodule

`resetall
