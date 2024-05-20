// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-08-03 by mza
// last updated 2020-06-01 by mza

`define icestick

module mytop (
	input clock,
	output [5:1] LED,
	output [7:0] J1, J2, J3
);
	// add user code here:
	assign LED = 0;
	assign J1 = 0;
	assign J2 = 0;
	assign J3 = 0;
endmodule // mytop

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
	mytop mytop_instance (.clock(CLK), .LED(LED), .J1(J1), .J2(J2), .J3(J3));
endmodule // icestick

