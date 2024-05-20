// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__brownout
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Testbench for brown-out detector
//############################################################################

`include "sky130_ajc_ip__brownout.v"
module sky130_ajc_ip__brownout_tb();

real avdd;
real vbg_1v2;
logic [2:0] otrip;
logic [2:0] vtrip;
logic ena;
logic force_ena_rc_osc;
logic force_dis_rc_osc;
logic force_short_oneshot;
logic isrc_sel;
real ibg_200n;
real vin_brout;
real vin_vunder;

sky130_ajc_ip__brownout_tb sky130_ajc_ip__brownout_tb(
//INPUTS
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vbg_1v2(vbg_1v2),
.otrip(otrip),
.vtrip(vtrip),
.ena(ena), //debug
.force_ena_rc_osc(force_ena_rc_osc), //debug
.force_dis_rc_osc(force_dis_rc_osc), //debug
.force_short_oneshot(force_short_oneshot), //debug, fast sim
.isrc_sel(isrc_sel), //debug
.ibg_200n(ibg_200n), //debug 200nA current
//OUTPUTS
.outb(outb),
.vunder(vunder),
//DEBUG OUTPUTS
.osc_ck(osc_ck),
.itest(itest),
.brout_filt(brout_filt),
.dcomp(dcomp),
.vin_brout(vin_brout),
.vin_vunder(vin_vunder),
.timed_out(timed_out)
);

assign avss = 1'b0;
assign dvdd = 1'b1;
assign dvss = 1'b0;

initial begin
  $dumpfile("tb_brownout.vcd");
  $dumpvars(0,tb_brownout);

  //INPUTS
  avdd = 2.2;
  vbg_1v2 = 1.2;
  otrip = 3'b111;
  vtrip = 3'b111;
  //DEBUG INPUTS
  ena = 1'b0;
  force_ena_rc_osc = 1'b0;
  force_dis_rc_osc = 1'b0;
  force_short_oneshot = 1'b0;
  isrc_sel = 1'b0;
  ibg_200n = 200e-9;
  #1000
  ena = 1'b1;
  #8000000
  avdd = 3.3;
  #8000000
  ena = 1'b1;
  #8000000
  avdd = 2.2;
  #8000000
  avdd = 3.3;
  #120000000
  avdd = 2.2;
  #800000
  avdd = 3.3;
  #120000000
  $finish;
end


endmodule
