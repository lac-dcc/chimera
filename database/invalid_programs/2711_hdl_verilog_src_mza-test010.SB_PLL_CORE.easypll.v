// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-08-01 by mza
// last updated 2020-05-29 by mza

`define icestick
`include "lib/easypll.v"

module mypll (
	input clock,
	output fast_clock,
	output pll_is_locked,
	output divided_clock,
	output reg [31:0] counter = 0
);
	assign divided_clock = counter[15];
	//easypll #(.DIVR(0), .DIVF(63), .DIVQ(3), .FILTER_RANGE(1)) my_pll_instance (.clock_input(CLK), .reset_active_low(1), .global_clock_output(fast_clock), .pll_is_locked(pll_is_locked)); // 96 MHz
	easypll my_96MHz_pll_instance (.clock_input(clock), .reset_active_low(1), .global_clock_output(fast_clock), .pll_is_locked(pll_is_locked)); // 96 MHz
	//easypll #(.DIVR(0), .DIVF(53), .DIVQ(2), .FILTER_RANGE(1)) my_162MHz_pll_instance (.clock_input(clock), .reset_active_low(1), .global_clock_output(fast_clock), .pll_is_locked(pll_is_locked)); // 162 MHz
	always @(posedge fast_clock) begin
		counter++;
	end
endmodule // mypll

//module top(input CLK, output J1_3, J1_10, LED5);
//	mypll mypll_instance (.clock(CLK), .fast_clock(J1_3), .pll_is_locked(LED5), .divided_clock(J1_10));
//endmodule // top

module top (
	input CLK,
	output LED1, LED2, LED3, LED4, LED5,
	output J1_3, J1_4, J1_5, J1_6, J1_7, J1_8, J1_9, J1_10,
	output J2_1, J2_2, J2_3, J2_4, J2_7, J2_8, J2_9, J2_10,
	output J3_3, J3_4, J3_5, J3_6, J3_7, J3_8, J3_9, J3_10,
	output DCDn, DSRn, CTSn, TX, IR_TX, IR_SD,
	input DTRn, RTSn, RX, IR_RX
);
	wire [7:0] J1 = { J1_10, J1_9, J1_8, J1_7, J1_6, J1_5, J1_4, J1_3 };
	wire [7:0] J2 = { J2_10, J2_9, J2_8, J2_7, J2_4, J2_3, J2_2, J2_1 };
	wire [7:0] J3 = { J3_10, J3_9, J3_8, J3_7, J3_6, J3_5, J3_4, J3_3 };
	wire [5:1] LED = { LED5, LED4, LED3, LED2, LED1 };
	assign { DCDn, DSRn, CTSn, TX, IR_TX, IR_SD } = 0;

	wire [31:0] counter;
	assign J3 = counter[23:16];
	assign J2 = counter[15:8];
	assign J1 = counter[7:0];
	assign LED[3] = counter[24];
	assign LED[4] = counter[25];
	mypll mypll_instance (.clock(CLK), .fast_clock(LED[1]), .pll_is_locked(LED[5]), .divided_clock(LED[2]), .counter(counter));
endmodule // icestick

