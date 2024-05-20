// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__brownout
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Digital section of brown-out detector.  Decodes analog mux
// signals otrip[2:0] and vtrip[2:0], and handles one-shot timer.
//############################################################################

module brownout_dig(
//INPUTS
input logic [2:0] otrip,
input logic [2:0] vtrip,
input logic ena,
input logic force_ena_rc_osc,
input logic force_dis_rc_osc,
input logic force_short_oneshot,
input logic dcomp,
input logic brout_filt,
input logic osc_ck,
//OUTPUTS
output osc_ena,
output outb_unbuf,
output logic [7:0] otrip_decoded,
output logic [7:0] vtrip_decoded,
//DEBUG OUTPUTS
output timed_out
);

  //assign vunder = vunder_unbuf;

  //TRIP-VOLTAGE 3-to-8 DECODERS
  always @ (otrip) begin
    case(otrip)
      3'b111: otrip_decoded = 8'b10000000;
      3'b110: otrip_decoded = 8'b01000000;
      3'b101: otrip_decoded = 8'b00100000;
      3'b100: otrip_decoded = 8'b00010000;
      3'b011: otrip_decoded = 8'b00001000;
      3'b010: otrip_decoded = 8'b00000100;
      3'b001: otrip_decoded = 8'b00000010;
      3'b000: otrip_decoded = 8'b00000001;
    endcase
  end

  always @ (vtrip) begin
    case(vtrip)
      3'b111: vtrip_decoded = 8'b10000000;
      3'b110: vtrip_decoded = 8'b01000000;
      3'b101: vtrip_decoded = 8'b00100000;
      3'b100: vtrip_decoded = 8'b00010000;
      3'b011: vtrip_decoded = 8'b00001000;
      3'b010: vtrip_decoded = 8'b00000100;
      3'b001: vtrip_decoded = 8'b00000010;
      3'b000: vtrip_decoded = 8'b00000001;
    endcase
  end

  assign osc_ena = force_ena_rc_osc | (!force_dis_rc_osc & (ena & (dcomp | !outb_unbuf)));
  wire dcomp_ena_rsb;

  //BROUT_FILT RETIME
  assign dcomp_ena_rsb = ena & dcomp;

  reg dcomp_retimed;
  always @ (posedge osc_ck or negedge dcomp_ena_rsb) begin
    if (!dcomp_ena_rsb) begin
      dcomp_retimed <= 0;
    end else begin
      dcomp_retimed <= dcomp;
    end
  end

  reg clr_cnt_sb_stg1, clr_cnt_sb;

  always @ (posedge osc_ck or posedge brout_filt) begin
    if (brout_filt) begin
      clr_cnt_sb_stg1 <= 0;
      clr_cnt_sb <= 0;
    end else begin
      clr_cnt_sb_stg1 <= 1;
      clr_cnt_sb <= clr_cnt_sb_stg1;
    end
  end

  reg clr_cnt;
  always @ (posedge osc_ck or negedge clr_cnt_sb) begin
    if (!clr_cnt_sb) begin
      clr_cnt <= 1;
    end else begin
      clr_cnt <= 0;
    end
  end

  //12-BIT BROWN-OUT ONE-SHOT
  reg [11:0] cnt;

  assign timed_out = (cnt == 12'b111111111111);
  assign outb_unbuf = dcomp_retimed ? 0 : timed_out;

  always @ (posedge osc_ck or negedge ena) begin
    if (!ena) begin
      cnt <= 12'b111111111111;
    end else begin
      cnt <= clr_cnt ? 0 : timed_out ? cnt : force_short_oneshot ? (cnt & 12'b111000000000) + 12'b001111111111 : cnt + 1;
    end
  end

endmodule
