// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

`define SYNC

(* USE_DSP = "true" *)
module basic_mult (
    input  wire clk_p,
    input  wire clk_n,
    input  wire [7:0] factor_a,
    input  wire [7:0] factor_b,
`ifdef SYNC
    output reg [17:0] result
`else
    output wire [17:0] result
`endif
    );

    wire clk_ibufg;
    wire clk;

    IBUFDS ibuf_inst (.I(clk_p), .IB(clk_n), .O(clk_ibufg));
    BUFG   bufg_inst (.I(clk_ibufg), .O(clk));

`ifdef SYNC
    (* LOC = "DSP48_X9Y205" *)
    always @(posedge clk) result <= factor_a * factor_b;
`else
    `ifndef YOSYS (* LOC = "DSP48_X9Y205" *) `endif
    assign result = factor_a * factor_b;
`endif

endmodule
