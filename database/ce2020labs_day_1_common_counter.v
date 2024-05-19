// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

`ifdef  USE_STRUCTURAL_IMPLEMENTATION

module counter
# (
    parameter w = 1
) 
(
    input            clk,
    input            reset,
    input            en,
    output [w - 1:0] cnt
);

    wire [w - 1:0] q;
    wire [w - 1:0] d = q + 1'b1;

    register # (w) i_reg (clk, reset, en, d, q);
    
    assign cnt = q;

endmodule

`else

module counter
# (
    parameter w = 1
) 
(
    input                clk,
    input                reset,
    input                en,
    output reg [w - 1:0] cnt
);

    always @ (posedge clk or posedge reset)
        if (reset)
            cnt <= { w { 1'b0 } };
        else if (en)
            cnt <= cnt + 1'b1;

endmodule

`endif
