// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__por
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Power-on-reset, analog model and digital sections combined.
//############################################################################

`include "behavioral/rc_osc.v"
`include "behavioral/rstring_mux.v"
`include "behavioral/comparator.v"
`include "behavioral/ibias_gen.v"
`include "por_ana.v"
`include "por_dig.v"

module sky130_ajc_ip__por(
//INPUTS
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input real vbg_1v2,
input logic [2:0] otrip, //trip voltage select
input logic force_pdn, //a 1 means power down the block
input logic force_ena_rc_osc, //force rc oscillator on
input logic force_dis_rc_osc, //force rc oscillator off
input logic force_short_oneshot, //shorten 1ms/50ms timer for faster simulation
input logic isrc_sel, //chooses between internal bias gen (0) or external bandgap current (1)
input real ibg_200n, //bandgap current
//OUTPUTS
output porb_h, //negative logic por 3v3
output porb, //negative logic por 1v8
output por, //positive logic por 1v8
//DEBUG OUTPUTS
output osc_ck, //~656kHz, main clock
output real itest, //700nA bias current
output pwup_filt, //high when avdd > trip point
output real vin, //avdd divided down voltage to compare to 1.2V bg
output startup_timed_out, //initial 1ms timer
output por_timed_out //50ms timer
);

wire [7:0] otrip_decoded;

por_ana por_ana(
//INPUTS
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.otrip_decoded(otrip_decoded),
.vbg_1v2(vbg_1v2),
.force_pdnb(force_pdnb),
.isrc_sel(isrc_sel),
.ibg_200n(ibg_200n),
.osc_ena(osc_ena),
.por_unbuf(por_unbuf),
//OUTPUTS
.pwup_filt(pwup_filt),
.osc_ck(osc_ck),
.por(por),
.porb(porb),
.porb_h(porb_h),
//DEBUG OUTPUTS
.vin(vin), //input to comparator for comparing to 1.2V bg voltage
.itest(itest) //mirror of current gen 0.7uA nominal
);

por_dig por_dig(
//INPUTS
.otrip(otrip),
.force_pdn(force_pdn),
.force_ena_rc_osc(force_ena_rc_osc),
.force_dis_rc_osc(force_dis_rc_osc),
.force_short_oneshot(force_short_oneshot),
.pwup_filt(pwup_filt),
.osc_ck(osc_ck),
//OUTPUTS
.osc_ena(osc_ena),
.otrip_decoded(otrip_decoded),
.force_pdnb(force_pdnb),
.por_unbuf(por_unbuf),
//DEBUG OUTPUTS
.startup_timed_out(startup_timed_out),
.por_timed_out(por_timed_out)
);

endmodule
