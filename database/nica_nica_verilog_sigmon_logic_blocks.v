// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

//////////////////////////////////////////////////////////////////////////////////////////////////
// Configurable logic blocks
// 
module sigmon_logic_blocks (
    input wire 	      clk,
    input wire 	      reset,

    input wire 	      clbs_enable,
    input wire [31:0] clb0_in_select,
    input wire [31:0] clb0_start_limit,
    input wire [31:0] clb0_mid_limit,
    input wire [31:0] clb1_in_select,
    input wire [31:0] clb1_start_limit,
    input wire [31:0] clb1_mid_limit,
    input wire [31:0] clb2_in_select,
    input wire [31:0] clb2_start_limit,
    input wire [31:0] clb2_mid_limit,
    input wire [31:0] clb3_in_select,
    input wire [31:0] clb3_start_limit,
    input wire [31:0] clb3_mid_limit,
    input wire [31:0] clbs_logic_eq,
    input wire 	      sbu2nwp_rdy,
    input wire 	      sbu2nwp_vld,
    input wire 	      nwp2sbu_rdy,
    input wire 	      nwp2sbu_vld,
    input wire 	      sbu2cxp_rdy,
    input wire 	      sbu2cxp_vld,
    input wire 	      cxp2sbu_rdy,
    input wire 	      cxp2sbu_vld,
    input wire 	      sbu2nwp_tlast,
    input wire 	      nwp2sbu_tlast,
    input wire 	      sbu2cxp_tlast,
    input wire 	      cxp2sbu_tlast,
    input wire 	      nwp2sbu_lossless_credits,
    input wire 	      cxp2sbu_lossless_credits,
    input wire 	      axi4mm_aw_rdy,
    input wire 	      axi4mm_aw_vld,
    input wire 	      axi4mm_w_rdy,
    input wire 	      axi4mm_w_vld,
    input wire 	      axi4mm_w_last,
    input wire 	      axi4mm_b_rdy,
    input wire 	      axi4mm_b_vld,
    input wire 	      axi4mm_ar_rdy,
    input wire 	      axi4mm_ar_vld,
    input wire 	      axi4mm_r_rdy,
    input wire 	      axi4mm_r_vld,
    input wire 	      axi4mm_r_last,
    input wire 	      sigmon_enable_event,
    input wire [15:0] nica_events,
		      
    output wire [3:0] clbs_out,
    output wire [2:0] clb0_events_out,
    output wire [2:0] clb1_events_out,
    output wire [2:0] clb2_events_out,
    output wire [2:0] clb3_events_out
  );

  reg [3:0] 	      clbs_outQ;
  

  always @(posedge clk) begin
    if (reset) begin
      clbs_outQ <= 4'b0000;
    end
    else begin
      clbs_outQ <= clbs_out;
    end
  end
  

sigmon_logic_block sigmon_clb0 (
.clk(clk),
.reset(reset),
.clb_enable(clbs_enable),

.sbu2nwp_rdy(sbu2nwp_rdy),
.sbu2nwp_vld(sbu2nwp_vld),
.nwp2sbu_rdy(nwp2sbu_rdy),
.nwp2sbu_vld(nwp2sbu_vld),
.sbu2cxp_rdy(sbu2cxp_rdy),
.sbu2cxp_vld(sbu2cxp_vld),
.cxp2sbu_rdy(cxp2sbu_rdy),
.cxp2sbu_vld(cxp2sbu_vld),
.sbu2nwp_tlast(sbu2nwp_tlast),
.nwp2sbu_tlast(nwp2sbu_tlast),
.sbu2cxp_tlast(sbu2cxp_tlast),
.cxp2sbu_tlast(cxp2sbu_tlast),
.nwp2sbu_lossless_credits(nwp2sbu_lossless_credits),
.cxp2sbu_lossless_credits(cxp2sbu_lossless_credits),
.axi4mm_aw_rdy(axi4mm_aw_rdy),
.axi4mm_aw_vld(axi4mm_aw_vld),
.axi4mm_w_rdy(axi4mm_w_rdy),
.axi4mm_w_vld(axi4mm_w_vld),
.axi4mm_w_last(axi4mm_w_last),
.axi4mm_b_rdy(axi4mm_b_rdy),
.axi4mm_b_vld(axi4mm_b_vld),
.axi4mm_ar_rdy(axi4mm_ar_rdy),
.axi4mm_ar_vld(axi4mm_ar_vld),
.axi4mm_r_rdy(axi4mm_r_rdy),
.axi4mm_r_vld(axi4mm_r_vld),
.axi4mm_r_last(axi4mm_r_last),
.sigmon_enable_event(sigmon_enable_event),
.nica_events(nica_events),

.clbs_in(clbs_outQ),			   
.clb_in_select(clb0_in_select),
.clb_start_limit(clb0_start_limit),
.clb_mid_limit(clb0_mid_limit),
.clb_logic_eq(clbs_logic_eq[7:0]),

.clb_events_out(clb0_events_out),
.clb_out(clbs_out[0])
 );


