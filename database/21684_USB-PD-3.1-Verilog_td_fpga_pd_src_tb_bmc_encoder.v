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


module tb_bmc_encoder;

	reg		clk;
	reg		nrst;
	reg		dut_data;
	
	wire	din_rdy;
	wire	dout;
	
	bmc_encoder#(
		.system_khz(200000)
	)DUT(
		.nrst	(nrst),
		.clock	(clk),
		.enable	(1'b1),
		.data	(dut_data),
		.rdy	(din_rdy),
		.dmc_q	(dout)
	);
	
	always begin
		#2.5 clk = ~clk;
	end
	
	initial begin
		fork begin
			
			#0 clk = 1'b0;
			nrst = 1'b0;
			dut_data = 1'b0;
			
			#100 nrst = 1'b1;
			
			@(posedge din_rdy)
			dut_data <= 1'b1;
			
			@(posedge din_rdy)
			dut_data <= 1'b0;
			
			@(posedge din_rdy)
			dut_data <= 1'b0;
			
			@(posedge din_rdy)
			dut_data <= 1'b1;
			
			@(posedge din_rdy)
			dut_data <= 1'b1;
			
			@(posedge din_rdy)
			dut_data <= 1'b0;
			
			@(posedge din_rdy)
			dut_data <= 1'b1;
			
			@(posedge din_rdy)
			dut_data <= 1'b0;
			
		end join
	end
	
endmodule
