// This program was cloned from: https://github.com/jinwookjungs/datc_robust_design_flow
// License: GNU General Public License v3.0

module simple (
inp1,
inp2,
clk,
out
);

// Start PIs
input inp1;
input inp2;
input clk;

// Start POs
output out;

// Start wires
wire n1;
wire n2;
wire n3;
wire n4;
wire inp1;
wire inp2;
wire clk;
wire out;

// Start cells
na02s01 u1 ( .a(inp1), .b(inp2), .o(n1) );
no02s01 u2 ( .a(n1), .b(n3), .o(n2) );
ms00f80 f1 ( .d(n2), .ck(clk), .o(n3) );
in01s01 u3 ( .a(n3), .o(n4) );
in01s01 u4 ( .a(n4), .o(out) );

endmodule
