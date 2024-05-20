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


module tb_usb_pd_phy_rd;

	reg		clk;
	reg		nrst;
	reg		start;
	
	wire	bmc_dout;
	wire	busy;
	
	usb_pd_phy_wr#(
		.system_khz(200000)
	)sender(
		.nrst			(nrst),
		.clock			(clk),
		
		.hdr_sop_hrst	(1'b0),
		.start			(start),
		.busy			(busy),
		
		// send word #
		.send_num		(3'd6),
		// source capability
		.send_type		(4'b1),
		
		.send_word0		(32'h0801_912C), // ext_pwr, 5V, 3A
		.send_word1		(32'h0002_D12C), // 9V, 3A
		.send_word2		(32'h0003_C12C), // 12V, 3A
		.send_word3		(32'h0004_B12C), // 15V, 3A
		.send_word4		(32'h0006_4145), // 20V, 3.25A
		.send_word5		(32'hC8DC_2164), // APDO, prog psu, 22V to 3V3 100W
		.send_word6		(32'd0),
		
		.bmc_dout		(bmc_dout)
	);
	
	usb_pd_phy_rd#(
		.system_khz(200000)
	)DUT(
		.nrst		(nrst),
		.clock		(clk),
		.enable		(1'b1),
		
		.bmc_din	(bmc_dout)
	);
	
	always begin
		#2.5 clk = ~clk;
	end
	
	integer i = 0;
	
	initial begin
		fork begin
			
			#0 clk = 1'b0;
			nrst = 1'b0;
			start = 1'b0;
			
			#1000 nrst = 1'b1;
			
			#1532 start = 1'b1;
			
			#10 start = 1'b0;
			
			
		end join
	end
	
endmodule