sigmon_logic_block sigmon_clb1 (
.clk(clk),
.reset(reset),
.clb_enable(clbs_enable),

.sbu2nwp_rdy(sbu2nwp_rdy),
.sbu2nwp_vld(sbu2nwp_vld),
.nwp2sbu_rdy(nwp2sbu_rdy),
.nwp2sbu_vld(nwp2sbu_vld),
.sbu2cxp_rdy(sbu2cxp_rdy),
.sbu2cxp_vld(sbu2cxp_vld),
.cxp2sbu_rdy(cxp2sbu_rdy),
.cxp2sbu_vld(cxp2sbu_vld),
.sbu2nwp_tlast(sbu2nwp_tlast),
.nwp2sbu_tlast(nwp2sbu_tlast),
.sbu2cxp_tlast(sbu2cxp_tlast),
.cxp2sbu_tlast(cxp2sbu_tlast),
.nwp2sbu_lossless_credits(nwp2sbu_lossless_credits),
.cxp2sbu_lossless_credits(cxp2sbu_lossless_credits),
.axi4mm_aw_rdy(axi4mm_aw_rdy),
.axi4mm_aw_vld(axi4mm_aw_vld),
.axi4mm_w_rdy(axi4mm_w_rdy),
.axi4mm_w_vld(axi4mm_w_vld),
.axi4mm_w_last(axi4mm_w_last),
.axi4mm_b_rdy(axi4mm_b_rdy),
.axi4mm_b_vld(axi4mm_b_vld),
.axi4mm_ar_rdy(axi4mm_ar_rdy),
.axi4mm_ar_vld(axi4mm_ar_vld),
.axi4mm_r_rdy(axi4mm_r_rdy),
.axi4mm_r_vld(axi4mm_r_vld),
.axi4mm_r_last(axi4mm_r_last),
.sigmon_enable_event(sigmon_enable_event),
.nica_events(nica_events),

.clbs_in(clbs_outQ),			   
.clb_in_select(clb1_in_select),
.clb_start_limit(clb1_start_limit),
.clb_mid_limit(clb1_mid_limit),
.clb_logic_eq(clbs_logic_eq[15:8]),

.clb_events_out(clb1_events_out),
.clb_out(clbs_out[1])
 );


