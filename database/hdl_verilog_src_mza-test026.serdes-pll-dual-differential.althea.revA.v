// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2018-09-17 by mza
// last updated 2012-09-23 by mza

module mza_test026_serdes_pll_dual_differential_althea (
	input clock_p,
	input clock_n,
//	input self_triggered_mode_switch,
	output lemo_output,
	input lvds_trig_input_p,
	input lvds_trig_input_n,
	output lvds_trig_output_1_p,
	output lvds_trig_output_1_n,
	output lvds_trig_output_2_p,
	output lvds_trig_output_2_n,
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
	wire other_clock; // 50.0 MHz
	IBUFGDS coolcool (.I(clock_p), .IB(clock_n), .O(other_clock)); // 50.0 MHz
	wire self_triggered_mode;
//	assign self_triggered_mode = self_triggered_mode_switch;
	assign self_triggered_mode = 1;
	wire lvds_trig_output_R;
	wire lvds_trig_output_T;
	OBUFDS catcat1 (.I(lvds_trig_output_R), .O(lvds_trig_output_1_p), .OB(lvds_trig_output_1_n));
	OBUFDS catcat2 (.I(lvds_trig_output_T), .O(lvds_trig_output_2_p), .OB(lvds_trig_output_2_n));
//	OBUFDS catcat1 (.I(sync), .O(lvds_trig_output_1_p), .OB(lvds_trig_output_1_n));
//	OBUFDS catcat2 (.I(sync), .O(lvds_trig_output_2_p), .OB(lvds_trig_output_2_n));
	assign lemo_output = sync;
	wire ioclk; // 1000 MHz
	wire ioce;
	// with some help from https://vjordan.info/log/fpga/high-speed-serial-bus-generation-using-spartan-6.html and/or XAPP1064 source code
	wire cascade_do1;
	wire cascade_to1;
	wire cascade_di1;
	wire cascade_ti1;
	wire cascade_do2;
	wire cascade_to2;
	wire cascade_di2;
	wire cascade_ti2;
	reg [WIDTH-1:0] word;
	//localparam pickoff = 24; // ~ 336ms
	localparam pickoff = 6; // ~ 1.3us
	wire [7:0] led_byte;
	assign { led_7, led_6, led_5, led_4, led_3, led_2, led_1, led_0 } = led_byte;
	assign led_byte = word;
	// want MSB of word to come out first
	OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(WIDTH),
	           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("MASTER"))
	         osirus_primary_T
	         (.OQ(lvds_trig_output_T), .TQ(), .CLK0(ioclk), .CLK1(1'b0), .CLKDIV(clock),
	         .D1(word[3]), .D2(word[2]), .D3(word[1]), .D4(word[0]),
	         .IOCE(ioce), .OCE(1'b1), .RST(reset1), .TRAIN(1'b0),
	         .SHIFTIN1(1'b1), .SHIFTIN2(1'b1), .SHIFTIN3(cascade_do1), .SHIFTIN4(cascade_to1), 
	         .SHIFTOUT1(cascade_di1), .SHIFTOUT2(cascade_ti1), .SHIFTOUT3(), .SHIFTOUT4(), 
	         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(WIDTH),
	           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("SLAVE"))
	         osirus_secondary_T
	         (.OQ(), .TQ(), .CLK0(ioclk), .CLK1(1'b0), .CLKDIV(clock),
	         .D1(word[7]), .D2(word[6]), .D3(word[5]), .D4(word[4]),
	         .IOCE(ioce), .OCE(1'b1), .RST(reset1), .TRAIN(1'b0),
	         .SHIFTIN1(cascade_di1), .SHIFTIN2(cascade_ti1), .SHIFTIN3(1'b1), .SHIFTIN4(1'b1),
	         .SHIFTOUT1(), .SHIFTOUT2(), .SHIFTOUT3(cascade_do1), .SHIFTOUT4(cascade_to1),
	         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(WIDTH),
	           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("MASTER"))
	         osirus_primary_R
	         (.OQ(lvds_trig_output_R), .TQ(), .CLK0(ioclk), .CLK1(1'b0), .CLKDIV(clock),
	         .D1(word[3]), .D2(word[2]), .D3(word[1]), .D4(word[0]),
	         .IOCE(ioce), .OCE(1'b1), .RST(reset1), .TRAIN(1'b0),
	         .SHIFTIN1(1'b1), .SHIFTIN2(1'b1), .SHIFTIN3(cascade_do2), .SHIFTIN4(cascade_to2), 
	         .SHIFTOUT1(cascade_di2), .SHIFTOUT2(cascade_ti2), .SHIFTOUT3(), .SHIFTOUT4(), 
	         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(WIDTH),
	           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("SLAVE"))
	         osirus_secondary_R
	         (.OQ(), .TQ(), .CLK0(ioclk), .CLK1(1'b0), .CLKDIV(clock),
	         .D1(word[7]), .D2(word[6]), .D3(word[5]), .D4(word[4]),
	         .IOCE(ioce), .OCE(1'b1), .RST(reset1), .TRAIN(1'b0),
	         .SHIFTIN1(cascade_di2), .SHIFTIN2(cascade_ti2), .SHIFTIN3(1'b1), .SHIFTIN4(1'b1),
	         .SHIFTOUT1(), .SHIFTOUT2(), .SHIFTOUT3(cascade_do2), .SHIFTOUT4(cascade_to2),
	         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	reg [12:0] reset1_counter = 0;
	always @(posedge other_clock) begin // 50.0 MHz
		if (reset1) begin
			if (reset1_counter[10]) begin
				reset1 <= 0;
			end
		end
		reset1_counter <= reset1_counter + 1'b1;
	end
	wire trigger_input;
	IBUFDS angel (.I(lvds_trig_input_p), .IB(lvds_trig_input_n), .O(trigger_input));
	reg [1:0] token;
	reg [2:0] trigger_stream;
	localparam first_a  = 8'b11111111;
	localparam first_b  = 8'b11111111;
	localparam second_a = 8'b11110011;
	localparam second_b = 8'b10011001;
	localparam third_a  = 8'b10000000;
	localparam third_b  = 8'b00000001;
	localparam forth_a  = 8'b11001100;
	localparam forth_b  = 8'b10101010;
	always @(posedge clock) begin // 125.0 MHz
		if (reset2) begin
			token <= 3'b000;
			trigger_stream <= 0;
			if (counter[10]) begin
				reset2 <= 0;
			end
		end
		word <= 8'b00000000;
		if (self_triggered_mode) begin
			if (counter[pickoff:1]==0) begin
				         if (counter[pickoff+2:pickoff+1]==2'b00) begin
					sync <= 1;
					if (counter[0]==0) begin
						word <= first_a;
					end else begin
						word <= first_b;
					end
				end else if (counter[pickoff+2:pickoff+1]==2'b01) begin
					sync <= 0;
					if (counter[0]==0) begin
						word <= second_a;
					end else begin
						word <= second_b;
					end
				end else if (counter[pickoff+2:pickoff+1]==2'b10) begin
					if (counter[0]==0) begin
						word <= third_a;
					end else begin
						word <= third_b;
					end
				end else if (counter[pickoff+2:pickoff+1]==2'b11) begin
					if (counter[0]==0) begin
						word <= forth_a;
					end else begin
						word <= forth_b;
					end
				end
			end
		end else if (trigger_stream==3'b001) begin
			if (token==3'b000) begin
				sync <= 1;
				word <= first_a;
				token <= 3'b001;
			end else if (token==3'b001) begin
				sync <= 0;
				word <= first_b;
				token <= 3'b010;
			end else if (token==3'b010) begin
				word <= second_a;
				token <= 3'b011;
			end else if (token==3'b011) begin
				word <= second_b;
				token <= 3'b100;
			end else if (token==3'b100) begin
				word <= third_a;
				token <= 3'b101;
			end else if (token==3'b101) begin
				word <= third_b;
				token <= 3'b110;
			end else if (token==3'b110) begin
				word <= forth_a;
				token <= 3'b111;
			end else begin
				word <= forth_b;
				token <= 3'b000;
			end
		end
		trigger_stream <= { trigger_stream[1:0], trigger_input };
		counter <= counter + 1;
	end
	oserdes_pll #(.BIT_DEPTH(WIDTH), .CLKIN_PERIOD(20.0), .PLLD(2), .PLLX(40)) difficult_pll_TR (
		.reset(reset1), .clock_in(other_clock), .word_clock_out(clock), 
		.serializer_clock_out(ioclk), .serializer_strobe_out(ioce), .locked()
	);
endmodule

