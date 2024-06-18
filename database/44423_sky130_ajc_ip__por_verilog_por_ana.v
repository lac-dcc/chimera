// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__por
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Power-on-reset analog model
//############################################################################

module por_ana(
//INPUTS
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input logic [7:0] otrip_decoded,
input real vbg_1v2,
input logic force_pdnb,
input logic isrc_sel,
input real ibg_200n,
input logic osc_ena,
input logic por_unbuf,
//OUTPUTS
output pwup_filt,
output osc_ck,
output logic por,
output logic porb,
output logic porb_h,
output real vin,
output real itest
);

assign por = por_unbuf; //lvls to avdd
assign porb = !por_unbuf; //lvls to avdd
assign porb_h = !por_unbuf; //lvls to avdd

rstring_mux rstring_mux(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.ena(force_pdnb),
.otrip_decoded(otrip_decoded), //lvls not modeled
.vin(vin)
);

real ibias;

ibias_gen ibias_gen(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.ena(force_pdnb),
.isrc_sel(isrc_sel),
.ibg_200n(ibg_200n),
.ibias(ibias),
.itest(itest)
);

comparator comparator(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vinp(vin),
.vinn(vbg_1v2),
.ena(force_pdnb),
.ibias(ibias),
.dout(pwup_filt)
);

rc_osc rc_osc(
.dvdd(dvdd),
.dvss(dvss),
.osc_ena(osc_ena),
.osc_ck(osc_ck)
);

endmodule
