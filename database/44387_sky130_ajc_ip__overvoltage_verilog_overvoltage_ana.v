// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__overvoltage
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Analog model of over-voltage detector
//############################################################################

module overvoltage_ana(
//INPUTS
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input logic [15:0] otrip_decoded,
input real vbg_1v2,
input logic ena,
input logic isrc_sel,
input real ibg_200n,
//OUTPUTS
output logic ovout,
output real vin,
output real itest
);

assign ovout = ovout_unbuf; //lvls to avdd

rstring_mux rstring_mux(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.ena(ena),
.otrip_decoded(otrip_decoded), //lvls not modeled
.vin(vin)
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

comparator comparator(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vinp(vin),
.vinn(vbg_1v2),
.ena(ena),
.ibias(ibias),
.dout(ovout_unbuf)
);

endmodule
