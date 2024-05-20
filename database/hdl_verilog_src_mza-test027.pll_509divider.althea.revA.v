// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-08-14 by mza
// last updated 2022-09-23 by mza

// Unable to evaluate Tcl file: /opt/ilinx/14.7/ISE_DS/ISE/coregen/ip/xilinx/primary/com/xilinx/ip/clk_wiz_v3_6/generate/run_legacy_tcl_flow.tcl

`define althea_revA

module mza_test027_pll_509divider_althea (
	output clock_p,
	output clock_n,
	input lemo,
	output led_0,
	output led_1,
	output led_2,
	output led_3,
	output led_4,
	output led_5,
	output led_6,
	output led_7
);
	wire clock509;
	assign clock509 = lemo;
	//reg [WIDTH-1:0] word;
	//wire [7:0] led_byte;
	//assign { led_7, led_6, led_5, led_4, led_3, led_2, led_1, led_0 } = led_byte;
	//assign led_byte = word;
	//reg [31:0] counter = 0;
	reg reset = 1;
	reg [12:0] reset_counter = 0;
	always @(posedge clock509) begin
		if (reset) begin
			if (reset_counter[10]) begin
				reset <= 0;
			end
		end
		reset_counter <= reset_counter + 1;
	end
	wire clock127;
	pll pll_instance (.CLK_IN1(clock509), .CLK_OUT1(clock127), .RESET(reset), .LOCKED(led_0));
	wire clock127oddr;
	ODDR2 doughnut (.C0(clock127), .C1(~clock127), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(1'b0), .S(1'b0), .Q(clock127oddr));
	OBUFDS supercool (.I(clock127oddr), .O(clock_p), .OB(clock_n));
	assign led_7 = reset;
	assign led_6 = 0;
	assign led_5 = 0;
	assign led_4 = 0;
	assign led_3 = 0;
	assign led_2 = 0;
	assign led_1 = 0;
endmodule

