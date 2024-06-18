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


module tb_cc_line;

	reg		clk;
	reg		nrst;
	reg		start;
	
	reg		cc1_io;
	reg		cc1_dout;
	reg		cc2_io;
	reg		cc2_dout;
	
	reg		cc_check;
	
	wire	cc1;
	wire	cc2;
	
	assign cc1 = (cc1_io) ? cc1_dout : 1'b1;
	assign cc2 = (cc2_io) ? cc2_dout : 1'b0;
	
	cc_line DUT(
		.nrst		(nrst),
		.clock		(clk),
		
		.cc1		(cc1),
		.cc2		(cc2),
		
		.cc_check	(cc_check),
		.cc_dout	(1'b0),
		.cc_io_ctrl	(1'b0)
	);
	
	always begin
		#2.5 clk = ~clk;
	end
	
	initial begin
		fork begin
			
			#0 clk = 1'b0;
			nrst = 1'b0;
			cc1_io = 1'b0;
			cc1_dout = 1'b0;
			cc2_io = 1'b0;
			cc2_dout = 1'b0;
			cc_check = 1'b0;
			
			#1000 nrst <= 1'b1;
			#1000 start <= 1'b1;
			
			#10 cc1_io = 1'b0;
			
			#100 cc_check <= 1'b0;
			@(posedge clk)
			cc_check <= 1'b1;
			@(posedge clk)
			cc_check <= 1'b0;
			
		end join
	end
	
endmodule
