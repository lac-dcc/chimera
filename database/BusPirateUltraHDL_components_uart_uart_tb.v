// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns


module uart_tb();

// Clock signal
reg clk = 0;
always #0.5 clk = ~clk;

reg rst;
reg go;
wire txbusy;
reg [7:0] txdata;
wire [7:0] rxdata;
wire txd;
reg rxd;
wire frameerror;

top UUT (
	.rst(rst),
	.clk(clk),
	.go(go),
	.txbusy(txbusy),
	.txdata(txdata),
	.rxdata(rxdata),
	.txd(txd),
	.rxd(rxd),
	.frameerror(frameerror)
);

parameter DURATION = 50;


initial begin
  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, uart_tb);

	#0	rst <= 1;
	#1	rst <= 0;
	#1	txdata <= 8'hA5;
		rxd <= 1;
		go <= 1;
	#1	go <= 0;
	
	#20	rxd <= 1'b0;	// startbit
	#4	rxd <= 1'b1;	// bit 7
	#4	rxd <= 1'b0;
	#4	rxd <= 1'b1;
	#4	rxd <= 1'b1;
	#4	rxd <= 1'b0;
	#4	rxd <= 1'b0;
	#4	rxd <= 1'b1;
	#4	rxd <= 1'b1;	// bit 0
	#4	rxd <= 1'b0;	// stop
	#4	rxd <= 1'b1;

	#10	txdata <= 8'h5A;
		go <= 1;
	#1	go <= 0;
	

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule