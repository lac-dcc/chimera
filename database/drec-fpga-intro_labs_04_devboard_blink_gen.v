// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

/*
*   Blinking frequency generator
*/
module blink_gen(
    input clk,

    output clk2
);

reg [25:0]cnt = 0;

assign clk2 = cnt[25];

always @(posedge clk) begin
    cnt <= cnt + 26'b1;
end

endmodule
