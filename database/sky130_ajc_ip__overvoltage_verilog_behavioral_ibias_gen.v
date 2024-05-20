// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__overvoltage
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Ibias generator model
//############################################################################

module ibias_gen(
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input logic ena,
input logic isrc_sel,
input real ibg_200n,
output real ibias,
output real itest
);

assign ibias = ena ? isrc_sel ? 800e-9 : 700e-9 : 0;

endmodule
