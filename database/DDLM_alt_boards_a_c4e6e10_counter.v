// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`include "config.vh"

`ifdef  USE_STRUCTURAL_IMPLEMENTATION

module counter
# (
    parameter w = 1
) 
(
    input            clk,
    input            rst_n,
    input            en,
    output [w - 1:0] cnt
);

    wire [w - 1:0] q;
    wire [w - 1:0] d = q + 1'b1;

    register # (w) i_reg (clk, rst_n, en, d, q);
    
    assign cnt = q;

endmodule

`else

module counter
# (
    parameter w = 1
) 
(
    input                clk,
    input                rst_n,
    input                en,
    output reg [w - 1:0] cnt
);

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            cnt <= { w { 1'b0 } };
        else if (en)
            cnt <= cnt + 1'b1;

endmodule

`endif
