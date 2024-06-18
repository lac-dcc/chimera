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


module tb_usb_pd_top;

	reg		start;
	
	reg		clk;
	reg		nrst;
	
	reg		cc1_io;
	wire	cc1_dout;
	reg		cc2_io;
	reg		cc2_dout;
	
	wire	cc1;
	wire	cc2;
	
	wire	busy;
	
	reg		cc_dummy;
	
	assign cc1 = (cc1_io) ? cc1_dout : cc_dummy;
	assign cc2 = (cc2_io) ? cc2_dout : 1'b0;
	
	usb_pd_top DUT(
		.sys_nrst	(nrst),
		.sys_clk	(clk),
		
		.usb_pd_cc1	(cc1),
		.usb_pd_cc2	(cc2)
	);
	
	reg		[2 : 0]	send_id;
	reg		[2 : 0]	send_num;
	reg		[3 : 0]	send_type;
	
	usb_pd_phy_wr#(
		.system_khz(100000)
	)sender(
		.nrst			(nrst),
		.clock			(clk),
		
		.hdr_sop_hrst	(1'b0),
		.start			(start),
		.busy			(busy),
		
		// send word #
		.send_num		(send_num),
		// source capability
		.send_type		(send_type),
		.send_id		(send_id),
		
		.send_word0		(32'h0801_912C), // ext_pwr, 5V, 3A
		.send_word1		(32'h0002_D12C), // 9V, 3A
		.send_word2		(32'h0003_C12C), // 12V, 3A
		.send_word3		(32'h0004_B12C), // 15V, 3A
		.send_word4		(32'h0006_4145), // 20V, 3.25A
		.send_word5		(32'hC8DC_2164), // APDO, prog psu, 22V to 3V3 100W
		.send_word6		(32'd0),
		
		.bmc_dout		(cc1_dout)
	);
	
	always begin
		#5.0 clk = ~clk;
	end
	
	initial begin
		fork begin
			
			#0 clk = 1'b0;
			nrst = 1'b0;
			start = 1'b0;
			cc1_io = 1'b0;
			cc2_io = 1'b0;
			cc2_dout = 1'b0;
			cc_dummy = 1'b1;
			send_num = 3'd6;
			send_type = 4'd1;
			send_id = 3'd0;
			
			#1000 nrst <= 1'b1;
			
			#1234 cc1_io = 1'b0;
			
			#10000 start <= 1'b1;
			cc1_io = 1'b1;
			
			#10 start <= 1'b0;
			#100 start <= 1'b0;
			
			@(!busy)
				#10 cc1_io = 1'b0;
				cc_dummy = 1'bz;
			
			#1530000 send_num = 3'd0;
			cc_dummy = 1'b1;
			
			#10000 start <= 1'b1;
			cc1_io = 1'b1;
			
			#10 start <= 1'b0;
			
			#1530000 send_num = 3'd0;
			send_type = 4'd3;
			send_id = 3'd1;
			
			#10000 start <= 1'b1;
			cc1_io = 1'b1;
			
			#10 start <= 1'b0;
			#100 start <= 1'b0;
			
			@(!busy)
				#10 cc1_io = 1'b0;
				cc_dummy = 1'bz;
			
			
		end join
	end
	
endmodule
