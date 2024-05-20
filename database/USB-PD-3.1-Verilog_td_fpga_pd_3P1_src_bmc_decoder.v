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

module bmc_decoder#(
	parameter system_khz = 30000
)(
	
	input	nrst,
	input	clock,
	input	enable,
	
	input	bmc_in,
	output	rdy,
	output	ps,
	output	bmc_q
);
	localparam divider_fac = system_khz / 300;
	localparam	[11 : 0] divider = divider_fac - 1;
	localparam	[11 : 0] pre_trigger = (divider_fac * 2 / 8) - 1;
	localparam	[11 : 0] pos_trigger = (divider_fac * 55 / 80) - 1;
	localparam	[11 : 0] data_latch = (divider_fac * 57 / 80) - 1;
	localparam	[11 : 0] ov_cnt = (divider_fac * 12 / 8) - 1;
	
	reg		[11 : 0]	cken_cnt;
	
	reg					bit_in;
	reg		[2 : 0]		bit_cdc;
	
	reg					packet_start;
	reg					rdy_r;
	
	reg					pre_bit;
	reg					pos_bit;
	reg					bmc_qo;
	
	// ================================================
	// CDC
	// ================================================
	always@(posedge clock)begin
		bit_in <= bmc_in;
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			bit_cdc <= 2'b00;
		end else if(enable)begin
			bit_cdc <= {bit_cdc[1 : 0], bit_in};
		end
	end
	// ================================================
	
	always@(posedge clock)begin
		if(!nrst)begin
			packet_start <= 1'b0;
		end else begin
			if(bit_cdc[2] & !bit_cdc[1] & !packet_start)
				packet_start <= 1'b1;
			else if(cken_cnt >= ov_cnt)
				packet_start <= 1'b0;
		end
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			rdy_r <= 1'b0;
		end else if(packet_start)begin
			if(cken_cnt == data_latch)
				rdy_r <= 1'b1;
			else
				rdy_r <= 1'b0;
		end else begin
			rdy_r <= 1'b0;
		end
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			cken_cnt <= 12'd0;
		end else if(packet_start)begin
			if( (bit_cdc[2] ^ bit_cdc[1]) && cken_cnt >= pos_trigger)begin
				cken_cnt <= 12'd0;
			end else begin
				cken_cnt <= cken_cnt + 12'd1;
			end
		end else begin
			cken_cnt <= 12'd0;
		end
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			pre_bit <= 1'b0;
			pos_bit <= 1'b0;
		end else if(packet_start)begin
			if(cken_cnt == pre_trigger)
				pre_bit <= bit_cdc[2];
			
			if(cken_cnt == pos_trigger)
				pos_bit <= bit_cdc[2];
		end else begin
			pre_bit <= 1'b0;
			pos_bit <= 1'b0;
		end
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			bmc_qo <= 1'b0;
		end else if(packet_start)begin
			if(cken_cnt == data_latch)
				bmc_qo <= pre_bit ^ pos_bit;
		end else begin
			bmc_qo <= 1'b0;
		end
	end
	
	assign bmc_q = bmc_qo;
	assign ps = packet_start;
	assign rdy = rdy_r;
	
endmodule
