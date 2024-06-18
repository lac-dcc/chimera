// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2018-09-17 by mza
// last updated 2020-05-29 by mza

`define SCROD_revA3

module mza_test019_serdes (
	input clock_p,
	input clock_n,
	output ttl_trig_output,
	output led0,
	output led1,
	output led2
	//output lvds_trig_output_p,
	//output lvds_trig_output_n
);
	localparam WIDTH = 8;
	wire clock;
	reg [31:0] counter = 0;
	assign led0 = counter[27-$clog2(WIDTH)]; // ~ 1 Hz
	assign led1 = reset;
	assign led2 = 0;
	reg reset = 1;
	wire other_clock;
	IBUFDS coolcool (.I(clock_p), .IB(clock_n), .O(other_clock)); // 156.25 MHz
	wire IOCLK0;
	wire IOCE;
	wire unbuffered_clock;
	BUFIO2 #(.DIVIDE(WIDTH), .USE_DOUBLER("FALSE"), .I_INVERT("FALSE"), .DIVIDE_BYPASS("FALSE")) buffy (.I(other_clock), .DIVCLK(unbuffered_clock), .IOCLK(IOCLK0), .SERDESSTROBE(IOCE));
	BUFG asdf (.I(unbuffered_clock), .O(clock)); // 156.25 MHz divided by WIDTH
	// with some help from https://vjordan.info/log/fpga/high-speed-serial-bus-generation-using-spartan-6.html and/or XAPP1064 source code
	wire cascade_do;
	wire cascade_to;
	wire cascade_di;
	wire cascade_ti;
	wire [WIDTH-1:0] word;
	assign word = { 4'b0, counter[WIDTH-1-4:0] };
	OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(WIDTH),
	           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("MASTER"))
	         osirus_primary
	         (.OQ(ttl_trig_output), .TQ(), .CLK0(IOCLK0), .CLK1(1'b0), .CLKDIV(clock),
	         .D1(word[7]), .D2(word[6]), .D3(word[5]), .D4(word[4]),
	         .IOCE(IOCE), .OCE(1'b1), .RST(reset), .TRAIN(1'b0),
	         .SHIFTIN1(1'b1), .SHIFTIN2(1'b1), .SHIFTIN3(cascade_do), .SHIFTIN4(cascade_to), 
	         .SHIFTOUT1(cascade_di), .SHIFTOUT2(cascade_ti), .SHIFTOUT3(), .SHIFTOUT4(), 
	         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(WIDTH),
	           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("SLAVE"))
	         osirus_secondary
	         (.OQ(), .TQ(), .CLK0(IOCLK0), .CLK1(1'b0), .CLKDIV(clock),
	         .D1(word[3]), .D2(word[2]), .D3(word[1]), .D4(word[0]),
	         .IOCE(IOCE), .OCE(1'b1), .RST(reset), .TRAIN(1'b0),
	         .SHIFTIN1(cascade_di), .SHIFTIN2(cascade_ti), .SHIFTIN3(1'b1), .SHIFTIN4(1'b1),
	         .SHIFTOUT1(), .SHIFTOUT2(), .SHIFTOUT3(cascade_do), .SHIFTOUT4(cascade_to),
	         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	always @(posedge clock) begin
		if (reset) begin
			if (counter[10]) begin
				reset <= 0;
			end
		end
		counter <= counter + 1;
	end
//	assign ttl_trig_output = counter[0];
endmodule
