// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

`timescale 1ns/1ns
// https://assets.nexperia.com/documents/data-sheet/74HC_HCT4017.pdf

module hc744017(cp0, _cp1, mr, q, _co);
    parameter LOG=0;

    input cp0, _cp1, mr;
    output [9:0] q;
    output _co;

// verilator lint_off UNOPTFLAT
    reg [9:0] o;
// verilator lint_on UNOPTFLAT

    `ifndef verilator
    if (LOG) always @*
        $monitor("%9t decade ", $time, " cp0=", cp0, " _cp1=", _cp1, " mr=", mr, " q=%1d", q, " _co=", _co, " o=%1d", o);
    `endif

    wire #(22) d_mr = mr;
    wire #(25) d_cp0 = cp0;
    wire #(25) d__cp1 = _cp1;

    always@(posedge d_cp0 , negedge d__cp1)
    begin
        o = d_mr ? o : (o + 1) < 10 ? o+1: 0;
    end

    always @* begin
        if (d_mr) begin
            o = 0;
        end
    end

    assign _co = o <= 4; //2^5

    assign q = 1 << o;

endmodule

