// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__brownout
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Top-level combining analog and digtal sections of brown-out
// detector with under-voltage detector.
//############################################################################

`include "behavioral/rc_osc.v"
`include "behavioral/rstring_mux.v"
`include "behavioral/comparator.v"
`include "behavioral/ibias_gen.v"
`include "brownout_ana.v"
`include "brownout_dig.v"

module brownout(
//INPUTS
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input real vbg_1v2,
input logic [2:0] otrip,
input logic [2:0] vtrip,
input logic ena,
input logic force_ena_rc_osc,
input logic force_dis_rc_osc,
input logic force_short_oneshot,
input logic isrc_sel, //chooses between internal bias gen (0) or external bandgap current (1)
input real ibg_200n, //200nA bandgap current
//OUTPUTS
output out,
output vunder,
//DEBUG OUTPUTS
output osc_ck,
output real itest, //700nA bias current
output dcomp,
output brout_filt,
output real vin_brout,
output real vin_vunder,
output timed_out
);

wire [7:0] otrip_decoded;
wire [7:0] vtrip_decoded;

brownout_ana brownout_ana(
//INPUTS
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.otrip_decoded(otrip_decoded),
.vtrip_decoded(vtrip_decoded),
.vbg_1v2(vbg_1v2),
.ena(ena),
.isrc_sel(isrc_sel),
.ibg_200n(ibg_200n),
.osc_ena(osc_ena),
.outb_unbuf(outb_unbuf),
//OUTPUTS
.brout_filt(brout_filt),
.dcomp(dcomp),
.out(out),
.vunder(vunder),
.osc_ck(osc_ck),
//DEBUG OUTPUTS
.vin_brout(vin_brout), //input to comparator for comparing to 1.2V bg voltage
.vin_vunder(vin_vunder), //input to comparator for comparing to 1.2V bg voltage
.itest(itest) //mirror of current gen 0.7uA nominal
);

brownout_dig brownout_dig(
//INPUTS
.otrip(otrip),
.vtrip(vtrip),
.ena(ena),
.force_ena_rc_osc(force_ena_rc_osc),
.force_dis_rc_osc(force_dis_rc_osc),
.force_short_oneshot(force_short_oneshot),
.brout_filt(brout_filt),
.dcomp(dcomp),
//.vunder_unbuf(vunder_unbuf),
.osc_ck(osc_ck),
//OUTPUTS
.osc_ena(osc_ena),
.outb_unbuf(outb_unbuf),
//.vunder(vunder),
.otrip_decoded(otrip_decoded),
.vtrip_decoded(vtrip_decoded),
//DEBUG OUTPUTS
.timed_out(timed_out)
);

endmodule
