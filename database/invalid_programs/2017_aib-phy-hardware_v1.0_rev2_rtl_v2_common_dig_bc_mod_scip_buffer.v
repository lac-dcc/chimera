// This program was cloned from: https://github.com/chipsalliance/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2019 Blue Cheetah Analog Design, Inc.

module buffer (
    input in,
    output out
);

`ifdef BEHAVIORAL
assign out = in;
`else
 //replace this section with user technology cell
 //for the purpose of cell hardening, synthesis don't touch
 $display("ERROR : %m : replace this section with user technology cell");
 $finish;

`endif

endmodule
