// This program was cloned from: https://github.com/chipsalliance/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
module c3aibadapt_cmn_occ_clkgate
(
	input	wire		clk,
	input	wire		clk_enable_i,
	output	wire		clk_o
);

c3aibadapt_cmn_clkgate adapt_cmn_clkgate
    (
        .cp(clk),
        .e(clk_enable_i),
        .te(1'b0),
        .q(clk_o)
    );

endmodule // c3aibadapt_cmn_occ_clkgate
