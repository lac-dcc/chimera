// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__brownout
// License: Apache License 2.0

//################################################################################        
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Analog section of brown-out detector.  Not routed, instatiates
// comparators, rc oscillator, ibias generator, and resistor string with analog
// mux.
//################################################################################

module brownout_ana(
//INPUTS
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input logic [7:0] otrip_decoded,
input logic [7:0] vtrip_decoded,
input real vbg_1v2,
input logic ena,
input logic isrc_sel,
input real ibg_200n,
input logic osc_ena,
input logic outb_unbuf,
//OUTPTUS
output brout_filt,
output dcomp,
output outb,
output vunder,
output osc_ck,
output real vin_brout,
output real vin_vunder,
output real itest
);

//BUFFERS
assign vunder = ~vunder_unbuf;
assign outb = outb_unbuf;

rstring_mux rstring_mux(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.ena(ena),
.otrip_decoded(otrip_decoded), //lvls not modeled
.vtrip_decoded(vtrip_decoded), //lvls not modeled
.vin_brout(vin_brout),
.vin_vunder(vin_vunder)
);

real ibias;

ibias_gen ibias_gen(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.ena(ena),
.isrc_sel(isrc_sel),
.ibg_200n(ibg_200n),
.ibias(ibias),
.itest(itest)
);

comparator comparator_brout(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vinp(vbg_1v2),
.vinn(vin_brout),
.ena(ena),
.ibias(ibias),
.dout(dcomp)
);
assign brout_filt = dcomp;
comparator comparator_vunder(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vinp(vbg_1v2),
.vinn(vin_vunder),
.ena(ena),
.ibias(ibias),
.dout(vunder_unbuf)
);

rc_osc rc_osc(
.dvdd(dvdd),
.dvss(dvss),
.osc_ena(osc_ena),
.osc_ck(osc_ck)
);

endmodule
