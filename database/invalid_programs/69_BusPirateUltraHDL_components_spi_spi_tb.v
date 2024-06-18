// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

// ---------------------------------------------------------------------------
//
// testbed for SPI master verilog implementation
//
// Written by Chris van Dongen/SMDprutser for the buspirate NextGen Ultra
// SPI info here: https://en.wikipedia.org/wiki/Serial_Peripheral_Interface
//
// ---------------------------------------------------------------------------



`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns


module spi_tb();

// Clock signal
reg clk = 1;
always #0.5 clk = ~clk;

reg rst;
reg go;
wire state;
reg cpol;
reg cpha;
reg cspol;
reg autocs;
reg [7:0] data_i;
wire [7:0] data_o;
wire mosi;
reg miso;
wire sclk;
wire cs;

parameter DURATION = 100;

spimaster UUT (
	.rst(rst),
	.clkin(clk),
	.go(go),
	.state(state),
	.cpol(cpol),
	.cpha(cpha),
	.cspol(cspol),
	.autocs(autocs),
	.data_i(data_i),
	.data_o(data_o),
	.miso(miso),
	.mosi(mosi),
	.sclk(sclk),
	.cs(cs)
);

initial begin
  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, spi_tb);

	#1	rst <= 1;
		go <= 0;
		cpol <= 1;
		cpha <= 0;
		cspol <= 1;
		miso <= 0;
		autocs <= 1;
	#1	rst <= 0;
	#1	data_i <= 8'b01011010;
		go <= 1'b1;					// cpol=1 cpha=0
	#1  go <= 1'b0;
	#9	miso <= 1;
	#10	cpol <= 0;
	#1  go <= 1'b1;					// cpol=0 cpha=0
		cpol <= 0;
	#1 	go <= 1'b0;
	#9	miso <= 0;
	#10 cpol <= 1;
		cpha <= 1;
	#1  go <= 1'b1;					// cpol=1 cpha=1
		cpol <= 1;
		cpha <= 1;
	#1  go <= 1'b0;
	#9  miso <= 1;
	#10 	cpol <= 0;
	#1  go <= 1'b1;					// cpol=0 cpha=1
		cpol <= 0;
	#1  go <= 1'b0; 
	#9 miso <= 0;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule