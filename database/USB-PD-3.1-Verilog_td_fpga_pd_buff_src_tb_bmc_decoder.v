// This program was cloned from: https://github.com/briansune/USB-PD-3.1-Verilog
// License: MIT License

//  ____         _                ____                      
// | __ )  _ __ (_)  __ _  _ __  / ___|  _   _  _ __    ___ 
// |  _ \ | '__|| | / _` || '_ \ \___ \ | | | || '_ \  / _ \
// | |_) || |   | || (_| || | | | ___) || |_| || | | ||  __/
// |____/ |_|   |_| \__,_||_| |_||____/  \__,_||_| |_| \___|
//                                                          
// Programed By: BrianSune
// Contact: briansune@gmail.com
// 


`timescale 1ns/1ps


module tb_bmc_decoder;

	reg		clk;
	reg		nrst;
	
	reg		cc1;
	wire	rdy;
	wire	bmc_q;
	
	bmc_decoder#(
		.system_khz(200000)
	)DUT(
		.nrst		(nrst),
		.clock		(clk),
		.enable		(1'b1),
		
		.bmc_in		(cc1),
		
		.rdy		(rdy),
		.bmc_q		(bmc_q)
	);
	
	always begin
		#2.5 clk = ~clk;
	end
	
	initial begin
		fork begin
			
			#0 clk = 1'b0;
			nrst = 1'b0;
			cc1 = 1'b1;
			
			#1000 nrst <= 1'b1;
			
			// check invalid case
			#500 cc1 = 1'b1;
			#1333 cc1 = 1'b0;
			#7500 cc1 = 1'b1;
			
			#3333.333 cc1 <= 1'b0;
			#3333.333 cc1 <= 1'b1;
			#1666.667 cc1 <= 1'b0;
			#1666.667 cc1 <= 1'b1;
			#1666.667 cc1 <= 1'b0;
			#1666.667 cc1 <= 1'b1;
			#3333.333 cc1 <= 1'b0;
			#1666.667 cc1 <= 1'b1;
			#1666.667 cc1 <= 1'b0;
			#3333.333 cc1 <= 1'b0;
			#3333.333 cc1 <= 1'b1;
			
		end join
	end
	
endmodule
