// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__por
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Power-on-reset digital section
//############################################################################

module por_dig(
//INPUTS
input logic [2:0] otrip,
input logic force_pdn,
input logic force_ena_rc_osc,
input logic force_dis_rc_osc,
input logic force_short_oneshot,
input logic pwup_filt,
input logic osc_ck,
//OUTPUTS
output osc_ena,
output logic [7:0] otrip_decoded,
output force_pdnb,
output por_unbuf,
//DEBUG OUTPUTS
output startup_timed_out,
output por_timed_out
);

  assign force_pdnb = ~force_pdn;
  assign osc_ena = force_ena_rc_osc | (!force_dis_rc_osc & (pwup_filt & ~por_timed_out));

  //TRIP-VOLTAGE 3-to-8 DECODER
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

  //COUNTER RESET
  reg cnt_rsb_stg1, cnt_rsb;

  always @ (posedge osc_ck or negedge pwup_filt) begin
    if (!pwup_filt) begin
      cnt_rsb_stg1 <= 0;
      cnt_rsb <= 0;
    end else begin
      cnt_rsb_stg1 <= 1;
      cnt_rsb <= cnt_rsb_stg1;
    end
  end

  //6-BIT STARTUP ONE-SHOT
  reg [5:0] cnt_st;

  assign startup_timed_out = (cnt_st == 6'b100101);

  always @ (posedge osc_ck or negedge cnt_rsb) begin
    if (!cnt_rsb) begin
      cnt_st <= 0;
    end else begin
      cnt_st <= startup_timed_out ? cnt_st : force_short_oneshot ? (cnt_st & 6'b111000) + 6'b001101 : cnt_st + 1;
    end
  end

  //OUTPUT
  assign por_unbuf = startup_timed_out & (!por_timed_out);

  //11-BIT POR ONE-SHOT
  reg [10:0] cnt_por;

  assign por_timed_out = (cnt_por == 11'b11100110010);

  always @ (posedge osc_ck or negedge cnt_rsb) begin
    if (!cnt_rsb) begin
      cnt_por <= 0;
    end else begin
      cnt_por <= por_unbuf ? force_short_oneshot ? (cnt_por & 11'b11100000000) + 11'b00100110010 : cnt_por + 1 : cnt_por;
    end
  end

endmodule