sigmon_logic_block sigmon_clb2 (
.clk(clk),
.reset(reset),
.clb_enable(clbs_enable),

.sbu2nwp_rdy(sbu2nwp_rdy),
.sbu2nwp_vld(sbu2nwp_vld),
.nwp2sbu_rdy(nwp2sbu_rdy),
.nwp2sbu_vld(nwp2sbu_vld),
.sbu2cxp_rdy(sbu2cxp_rdy),
.sbu2cxp_vld(sbu2cxp_vld),
.cxp2sbu_rdy(cxp2sbu_rdy),
.cxp2sbu_vld(cxp2sbu_vld),
.sbu2nwp_tlast(sbu2nwp_tlast),
.nwp2sbu_tlast(nwp2sbu_tlast),
.sbu2cxp_tlast(sbu2cxp_tlast),
.cxp2sbu_tlast(cxp2sbu_tlast),
.nwp2sbu_lossless_credits(nwp2sbu_lossless_credits),
.cxp2sbu_lossless_credits(cxp2sbu_lossless_credits),
.axi4mm_aw_rdy(axi4mm_aw_rdy),
.axi4mm_aw_vld(axi4mm_aw_vld),
.axi4mm_w_rdy(axi4mm_w_rdy),
.axi4mm_w_vld(axi4mm_w_vld),
.axi4mm_w_last(axi4mm_w_last),
.axi4mm_b_rdy(axi4mm_b_rdy),
.axi4mm_b_vld(axi4mm_b_vld),
.axi4mm_ar_rdy(axi4mm_ar_rdy),
.axi4mm_ar_vld(axi4mm_ar_vld),
.axi4mm_r_rdy(axi4mm_r_rdy),
.axi4mm_r_vld(axi4mm_r_vld),
.axi4mm_r_last(axi4mm_r_last),
.sigmon_enable_event(sigmon_enable_event),
.nica_events(nica_events),

.clbs_in(clbs_outQ),			   
.clb_in_select(clb2_in_select),
.clb_start_limit(clb2_start_limit),
.clb_mid_limit(clb2_mid_limit),
.clb_logic_eq(clbs_logic_eq[23:16]),

.clb_events_out(clb2_events_out),
.clb_out(clbs_out[2])
 );


sigmon_logic_block sigmon_clb3 (
.clk(clk),
.reset(reset),
.clb_enable(clbs_enable),

.sbu2nwp_rdy(sbu2nwp_rdy),
.sbu2nwp_vld(sbu2nwp_vld),
.nwp2sbu_rdy(nwp2sbu_rdy),
.nwp2sbu_vld(nwp2sbu_vld),
.sbu2cxp_rdy(sbu2cxp_rdy),
.sbu2cxp_vld(sbu2cxp_vld),
.cxp2sbu_rdy(cxp2sbu_rdy),
.cxp2sbu_vld(cxp2sbu_vld),
.sbu2nwp_tlast(sbu2nwp_tlast),
.nwp2sbu_tlast(nwp2sbu_tlast),
.sbu2cxp_tlast(sbu2cxp_tlast),
.cxp2sbu_tlast(cxp2sbu_tlast),
.nwp2sbu_lossless_credits(nwp2sbu_lossless_credits),
.cxp2sbu_lossless_credits(cxp2sbu_lossless_credits),
.axi4mm_aw_rdy(axi4mm_aw_rdy),
.axi4mm_aw_vld(axi4mm_aw_vld),
.axi4mm_w_rdy(axi4mm_w_rdy),
.axi4mm_w_vld(axi4mm_w_vld),
.axi4mm_w_last(axi4mm_w_last),
.axi4mm_b_rdy(axi4mm_b_rdy),
.axi4mm_b_vld(axi4mm_b_vld),
.axi4mm_ar_rdy(axi4mm_ar_rdy),
.axi4mm_ar_vld(axi4mm_ar_vld),
.axi4mm_r_rdy(axi4mm_r_rdy),
.axi4mm_r_vld(axi4mm_r_vld),
.axi4mm_r_last(axi4mm_r_last),
.sigmon_enable_event(sigmon_enable_event),
.nica_events(nica_events),

.clbs_in(clbs_outQ),			   
.clb_in_select(clb3_in_select),
.clb_start_limit(clb3_start_limit),
.clb_mid_limit(clb3_mid_limit),
.clb_logic_eq(clbs_logic_eq[31:24]),

.clb_events_out(clb3_events_out),
.clb_out(clbs_out[3])
 );

endmodule
