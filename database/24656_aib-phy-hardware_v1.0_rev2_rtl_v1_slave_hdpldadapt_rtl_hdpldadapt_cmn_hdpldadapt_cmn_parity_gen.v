// This program was cloned from: https://github.com/chipsalliance/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
module hdpldadapt_cmn_parity_gen
    #(
	parameter WIDTH = 'd0   
    )   
    (
        output  wire			parity,
        input   wire [WIDTH-1:0]    	data
    );

	assign parity = ^data[WIDTH-1:0];

endmodule // hdpldadapt_cmn_parity_gen
