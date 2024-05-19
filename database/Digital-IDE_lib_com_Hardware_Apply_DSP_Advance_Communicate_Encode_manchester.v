// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
module manchester (
    input  clk,
    input  sig_in,
    output man_sig_out
);

reg ck   = 0;
reg ck_r = 0;
always @(posedge clk) begin
    ck <= ck_r;
    ck <= ~ ck;
end

assign man_sig_out = ck ^ sig_in;

endmodule
