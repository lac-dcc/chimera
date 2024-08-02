// This program was cloned from: https://github.com/GoodKook/ETRI-0.5u-CMOS-MPW-DK-Example--FIR8
// License: GNU General Public License v3.0

// Filename : fir_pe.v
// Purpose  : Processing Element for FIR filter
// Author   : goodkook@gmail.com
// History  : Mar. 2024, First Release

`define Y_CONCURRENT_PROC

/* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNDRIVEN */

module fir_pe (clk, Cin, Xin, Xout, Yin, Yout);
input           clk;
input   [ 7:0]  Cin;
input   [ 7:0]  Xin;
output  [ 7:0]  Xout;
input   [15:0]  Yin;
output  [15:0]  Yout;

    reg     [ 7:0]  Xout;
    reg     [15:0]  Yout;
    reg     [15:0]  y;

`ifdef Y_CONCURRENT_ASSIGN
    assign y = Xin * Cin + Yin;
`endif

`ifdef Y_CONCURRENT_PROC
    always @(posedge clk)
        y <= Xin * Cin + Yin;
`endif

    always @(posedge clk)
    begin
        Xout <= Xin;
`ifdef Y_BEFORE_OUT
        y <= Xin * Cin + Yin;
`endif
        Yout <= y;
`ifdef Y_AFTER_OUT
        y <= Xin * Cin + Yin;
`endif
    end

endmodule
