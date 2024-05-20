// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__por
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Testbench for power-on-reset
//############################################################################

`include "sky130_ajc_ip__por.v"
module sky130_ajc_ip__por_tb();

real avdd;
real vbg_1v2;
logic [2:0] otrip;
logic force_pdn;
logic force_ena_rc_osc;
logic force_dis_rc_osc;
logic force_short_oneshot;
logic isrc_sel;
real ibg_200n;

sky130_ajc_ip__por sky130_ajc_ip__por(
//INPUTS
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vbg_1v2(vbg_1v2),
.otrip(otrip),
.force_pdn(force_pdn), //debug
.force_ena_rc_osc(force_ena_rc_osc), //debug
.force_dis_rc_osc(force_dis_rc_osc), //debug
.force_short_oneshot(force_short_oneshot), //debug, fast sim
.isrc_sel(isrc_sel), //debug
.ibg_200n(ibg_200n), //debug 200nA current
//OUTPUTS
.porb_h(porb_h),
.porb(porb),
.por(por),
//DEBUG OUTPUTS
.osc_ck(osc_ck),
.itest(itest),
.pwup_filt(pwup_filt),
.vin(vin),
.startup_timed_out(startup_timed_out),
.por_timed_out(por_timed_out)
);

assign avss = 1'b0;
assign dvdd = 1'b1;
assign dvss = 1'b0;

initial begin
  $dumpfile("sky130_ajc_ip__por_tb.vcd");
  $dumpvars(0,sky130_ajc_ip__por_tb);

  //INPUTS
  avdd = 2.0;
  vbg_1v2 = 1.2;
  otrip = 3'b000;
  //DEBUG INPUTS
  force_pdn = 1'b0;
  force_ena_rc_osc = 1'b0;
  force_dis_rc_osc = 1'b0;
  force_short_oneshot = 1'b0;
  isrc_sel = 1'b0;
  ibg_200n = 200e-9;
  #20000000
  avdd = 3.1;
  #8000000
  //#80000000
  avdd = 2.0;
  #40000000
  avdd = 3.1;
  #80000000
  $finish;
end


endmodule
