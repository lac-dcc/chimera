// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   LED blinking
*/

/*
*   Top-level module
*/
module top(
    input CLK,

    output DS_C,
	 output DS_EN1, DS_EN2, DS_EN3, DS_EN4
);

assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = 4'b1111;

blink_gen blink_gen(.clk(CLK), .clk2(DS_C));

endmodule

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
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   LED blinking
*/

/*
*   Top-level module
*/
module top(
    input CLK,

    output DS_C,
	 output DS_EN1, DS_EN2, DS_EN3, DS_EN4
);

assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = 4'b1111;

blink_gen blink_gen(.clk(CLK), .clk2(DS_C));

endmodule

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
