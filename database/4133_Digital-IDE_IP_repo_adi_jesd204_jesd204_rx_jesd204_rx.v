// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

//
// The ADI JESD204 Core is released under the following license, which is
// different than all other HDL cores in this repository.
//
// Please read this, and understand the freedoms and responsibilities you have
// by using this source code/core.
//
// The JESD204 HDL, is copyright © 2016-2017 Analog Devices Inc.
//
// This core is free software, you can use run, copy, study, change, ask
// questions about and improve this core. Distribution of source, or resulting
// binaries (including those inside an FPGA or ASIC) require you to release the
// source of the entire project (excluding the system libraries provide by the
// tools/compiler/FPGA vendor). These are the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// This core  is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License version 2
// along with this source code, and binary.  If not, see
// <http://www.gnu.org/licenses/>.
//
// Commercial licenses (with commercial support) of this JESD204 core are also
// available under terms different than the General Public License. (e.g. they
// do not require you to accompany any image (FPGA or ASIC) using the JESD204
// core with any corresponding source code.) For these alternate terms you must
// purchase a license from Analog Devices Technology Licensing Office. Users
// interested in such a license should contact jesd204-licensing@analog.com for
// more information. This commercial license is sub-licensable (if you purchase
// chips from Analog Devices, incorporate them into your PCB level product, and
// purchase a JESD204 license, end users of your product will also have a
// license to use this core in a commercial setting without releasing their
// source code).
//
// In addition, we kindly ask you to acknowledge ADI in any program, application
// or publication in which you use this JESD204 HDL core. (You are not required
// to do so; it is up to your common sense to decide whether you want to comply
// with this request or not.) For general publications, we suggest referencing :
// “The design and implementation of the JESD204 HDL Core used in this project
// is copyright © 2016-2017, Analog Devices, Inc.”
//

