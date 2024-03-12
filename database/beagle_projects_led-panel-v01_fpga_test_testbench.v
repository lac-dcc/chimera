//=============================================================================================
// SparkFun / Adafruit 32x32 LED Panel Driver Testbench
// Copyright 2014 by Glen Akins.
// All rights reserved.
// 
// Set editor width to 96 and tab stop to 4.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//=============================================================================================

//=============================================================================================
// testbench
//

module testbench;


//---------------------------------------------------------------------------------------------
// testbench variables
//

reg                 rst_n;						// reset
reg                 clk50;						// clock

wire    			gpmc_clk;					// gpmc bus
wire    			gpmc_csn;
wire    			gpmc_advn;
wire    			gpmc_oen;
wire    			gpmc_wen;
wire	[1:0]		gpmc_ben;
wire	[15:0]		gpmc_ad;

wire				r0, g0, b0, r1, g1, b1;		// display
wire	[3:0]		a;
wire				blank, latch, sclk;


//---------------------------------------------------------------------------------------------
// testbench modules
//

glbl glbl ();

gpmc_async_host_model
#(
    .CS_ON_TIME           ( 0),
    .CS_RD_OFF_TIME       (11),     // +5 fclk vs logibone defaults
    .CS_WR_OFF_TIME       ( 6),     // +1 fclk vs logibone defaults
    .ADV_ON_TIME          ( 0),
    .ADV_RD_OFF_TIME      ( 1),     // -1 flck vs logibone defaults
    .ADV_WR_OFF_TIME      ( 1),     // -1 fclk vs logibone defaults
    .OE_ON_TIME           ( 2),     // -1 flck vs logibone defaults
    .OE_OFF_TIME          (12),     // +6 fclk vs logibone defaults
    .WE_ON_TIME           ( 3),
    .WE_OFF_TIME          ( 6),     // +1 fclk vs logibone defaults
    .RD_CYCLE_TIME        (12),     // +6 flck vs logibone defaults
    .RD_ACCESS_TIME       (11),     // +6 fclk vs logibone defaults
    .WR_CYCLE_TIME        ( 7),     // +1 fclk vs logibone defaults
    .WR_ACCESS_TIME       ( 0),
    .WR_DATA_ON_ADMUX_BUS ( 2),     // -1 fclk vs logibone defaults
    .CYCLE_2_CYCLE_DELAY  ( 1)
) gpmc_host (
    .gpmc_clk           (gpmc_clk),
    .gpmc_csn           (gpmc_csn),
    .gpmc_advn          (gpmc_advn),
    .gpmc_oen           (gpmc_oen),
    .gpmc_wen           (gpmc_wen),
    .gpmc_ben           (gpmc_ben),
    .gpmc_ad            (gpmc_ad)
);


//---------------------------------------------------------------------------------------------
// modules under test
//

beagle01 beagle01
(
	.rst_n				(rst_n),
	.clk50_in			(clk50),

	.pushbutton			(1'b0),
	.switch				(2'b0),
	.led				(),

    .PMOD1_1_LVDS8_P	(r0),
    .PMOD1_2_LVDS8_N	(g0),
    .PMOD1_3_LVDS7_P	(b0),
    .PMOD1_4_LVDS7_N	(r1),
    .PMOD1_7_LVDS1_P	(g1),
    .PMOD1_8_LVDS1_N	(b1),
    .PMOD1_9_LVDS2_P	(),
    .PMOD1_10_LVDS2_N	(),

    .PMOD2_1_LVDS6_P	(a[0]),
    .PMOD2_2_LVDS6_N	(a[1]),
    .PMOD2_3_LVDS5_P	(a[2]),
    .PMOD2_4_LVDS5_N	(a[3]),
    .PMOD2_7_LVDS3_P	(blank),
    .PMOD2_8_LVDS3_N	(latch),
    .PMOD2_9_LVDS4_P	(sclk),
    .PMOD2_10_LVDS4_N	(),

    .gpmc_clk           (gpmc_clk),
    .gpmc_csn           (gpmc_csn),
    .gpmc_advn          (gpmc_advn),
    .gpmc_oen           (gpmc_oen),
    .gpmc_wen           (gpmc_wen),
    .gpmc_ben           (gpmc_ben),
    .gpmc_ad            (gpmc_ad)
);


//---------------------------------------------------------------------------------------------
// clock generation
//

initial clk50 <= 0;
always #(10.0) clk50 <= ~clk50;


//---------------------------------------------------------------------------------------------
// test script
//

integer i;

reg [31:0] rddata;

initial
begin
    rst_n <= 1'b0;
	gpmc_host.init ();

    #1000 ;

    rst_n <= 1;

    #1000 ;

	// write some stuff to buffer memory

    gpmc_host.write16 (16'h8, 16'h001f);		// address register
    gpmc_host.write16 (16'h9, 16'h0ccc);		// data register
    gpmc_host.idle ();

    gpmc_host.write16 (16'h8, 16'h0000);		// address register
    gpmc_host.write16 (16'h9, 16'h0f00);		// data register
    gpmc_host.idle ();

    gpmc_host.write16 (16'h8, 16'h0020);		// address register
    gpmc_host.write16 (16'h9, 16'h0aaa);		// data register
    gpmc_host.idle ();

	// wait for stuff to be output to display

    #1_000_000 ;

    $finish;
end


//---------------------------------------------------------------------------------------------
// monitors
//

reg [31:0] r0_shift;
reg [31:0] g0_shift;
reg [31:0] b0_shift;

always @ (posedge sclk)
begin
    r0_shift <= { r0, r0_shift[31:1] };
    g0_shift <= { g0, g0_shift[31:1] };
    b0_shift <= { b0, b0_shift[31:1] };
end

always @ (negedge latch)
begin
    if (rst_n)
    begin
        $display ("%d %b%b%b %b%b%b", a,
            r0_shift[31],g0_shift[31],b0_shift[31],
            r0_shift[0],g0_shift[0],b0_shift[0]);
    end
end

endmodule
