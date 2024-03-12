// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// Quad 2-input multiplexer
// https://assets.nexperia.com/documents/data-sheet/74HC_HCT157.pdf

               
`ifndef hct74157
`define hct74157

`timescale 1ns/1ns

module hct74157 #(parameter WIDTH=4) (_E, S, I0, I1, Y);
    input S, _E;
    input [WIDTH-1:0] I0;
    input [WIDTH-1:0] I1;
    output [WIDTH-1:0] Y;

    logic Spd = S;
    logic _Epd = _E;
    logic [WIDTH-1:0] I0pd;
    logic [WIDTH-1:0] I1pd;

/* verilator lint_off COMBDLY */
    // models "transmission delays"
    always @* begin
        Spd <= #(19) S;
        _Epd <= #(12) _E;
        I0pd <= #(13) I0;
        I1pd <= #(13) I1;
    end
/* verilator lint_on COMBDLY */

    // 19 is the worst of the PD'
    assign Y = _Epd? WIDTH'(0) : Spd? I1pd: I0pd;

endmodule


`endif
