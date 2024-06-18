// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

`timescale 1ns/1ps
`define DUMPSTR(x) `"x.vcd`"

module buspirate_tb();

  parameter DURATION = 50;

  localparam MC_DATA_WIDTH = 16;
  localparam MC_ADD_WIDTH = 6;

  reg clk=0, rst;

  reg mc_oe, mc_ce, mc_we;
  reg [MC_ADD_WIDTH-1:0] mc_add;
  wire [MC_DATA_WIDTH-1:0] mc_data;
  reg [MC_DATA_WIDTH-1:0] mc_data_reg;

  assign mc_data=(mc_oe)?mc_data_reg:16'hzzzz;

  top buspirate(
    .clock(clk),
    .reset(rst),
    .mc_oe(mc_oe),
    .mc_ce(mc_ce),
    .mc_we(mc_we),
    .mc_add(mc_add),
    .mc_data(mc_data)
    );

	// Clock signal
	always #0.5 clk = ~clk;



	initial begin
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, buspirate_tb);

		#0	rst <= 1;
			mc_oe <= 1;
			mc_we <= 1;
			mc_ce <= 1;
		#1	rst <= 0;
			mc_add <= 6'h00;

	// read
		#1	mc_ce <= 0;
		#1	mc_oe <= 0;
		#5	mc_ce <= 1;
			mc_oe <= 1;

	// write
		#1	mc_ce <= 0;
			mc_we <= 0;
			mc_data_reg <= 16'hAA55;
		#5	mc_ce <= 1;
			mc_we <= 1;

	// read  back
		#1	mc_ce <= 0;
		#1	mc_oe <= 0;
		#5	mc_ce <= 1;
			mc_oe <= 1;

		#(DURATION) $display("End of simulation");
	$finish;
end

endmodule
