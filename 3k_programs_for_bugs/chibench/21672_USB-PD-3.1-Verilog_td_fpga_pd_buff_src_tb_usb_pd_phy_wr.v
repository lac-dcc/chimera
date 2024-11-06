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


module tb_usb_pd_phy_wr;

	reg		clk;
	reg		nrst;
	reg		start;
	reg		hdr_sop_hrst;
	
	reg		[31 : 0]	tx_word;
	reg		[3 : 0]		tx_type;
	reg		[2 : 0]		tx_num;
	
	wire	dout;
	wire	busy;
	
	usb_pd_phy_wr#(
		.system_khz(200000)
	)DUT(
		.nrst		(nrst),
		.clock		(clk),
		
		.hdr_sop_hrst	(hdr_sop_hrst),
		.start			(start),
		.busy			(busy),
		
		.send_num	(tx_num),
		.send_type	(tx_type),
		
		.send_word0	(tx_word),
		.send_word1	(32'd0),
		.send_word2	(32'd0),
		.send_word3	(32'd0),
		.send_word4	(32'd0),
		.send_word5	(32'd0),
		.send_word6	(32'd0),
		
		.bmc_dout	(dout)
	);
	
	always begin
		#2.5 clk = ~clk;
	end
	
	initial begin
		fork begin
			
			#0 clk = 1'b0;
			nrst = 1'b0;
			start = 1'b0;
			hdr_sop_hrst = 1'b0;
			
			tx_word = 32'd0;
			tx_type = 4'hD;
			tx_num = 3'd0;
			
			#1000 nrst <= 1'b1;
			
			#1000 start <= 1'b0;
			hdr_sop_hrst = 1'b1;
			
			if(!busy)begin
				#10 start <= 1'b1;
			end
			
			#10 start <= 1'b0;
			
			@(!busy)begin
				#30000 start <= 1'b0;
			end
			
			if(!busy)begin
				#10 start <= 1'b1;
				hdr_sop_hrst <= 1'b0;
				tx_word = 32'd0;
				tx_type = 4'hD;
				tx_num = 3'd0;
			end
			
			#10 start <= 1'b0;
			
			@(!busy)begin
				#30000 start <= 1'b0;
			end
			
			if(!busy)begin
				#10 start <= 1'b1;
				hdr_sop_hrst <= 1'b0;
				tx_word = 32'd0;
				tx_type = 4'h1;
				tx_num = 3'd0;
			end
			
			#10 start <= 1'b0;
			
			@(!busy)begin
				#30000 start <= 1'b0;
			end
			
			if(!busy)begin
				#10 start <= 1'b1;
				hdr_sop_hrst <= 1'b0;
				tx_word = 32'h3104_B12C;
				tx_type = 4'h2;
				tx_num = 3'd1;
			end
			
			#10 start <= 1'b0;
			
		end join
	end
	
endmodule
