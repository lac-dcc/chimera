// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2018-09-17 by mza
// last updated 2019-12-20 by mza
// works on a laser driver revE

module mza_test024_serdes_pll_differential_althea (
	input clock_p,
	input clock_n,
	input self_triggered_mode_switch,
	input pass_through_mode,
	input lemo_input,
//	output lemo_output,
//	input lvds_trig_input_p,
//	input lvds_trig_input_n,
	output lvds_trig_output_1_p,
	output lvds_trig_output_1_n,
//	output lvds_trig_output_2_p,
//	output lvds_trig_output_2_n,
	output led_0,
	output led_1,
	output led_2,
	output led_3,
	output led_4,
	output led_5,
	output led_6,
	output led_7
);
	localparam WIDTH = 8;
	reg reset1 = 1;
	reg reset2 = 1;
	wire word_clock; // 125 MHz
	reg [31:0] counter = 0;
	reg sync;
	wire other_clock; // 50.0 MHz
	IBUFGDS coolcool (.I(clock_p), .IB(clock_n), .O(other_clock)); // 50.0 MHz
	wire D;
	wire lvds_trig_output_D;
//	assign lvds_trig_output_D = sync;
	assign lvds_trig_output_D = D;
	OBUFDS catcat1 (.I(lvds_trig_output_D), .O(lvds_trig_output_1_p), .OB(lvds_trig_output_1_n));
	//wire lvds_trig_output_T;
	//OBUFDS catcat2 (.I(lvds_trig_output_T), .O(lvds_trig_output_2_p), .OB(lvds_trig_output_2_n));
	//assign lvds_trig_output_T = sync;
	//assign lvds_trig_output_T = T;
//	assign lemo_output = sync;
//	assign lemo_output = D;
	reg [WIDTH-1:0] word;
	wire [7:0] led_byte;
	assign { led_7, led_6, led_5, led_4, led_3, led_2, led_1, led_0 } = led_byte;
	reg [7:0] led_reg;
	assign led_byte = led_reg;
	//assign led_byte = ~ word;
	ocyrus_single8 #(.BIT_WIDTH(WIDTH), .PERIOD(20.0), .DIVIDE(2), .MULTIPLY(40), .SCOPE("BUFPLL")) mylei (.clock_in(other_clock), .reset(reset1), .word_clock_out(word_clock), .word_in(word), .D_out(D), .locked());
	reg [12:0] reset1_counter = 0;
	always @(posedge other_clock) begin // 50.0 MHz
		if (reset1) begin
			if (reset1_counter[10]) begin
				reset1 <= 0;
			end
		end
		reset1_counter <= reset1_counter + 1'b1;
	end
	reg trigger_input = 0;
//	wire trigger_input;
//	IBUFDS angel (.I(lvds_trig_input_p), .IB(lvds_trig_input_n), .O(trigger_input));
	reg [1:0] token;
	reg [2:0] trigger_stream;
	localparam first  = ~ 8'b11111111;
	localparam second = ~ 8'b11110001;
	localparam third  = ~ 8'b10001000;
	localparam forth  = ~ 8'b10101010;
	localparam on     = ~ 8'b11111111;
	localparam off    = ~ 8'b00000000;
	localparam pickoff = 24;
	always @(posedge word_clock) begin // 125.0 MHz
		if (reset2) begin
			token <= 2'b00;
			trigger_stream <= 0;
			if (counter[10]) begin
				reset2 <= 0;
			end
			led_reg <= 0;
			sync <= 0;
		end
		word <= ~ 8'b00000000;
		sync <= 0;
		if (pass_through_mode) begin
			if (lemo_input) begin
				word <= on;
			end else begin
				word <= off;
			end
		end else if (self_triggered_mode_switch) begin
			if (counter[pickoff:0]==0) begin
				         if (counter[pickoff+2:pickoff+1]==2'b00) begin
					sync <= 1;
					word <= first;
					led_reg <= first;
				end else if (counter[pickoff+2:pickoff+1]==2'b01) begin
					sync <= 1;
					word <= second;
					led_reg <= second;
				end else if (counter[pickoff+2:pickoff+1]==2'b10) begin
					sync <= 1;
					word <= third;
					led_reg <= third;
				end else if (counter[pickoff+2:pickoff+1]==2'b11) begin
					sync <= 1;
					word <= forth;
					led_reg <= forth;
				end
			end
		end else if (trigger_stream==3'b001) begin
			if (token==2'b00) begin
				sync <= 1;
				word <= first;
				token <= 2'b01;
			end else if (token==2'b01) begin
				sync <= 0;
				word <= second;
				token <= 2'b10;
			end else if (token==2'b10) begin
				word <= third;
				token <= 2'b11;
			//end else if (token==2'b11) begin
			end else begin
				word <= forth;
				token <= 2'b00;
			end
		end
		trigger_stream <= { trigger_stream[1:0], trigger_input };
		counter <= counter + 1'b1;
	end
endmodule

