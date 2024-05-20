// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

`ifdef  USE_STRUCTURAL_IMPLEMENTATION

module shift_register
# (
    parameter w = 1
) 
(
    input            clk,
    input            reset,
    input            en,
    input            in,
    output [w - 1:0] out_reg
);

    wire [w - 1:0] q;
    wire [w - 1:0] d = { in, q [w - 1 : 1] };

    register # (w) i_reg (clk, reset, en, d, q);
    
    assign out_reg = q;

endmodule

`else

module shift_register
# (
    parameter w = 1
) 
(
    input                clk,
    input                reset,
    input                en,
    input                in,
    output reg [w - 1:0] out_reg
);

    always @ (posedge clk or posedge reset)
        if (reset)
            out_reg <= { w { 1'b0 } };
        else if (en)
            out_reg <= { in, out_reg [w - 1 : 1] };

endmodule

`endif
