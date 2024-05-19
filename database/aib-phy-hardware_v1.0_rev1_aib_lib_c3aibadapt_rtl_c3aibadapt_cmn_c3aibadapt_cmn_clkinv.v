// This program was cloned from: https://github.com/chipsalliance/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
module c3aibadapt_cmn_clkinv
(
        output  wire    ZN,
        input   wire    I
);

	assign ZN = ~I;

endmodule // c3aibadapt_cmn_clkinv
