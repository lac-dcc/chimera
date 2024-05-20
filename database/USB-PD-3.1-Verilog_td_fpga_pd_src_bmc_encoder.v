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

module bmc_encoder#(
	parameter system_khz = 30000
)(
	
	input	nrst,
	input	clock,
	input	enable,
	input	flush,
	
	input	data,
	output	rdy,
	output	bmc_q
);
	localparam divider_fac = (system_khz / (300 / 2) / 4);
	localparam	[9 : 0] divider = divider_fac - 1;
	
	reg		[9 : 0]		cken_cnt;
	reg					flop_en;
	reg					flop_parity;
	reg					data_q2_r;
	
	reg					rdy_r;
	reg					data_r;
	reg					bmc_qr;
	reg					bmc_qo;
	
	always@(posedge clock)begin
		if(!nrst)begin
			cken_cnt <= 10'd0;
			flop_parity <= 1'b0;
			flop_en <= 1'b0;
			rdy_r <= 1'b0;
		end else if(enable)begin
			if(cken_cnt >= divider)begin
				cken_cnt <= 10'd0;
				flop_en <= 1'b1;
				flop_parity <= ~flop_parity;
				rdy_r <= flop_parity;
			end else begin
				cken_cnt <= cken_cnt + 10'd1;
				flop_en <= 1'b0;
				rdy_r <= 1'b0;
			end
		end else begin
			cken_cnt <= 10'd0;
			flop_parity <= 1'b0;
			flop_en <= 1'b0;
			rdy_r <= 1'b0;
		end
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			data_r <= 1'b0;
			data_q2_r <= 1'b0;
		end else if(enable)begin
			if(flop_en & !flop_parity)begin
				data_r <= data;
				data_q2_r <= ~data_q2_r;
			end
		end else begin
			data_r <= 1'b0;
			data_q2_r <= 1'b0;
		end
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			bmc_qr <= 1'b0;
		end else if(enable)begin
			if(flop_en & flop_parity)begin
				bmc_qr <= bmc_qr ^ data_r;
			end
		end else begin
			bmc_qr <= 1'b0;
		end
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			bmc_qo <= 1'b1;
		end else if(enable)begin
			if(flush)
				bmc_qo <= 1'b0;
			else
				bmc_qo <= (data_q2_r ^ bmc_qr);
		end else begin
			bmc_qo <= 1'b1;
		end
	end
	
	assign bmc_q = bmc_qo;
	assign rdy = rdy_r;
	
endmodule
