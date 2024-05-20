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


module tb_crc32;

	reg		clk;
	reg		nrst;
	reg		enable;
	
	reg		[7 : 0]		data;
	
	wire	[31 : 0]	crc_out;
	
	crc32 DUT(
		.nrst	(nrst),
		.clock	(clk),
		.enable	(enable),
		
		.din	(data),
		.crc_o	(crc_out)
	);
	
	always begin
		#2.5 clk = ~clk;
	end
	
	initial begin
		fork begin
			
			#0 clk = 1'b0;
			nrst = 1'b0;
			enable = 1'b0;
			data = 8'd0;
			
			#100 nrst = 1'b1;
			
			@(posedge clk)
			enable <= 1'b1;
			data <= 8'h4d;
			@(posedge clk)
			data <= 8'h00;
			@(posedge clk)
			enable <= 1'b0;
			
		end join
	end
	
endmodule
