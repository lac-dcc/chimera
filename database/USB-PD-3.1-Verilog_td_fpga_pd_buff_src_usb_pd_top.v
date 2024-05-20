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

module usb_pd_top#(
	parameter	[9 : 0]	volt_sel_50mv = 240
)(
	
	input	sys_clk,
	input	sys_nrst,
	
	// Differential capture for input
	// Biased @ VUSB_CC * 40%
	input	cc1_in,
	// input	cc1_in_p,
	// input	cc1_in_n,
	input	cc2_in,
	// input	cc2_in_p,
	// input	cc2_in_n,
	
	output	cc_oen,
	output	cc1_out,
	output	cc2_out,
	
	output	cc1_debug,
	output	cc2_debug
);
	
	wire		glb_clk;
	wire		glb_nrst;
	
	usb_pd_pll usb_pd_pll_u0(
		.clk0_out	(glb_clk),
		.extlock	(glb_nrst),
		
		.reset		(~sys_nrst),
		.refclk		(sys_clk)
	);
	
	reg		cc1_r;
	reg		cc2_r;
	reg		cc_oen_r;
	
	// reg		cc1_in_r;
	// reg		cc2_in_r;
	
	assign cc_oen = cc_oen_r;
	assign cc1_out = cc1_r;
	assign cc2_out = cc2_r;
	
	assign cc1_debug = cc1_in_r;
	assign cc2_debug = cc2_in_r;
	
	always@(posedge glb_clk or negedge glb_nrst)begin
		if(!glb_nrst)begin
			cc1_r <= 1'b1;
			cc2_r <= 1'b1;
			cc_oen_r <= 1'b0;
		end else begin
			cc1_r <= 1'b1;
			cc2_r <= 1'b1;
			cc_oen_r <= 1'b1;
		end
	end
	
	// always@(posedge glb_clk)begin
		// cc1_in_r <= cc1_in;
		// cc2_in_r <= cc2_in;
		assign cc1_in_r = cc1_in;
		assign cc2_in_r = cc2_in;
	// end
	
endmodule