`timescale 1ns/100ps

module jesd204_rx #(
  parameter NUM_LANES = 1,
  parameter NUM_LINKS = 1,
  parameter NUM_INPUT_PIPELINE = 1,
  parameter LINK_MODE = 1, // 2 - 64B/66B;  1 - 8B/10B
  /* Only 4 is supported at the moment for 8b/10b and 8 for 64b */
  parameter DATA_PATH_WIDTH = LINK_MODE == 2 ? 8 : 4,
  parameter ENABLE_FRAME_ALIGN_CHECK = 1,
  parameter ENABLE_FRAME_ALIGN_ERR_RESET = 0
) (
  input clk,
  input reset,

  input [DATA_PATH_WIDTH*8*NUM_LANES-1:0] phy_data,
  input [2*NUM_LANES-1:0] phy_header,
  input [DATA_PATH_WIDTH*NUM_LANES-1:0] phy_charisk,
  input [DATA_PATH_WIDTH*NUM_LANES-1:0] phy_notintable,
  input [DATA_PATH_WIDTH*NUM_LANES-1:0] phy_disperr,
  input [NUM_LANES-1:0] phy_block_sync,

  input sysref,
  output lmfc_edge,
  output lmfc_clk,

  output event_sysref_alignment_error,
  output event_sysref_edge,
  output event_frame_alignment_error,
  output event_unexpected_lane_state_error,

  output [NUM_LINKS-1:0] sync,

  output phy_en_char_align,

  output [DATA_PATH_WIDTH*8*NUM_LANES-1:0] rx_data,
  output rx_valid,
  output [DATA_PATH_WIDTH-1:0] rx_eof,
  output [DATA_PATH_WIDTH-1:0] rx_sof,

  input [NUM_LANES-1:0] cfg_lanes_disable,
  input [NUM_LINKS-1:0] cfg_links_disable,
  input [7:0] cfg_beats_per_multiframe,
  input [7:0] cfg_octets_per_frame,
  input [7:0] cfg_lmfc_offset,
  input cfg_sysref_disable,
  input cfg_sysref_oneshot,
  input cfg_buffer_early_release,
  input [7:0] cfg_buffer_delay,
  input cfg_disable_char_replacement,
  input cfg_disable_scrambler,

  input ctrl_err_statistics_reset,
  input [6:0] ctrl_err_statistics_mask,

  input [7:0] cfg_frame_align_err_threshold,

  output [32*NUM_LANES-1:0] status_err_statistics_cnt,

  output [NUM_LANES-1:0] ilas_config_valid,
  output [NUM_LANES*2-1:0] ilas_config_addr,
  output [NUM_LANES*32-1:0] ilas_config_data,

  output [1:0] status_ctrl_state,
  output [2*NUM_LANES-1:0] status_lane_cgs_state,
  output [NUM_LANES-1:0] status_lane_ifs_ready,
  output [14*NUM_LANES-1:0] status_lane_latency,
  output [3*NUM_LANES-1:0] status_lane_emb_state,
  output [8*NUM_LANES-1:0] status_lane_frame_align_err_cnt
);

/*
 * Can be used to enable additional pipeline stages to ease timing. Usually not
 * necessary.
 */
localparam CHAR_INFO_REGISTERED = 0;
localparam ALIGN_MUX_REGISTERED = 0;
localparam SCRAMBLER_REGISTERED = 0;

/*
 * Maximum number of octets per multiframe for ADI JESD204 DACs is 256 (Adjust
 * as necessary). Divide by data path width.
 */
localparam MAX_OCTETS_PER_FRAME = 16;
localparam MAX_OCTETS_PER_MULTIFRAME =
  (MAX_OCTETS_PER_FRAME * 32) > 1024 ? 1024 : (MAX_OCTETS_PER_FRAME * 32);
localparam MAX_BEATS_PER_MULTIFRAME = MAX_OCTETS_PER_MULTIFRAME / DATA_PATH_WIDTH;
localparam ELASTIC_BUFFER_SIZE = MAX_BEATS_PER_MULTIFRAME;

localparam LMFC_COUNTER_WIDTH = MAX_BEATS_PER_MULTIFRAME > 256 ? 9 :
  MAX_BEATS_PER_MULTIFRAME > 128 ? 8 :
  MAX_BEATS_PER_MULTIFRAME > 64 ? 7 :
  MAX_BEATS_PER_MULTIFRAME > 32 ? 6 :
  MAX_BEATS_PER_MULTIFRAME > 16 ? 5 :
  MAX_BEATS_PER_MULTIFRAME > 8 ? 4 :
  MAX_BEATS_PER_MULTIFRAME > 4 ? 3 :
  MAX_BEATS_PER_MULTIFRAME > 2 ? 2 : 1;

/* Helper for common expressions */
localparam DW = 8*DATA_PATH_WIDTH*NUM_LANES;
localparam CW = DATA_PATH_WIDTH*NUM_LANES;
localparam HW = 2*NUM_LANES;

wire [NUM_LANES-1:0] cgs_reset;
wire [NUM_LANES-1:0] cgs_ready;
wire [NUM_LANES-1:0] ifs_reset;

reg buffer_release_n = 1'b1;
reg buffer_release_d1 = 1'b0;
wire [NUM_LANES-1:0] buffer_ready_n;
wire all_buffer_ready_n;

reg core_reset;
reg eof_reset = 1'b1;

wire [DW-1:0] phy_data_r;
wire [HW-1:0] phy_header_r;
wire [CW-1:0] phy_charisk_r;
wire [CW-1:0] phy_notintable_r;
wire [CW-1:0] phy_disperr_r;
wire [NUM_LANES-1:0] phy_block_sync_r;

wire [DW-1:0] rx_data_s;

wire rx_valid_s = buffer_release_d1;

wire [7:0] lmfc_counter;
wire latency_monitor_reset;

wire [2*NUM_LANES-1:0] frame_align;
wire [NUM_LANES-1:0] ifs_ready;

wire event_data_phase;
wire err_statistics_reset;

reg [NUM_LANES-1:0] frame_align_err_thresh_met = {NUM_LANES{1'b0}};
reg [NUM_LANES-1:0] event_frame_alignment_error_per_lane = {NUM_LANES{1'b0}};

reg buffer_release_opportunity = 1'b0;

always @(posedge clk) begin
  if (lmfc_counter == cfg_buffer_delay ||
      cfg_buffer_early_release == 1'b1) begin
    buffer_release_opportunity <= 1'b1;
  end else begin
    buffer_release_opportunity <= 1'b0;
  end
end

assign all_buffer_ready_n = |(buffer_ready_n & ~cfg_lanes_disable);

always @(posedge clk) begin
  if (reset == 1'b1) begin
    buffer_release_n <= 1'b1;
  end else begin
    if (buffer_release_opportunity == 1'b1) begin
      buffer_release_n <= all_buffer_ready_n;
    end
  end
  buffer_release_d1 <= ~buffer_release_n;
  eof_reset <= buffer_release_n;
end

pipeline_stage #(
  .WIDTH(NUM_LANES + (3 * CW) + HW + DW),
  .REGISTERED(NUM_INPUT_PIPELINE)
) i_input_pipeline_stage (
  .clk(clk),
  .in({
    phy_data,
    phy_header,
    phy_charisk,
    phy_notintable,
    phy_disperr,
    phy_block_sync
  }),
  .out({
    phy_data_r,
    phy_header_r,
    phy_charisk_r,
    phy_notintable_r,
    phy_disperr_r,
    phy_block_sync_r
  })
);

pipeline_stage #(
  .WIDTH(DW+1),
  .REGISTERED(1)
) i_output_pipeline_stage (
  .clk(clk),
  .in({
    rx_data_s,
    rx_valid_s
  }),
  .out({
    rx_data,
    rx_valid
  })
);

jesd204_lmfc i_lmfc (
  .clk(clk),
  .reset(core_reset),

  .cfg_beats_per_multiframe(cfg_beats_per_multiframe),
  .cfg_lmfc_offset(cfg_lmfc_offset),
  .cfg_sysref_oneshot(cfg_sysref_oneshot),
  .cfg_sysref_disable(cfg_sysref_disable),

  .sysref(sysref),
  .lmfc_edge(lmfc_edge),
  .lmfc_clk(lmfc_clk),
  .lmfc_counter(lmfc_counter),
  .lmc_edge(),
  .lmc_quarter_edge(),
  .eoemb(),

  .sysref_edge(event_sysref_edge),
  .sysref_alignment_error(event_sysref_alignment_error)
);

jesd204_eof_generator  #(
  .DATA_PATH_WIDTH(DATA_PATH_WIDTH),
  .MAX_OCTETS_PER_FRAME(MAX_OCTETS_PER_FRAME)
) i_eof_gen (
  .clk(clk),
  .reset(eof_reset),

  .lmfc_edge(lmfc_edge),

  .cfg_octets_per_frame(cfg_octets_per_frame),
  .cfg_generate_eomf(1'b0),

  .sof(rx_sof),
  .eof(rx_eof),
  .eomf()
);

generate
genvar i;

if (LINK_MODE[0] == 1) begin : mode_8b10b

wire unexpected_lane_state_error;
reg unexpected_lane_state_error_d = 1'b0;

jesd204_rx_ctrl #(
  .NUM_LANES(NUM_LANES),
  .NUM_LINKS(NUM_LINKS)
) i_rx_ctrl (
  .clk(clk),
  .reset(core_reset),

  .cfg_lanes_disable(cfg_lanes_disable),
  .cfg_links_disable(cfg_links_disable),

  .phy_ready(1'b1),
  .phy_en_char_align(phy_en_char_align),

  .lmfc_edge(lmfc_edge),
  .sync(sync),

  .latency_monitor_reset(latency_monitor_reset),

  .cgs_reset(cgs_reset),
  .cgs_ready(cgs_ready),

  .ifs_reset(ifs_reset),

  .status_state(status_ctrl_state),

  .event_data_phase(event_data_phase)
);

// Reset core when frame alignment errors occur
if(ENABLE_FRAME_ALIGN_CHECK && ENABLE_FRAME_ALIGN_ERR_RESET) begin : gen_frame_align_err_reset

  reg [7:0] reset_cnt;

  always @(posedge clk) begin
    if(reset) begin
      reset_cnt <= 8'h00;
    end else begin
      if(|frame_align_err_thresh_met) begin
        reset_cnt <= 8'hFF;
      end else if(reset_cnt != 0) begin
        reset_cnt <= reset_cnt - 1'b1;
      end
    end

    core_reset <= reset | (reset_cnt != 0);
  end

end else begin : gen_no_frame_align_err_reset
  always @(*) begin
    core_reset = reset;
  end
end

assign err_statistics_reset = ctrl_err_statistics_reset ||
                              event_data_phase;

for (i = 0; i < NUM_LANES; i = i + 1) begin: gen_lane

  localparam D_START = i * DATA_PATH_WIDTH*8;
  localparam D_STOP = D_START + DATA_PATH_WIDTH*8-1;
  localparam C_START = i * DATA_PATH_WIDTH;
  localparam C_STOP = C_START + DATA_PATH_WIDTH-1;

  jesd204_rx_lane #(
    .DATA_PATH_WIDTH(DATA_PATH_WIDTH),
    .CHAR_INFO_REGISTERED(CHAR_INFO_REGISTERED),
    .ALIGN_MUX_REGISTERED(ALIGN_MUX_REGISTERED),
    .SCRAMBLER_REGISTERED(SCRAMBLER_REGISTERED),
    .ELASTIC_BUFFER_SIZE(ELASTIC_BUFFER_SIZE),
    .ENABLE_FRAME_ALIGN_CHECK(ENABLE_FRAME_ALIGN_CHECK)
  ) i_lane (
    .clk(clk),
    .reset(core_reset),

    .phy_data(phy_data_r[D_STOP:D_START]),
    .phy_charisk(phy_charisk_r[C_STOP:C_START]),
    .phy_notintable(phy_notintable_r[C_STOP:C_START]),
    .phy_disperr(phy_disperr_r[C_STOP:C_START]),

    .cgs_reset(cgs_reset[i]),
    .cgs_ready(cgs_ready[i]),

    .ifs_reset(ifs_reset[i]),

    .rx_data(rx_data_s[D_STOP:D_START]),

    .buffer_release_n(buffer_release_n),
    .buffer_ready_n(buffer_ready_n[i]),

    .cfg_beats_per_multiframe(cfg_beats_per_multiframe),
    .cfg_octets_per_frame(cfg_octets_per_frame),
    .cfg_disable_scrambler(cfg_disable_scrambler),

    .err_statistics_reset(err_statistics_reset),
    .ctrl_err_statistics_mask(ctrl_err_statistics_mask[2:0]),
    .status_err_statistics_cnt(status_err_statistics_cnt[32*i+31:32*i]),

    .ilas_config_valid(ilas_config_valid[i]),
    .ilas_config_addr(ilas_config_addr[2*i+1:2*i]),
    .ilas_config_data(ilas_config_data[D_STOP:D_START]),

    .status_cgs_state(status_lane_cgs_state[2*i+1:2*i]),
    .status_ifs_ready(ifs_ready[i]),
    .status_frame_align(frame_align[2*i+1:2*i]),

    .status_frame_align_err_cnt(status_lane_frame_align_err_cnt[8*i+7:8*i])
  );

  if(ENABLE_FRAME_ALIGN_CHECK) begin : gen_frame_align_err_thresh
    always @(posedge clk) begin
      if (reset) begin
        frame_align_err_thresh_met[i] <= 1'b0;
        event_frame_alignment_error_per_lane[i] <= 1'b0;
      end else begin
        if (status_lane_frame_align_err_cnt[8*i+7:8*i] >= cfg_frame_align_err_threshold) begin
          frame_align_err_thresh_met[i] <= cgs_ready[i];
          event_frame_alignment_error_per_lane[i] <= ~frame_align_err_thresh_met[i];
        end else begin
          frame_align_err_thresh_met[i] <= 1'b0;
          event_frame_alignment_error_per_lane[i] <= 1'b0;
        end
      end
    end
  end
end

assign event_frame_alignment_error = |event_frame_alignment_error_per_lane;

/* If one of the enabled lanes falls out of DATA phase while the link is in DATA phase
 * report an error event */
assign unexpected_lane_state_error = |(~(cgs_ready|cfg_lanes_disable)) & &status_ctrl_state;
always @(posedge clk) begin
  unexpected_lane_state_error_d <= unexpected_lane_state_error;
end
assign event_unexpected_lane_state_error = unexpected_lane_state_error & ~unexpected_lane_state_error_d;


/* Delay matching based on the number of pipeline stages */
reg [NUM_LANES-1:0] ifs_ready_d1 = 1'b0;
reg [NUM_LANES-1:0] ifs_ready_d2 = 1'b0;
reg [NUM_LANES-1:0] ifs_ready_mux;

always @(posedge clk) begin
  ifs_ready_d1 <= ifs_ready;
  ifs_ready_d2 <= ifs_ready_d1;
end

always @(*) begin
  case (SCRAMBLER_REGISTERED + ALIGN_MUX_REGISTERED)
  1: ifs_ready_mux = ifs_ready_d1;
  2: ifs_ready_mux = ifs_ready_d2;
  default: ifs_ready_mux = ifs_ready;
  endcase
end

jesd204_lane_latency_monitor #(
  .NUM_LANES(NUM_LANES)
) i_lane_latency_monitor (
  .clk(clk),
  .reset(latency_monitor_reset),

  .lane_ready(ifs_ready_mux),
  .lane_frame_align(frame_align),
  .lane_latency_ready(status_lane_ifs_ready),
  .lane_latency(status_lane_latency)
);

end

if (LINK_MODE[1] == 1) begin : mode_64b66b

wire [NUM_LANES-1:0] emb_lock;

always @(*) begin
  core_reset = reset;
end

jesd204_rx_ctrl_64b  #(
  .NUM_LANES(NUM_LANES)
) i_jesd204_rx_ctrl_64b (
  .clk(clk),
  .reset(core_reset),

  .cfg_lanes_disable(cfg_lanes_disable),

  .phy_block_sync(phy_block_sync_r),
  .emb_lock(emb_lock),

  .all_emb_lock(all_emb_lock),
  .buffer_release_n(buffer_release_n),

  .status_state(status_ctrl_state),
  .event_unexpected_lane_state_error(event_unexpected_lane_state_error)
);

for (i = 0; i < NUM_LANES; i = i + 1) begin: gen_lane

  localparam D_START = i * DATA_PATH_WIDTH*8;
  localparam D_STOP = D_START + DATA_PATH_WIDTH*8-1;
  localparam H_START = i * 2;
  localparam H_STOP = H_START + 2-1;

  wire [7:0] status_lane_skew;

  jesd204_rx_lane_64b #(
    .ELASTIC_BUFFER_SIZE(ELASTIC_BUFFER_SIZE)
  ) i_lane (
    .clk(clk),
    .reset(core_reset),

    .phy_data(phy_data_r[D_STOP:D_START]),
    .phy_header(phy_header_r[H_STOP:H_START]),
    .phy_block_sync(phy_block_sync_r[i]),

    .cfg_disable_scrambler(cfg_disable_scrambler),
    .cfg_header_mode(2'b0),
    .cfg_rx_thresh_emb_err(5'd8),
    .cfg_beats_per_multiframe(cfg_beats_per_multiframe),

    .rx_data(rx_data_s[D_STOP:D_START]),

    .buffer_release_n(buffer_release_n),
    .buffer_ready_n(buffer_ready_n[i]),
    .all_buffer_ready_n(all_buffer_ready_n),

    .lmfc_edge(lmfc_edge),
    .emb_lock(emb_lock[i]),

    .ctrl_err_statistics_reset(ctrl_err_statistics_reset),
    .ctrl_err_statistics_mask(ctrl_err_statistics_mask[6:3]),
    .status_err_statistics_cnt(status_err_statistics_cnt[32*i+31:32*i]),

    .status_lane_emb_state(status_lane_emb_state[3*i+2:3*i]),
    .status_lane_skew(status_lane_skew)
  );

assign status_lane_latency[14*(i+1)-1:14*i] = {3'b0,status_lane_skew,3'b0};

end

// Assign unused outputs
assign sync = 'b0;
assign phy_en_char_align = 1'b0;

assign ilas_config_valid ='b0;
assign ilas_config_addr = 'b0;
assign ilas_config_data = 'b0;
assign status_lane_cgs_state = 'b0;
assign status_lane_ifs_ready = {NUM_LANES{1'b1}};
assign event_frame_alignment_error = 1'b0;

end


endgenerate


endmodule
