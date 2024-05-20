// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__overvoltage
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Over-voltage detector, analog model and digital sections
// combined.
//############################################################################

`include "behavioral/rstring_mux.v"
`include "behavioral/comparator.v"
`include "behavioral/ibias_gen.v"
`include "overvoltage_ana.v"
`include "overvoltage_dig.v"

module sky130_ajc_ip__overvoltage(
//INPUTS
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input real vbg_1v2,
input logic [3:0] otrip, //trip voltage select
input logic ena, //enable block
input logic isrc_sel, //chooses between internal bias gen (0) or external bandgap current (1)
input real ibg_200n, //bandgap current
//OUTPUTS
output ovout, //positive logic
//DEBUG OUTPUTS
output real itest, //700nA bias current
output real vin //avdd divided down voltage to compare to 1.2V bg
);

wire [15:0] otrip_decoded;

overvoltage_ana overvoltage_ana(
//INPUTS
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.otrip_decoded(otrip_decoded),
.vbg_1v2(vbg_1v2),
.ena(ena),
.isrc_sel(isrc_sel),
.ibg_200n(ibg_200n),
//OUTPUTS
.ovout(ovout),
//DEBUG OUTPUTS
.vin(vin), //input to comparator for comparing to 1.2V bg voltage
.itest(itest) //mirror of current gen 0.7uA nominal
);

overvoltage_dig overvoltage_dig(
//INPUTS
.otrip(otrip),
//OUTPUTS
.otrip_decoded(otrip_decoded)
);

endmodule
