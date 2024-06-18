// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2018-09-17 by mza
// last updated 2022-09-23 by mza

`define althea_revA
//`include "lib/generic.v"
//`include "lib/RAM8.v"
//`include "lib/RAM.sv" // ise does not and will not support systemverilog
//`include "lib/plldcm.v"
`include "lib/serdes_pll.v"
//`include "lib/half_duplex_rpi_bus.v"
//`include "lib/sequencer.v"
//`include "lib/reset.v"
//`include "lib/edge_to_pulse.v"

module mza_test023_serdes_pll_althea (
	input clock_p,
	input clock_n,
	output ttl_trig_output,
	input self_triggered_mode_switch,
	input lvds_trig_input_p,
	input lvds_trig_input_n,
	//output lvds_tr1ig_output_n,
	//output lvds_trig_output_p,
	//output lvds_tr1ig_output_n,
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
	wire clock; // 125 MHz
	reg [31:0] counter = 0;
	reg sync;
//	assign led_8 = counter[27-$clog2(WIDTH)]; // ~ 1 Hz
//	assign led_8 = sync;
//	assign led_9 = reset1;
//	assign led_a = reset2;
	wire other_clock;
	IBUFGDS coolcool (.I(clock_p), .IB(clock_n), .O(other_clock)); // 156.25 MHz
	wire IOCLK0;
	wire IOCE;
	// with some help from https://vjordan.info/log/fpga/high-speed-serial-bus-generation-using-spartan-6.html and/or XAPP1064 source code
	wire cascade_do;
	wire cascade_to;
	wire cascade_di;
	wire cascade_ti;
	reg [WIDTH-1:0] word;
	localparam pickoff = 24;
	wire [7:0] led_byte;
	assign { led_7, led_6, led_5, led_4, led_3, led_2, led_1, led_0 } = led_byte;
	assign led_byte = word;
	// want MSB of word to come out first
	OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(WIDTH),
	           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("MASTER"))
	         osirus_primary
	         (.OQ(ttl_trig_output), .TQ(), .CLK0(IOCLK0), .CLK1(1'b0), .CLKDIV(clock),
	         .D1(word[3]), .D2(word[2]), .D3(word[1]), .D4(word[0]),
	         .IOCE(IOCE), .OCE(1'b1), .RST(reset1), .TRAIN(1'b0),
	         .SHIFTIN1(1'b1), .SHIFTIN2(1'b1), .SHIFTIN3(cascade_do), .SHIFTIN4(cascade_to), 
	         .SHIFTOUT1(cascade_di), .SHIFTOUT2(cascade_ti), .SHIFTOUT3(), .SHIFTOUT4(), 
	         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(WIDTH),
	           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("SLAVE"))
	         osirus_secondary
	         (.OQ(), .TQ(), .CLK0(IOCLK0), .CLK1(1'b0), .CLKDIV(clock),
	         .D1(word[7]), .D2(word[6]), .D3(word[5]), .D4(word[4]),
	         .IOCE(IOCE), .OCE(1'b1), .RST(reset1), .TRAIN(1'b0),
	         .SHIFTIN1(cascade_di), .SHIFTIN2(cascade_ti), .SHIFTIN3(1'b1), .SHIFTIN4(1'b1),
	         .SHIFTOUT1(), .SHIFTOUT2(), .SHIFTOUT3(cascade_do), .SHIFTOUT4(cascade_to),
	         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	reg [12:0] reset1_counter = 0;
	always @(posedge other_clock) begin
		if (reset1) begin
			if (reset1_counter[10]) begin
				reset1 <= 0;
			end
		end
		reset1_counter <= reset1_counter + 1;
	end
	wire trigger_input;
	IBUFDS angel (.I(lvds_trig_input_p), .IB(lvds_trig_input_n), .O(trigger_input));
	reg [1:0] token;
	reg [2:0] trigger_stream;
	localparam first  = 8'b11110000;
	localparam second = 8'b10000001;
	localparam third  = 8'b10001000;
	localparam forth  = 8'b10101010;
	always @(posedge clock) begin
		if (reset2) begin
			token <= 2'b00;
			trigger_stream <= 0;
			if (counter[10]) begin
				reset2 <= 0;
			end
		end
		word <= 8'b00000000;
		if (self_triggered_mode_switch) begin
			if (counter[pickoff:0]==0) begin
				         if (counter[pickoff+2:pickoff+1]==2'b00) begin
					sync <= 1;
					word <= first;
				end else if (counter[pickoff+2:pickoff+1]==2'b01) begin
					sync <= 0;
					word <= second;
				end else if (counter[pickoff+2:pickoff+1]==2'b10) begin
					word <= third;
				end else if (counter[pickoff+2:pickoff+1]==2'b11) begin
					word <= forth;
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
		counter <= counter + 1;
	end
//	oserdes_pll #(.WIDTH(WIDTH), .CLKIN_PERIOD(6.4), .PLLD(5), .PLLX(32)) difficult_pll (.reset(reset1), .clock_in(other_clock), .fabric_clock_out(clock), .serializer_clock_out(IOCLK0), .serializer_strobe_output(IOCE), .locked());
	oserdes_pll #(.BIT_DEPTH(WIDTH), .CLKIN_PERIOD(20.0), .PLLD(2), .PLLX(40)) difficult_pll (
		.reset(reset1), .clock_in(other_clock), .word_clock_out(clock), 
		.serializer_clock_out(IOCLK0), .serializer_strobe_out(IOCE), .locked()
	);
endmodule

