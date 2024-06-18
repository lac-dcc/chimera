// This program was cloned from: https://github.com/nukeykt/Nuked-SMS-FPGA
// License: GNU General Public License v2.0

/*
 * Copyright (C) 2023 nukeykt
 *
 * This file is part of Nuked-SMS.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 *  Sega 315-5216 emulator
 *  Thanks:
 *      Furrtek:
 *          Sega 315-5216 decap & die shot.
 *      org, andkorzh, HardWareMan (emu-russia):
 *          help & support.
 */

// 315-5216, fujitsu variant

module sega315_5216
	(
	input MCLK,
	input [7:0] DATA_i,
	input [15:0] ADDRESS,
	input WR,
	input RD,
	input IORQ,
	input MREQ,
	input CONT1,
	input CONT2,
	input KILLGA,
	input CSRAM,
	input RESET,
	input [6:0] PORT_A_i,
	input [6:0] PORT_B_i,
	output [7:0] DATA_o,
	output DATA_d,
	output CE0,
	output CE1,
	output CE2,
	output CE3,
	output CE4,
	output [6:0] PORT_A_o,
	output [6:0] PORT_A_d,
	output [6:0] PORT_B_o,
	output [6:0] PORT_B_d,
	output HL
	);
	
	wire reg_3e_2;
	wire reg_3e_3;
	wire reg_3e_4;
	wire reg_3e_5;
	wire reg_3e_6;
	wire reg_3e_7;
	
	wire reg_3f_0;
	wire reg_3f_1;
	wire reg_3f_2;
	wire reg_3f_3;
	wire reg_3f_4;
	wire reg_3f_5;
	wire reg_3f_6;
	wire reg_3f_7;

	wire iorq = KILLGA | IORQ;
	wire sel0 = iorq | ~(ADDRESS[6] & ADDRESS[7]);
	wire sel1 = iorq | ~(~ADDRESS[6] & ~ADDRESS[7]);
	wire port_read = ~(sel0 | RD);
	wire write0 = ~(sel1 | WR | ADDRESS[0]);
	wire write1 = ~(sel1 | WR | ~ADDRESS[0]);
	
	wire reset = RESET; // FIXME
	
	assign DATA_d = ~(port_read & ~reg_3e_2);
	
	wire [7:0] data = DATA_d ? DATA_i : DATA_o;
	
	fujitsu_dffr l_reg_3e_2(.MCLK(MCLK), .rst(reset), .inp(data[2]), .clk(write0), .val(reg_3e_2));
	fujitsu_dffr l_reg_3e_3(.MCLK(MCLK), .rst(reset), .inp(data[3]), .clk(write0), .val(reg_3e_3));
	fujitsu_dffr l_reg_3e_4(.MCLK(MCLK), .rst(reset), .inp(data[4]), .clk(write0), .val(reg_3e_4));
	fujitsu_dffs l_reg_3e_5(.MCLK(MCLK), .set(reset), .inp(data[5]), .clk(write0), .val(reg_3e_5));
	fujitsu_dffs l_reg_3e_6(.MCLK(MCLK), .set(reset), .inp(data[6]), .clk(write0), .val(reg_3e_6));
	fujitsu_dffs l_reg_3e_7(.MCLK(MCLK), .set(reset), .inp(data[7]), .clk(write0), .val(reg_3e_7));
	
	fujitsu_dffs l_reg_3f_0(.MCLK(MCLK), .set(reset), .inp(data[0]), .clk(write1), .val(reg_3f_0));
	fujitsu_dffs l_reg_3f_1(.MCLK(MCLK), .set(reset), .inp(data[1]), .clk(write1), .val(reg_3f_1));
	fujitsu_dffs l_reg_3f_2(.MCLK(MCLK), .set(reset), .inp(data[2]), .clk(write1), .val(reg_3f_2));
	fujitsu_dffs l_reg_3f_3(.MCLK(MCLK), .set(reset), .inp(data[3]), .clk(write1), .val(reg_3f_3));
	fujitsu_dffs l_reg_3f_4(.MCLK(MCLK), .set(reset), .inp(data[4]), .clk(write1), .val(reg_3f_4));
	fujitsu_dffs l_reg_3f_5(.MCLK(MCLK), .set(reset), .inp(data[5]), .clk(write1), .val(reg_3f_5));
	fujitsu_dffs l_reg_3f_6(.MCLK(MCLK), .set(reset), .inp(data[6]), .clk(write1), .val(reg_3f_6));
	fujitsu_dffs l_reg_3f_7(.MCLK(MCLK), .set(reset), .inp(data[7]), .clk(write1), .val(reg_3f_7));
	
	assign PORT_A_d = { reg_3f_1, reg_3f_0, 1'h1, 4'hf };
	assign PORT_B_d = { reg_3f_3, reg_3f_2, 1'h1, 4'hf };
	
	assign PORT_A_o = {
		reg_3f_1 ? PORT_A_i[6] : reg_3f_5,
		reg_3f_0 ? PORT_A_i[5] : reg_3f_4,
		1'h0,
		4'h0 };
	
	assign PORT_B_o = {
		reg_3f_3 ? PORT_B_i[6] : reg_3f_7,
		reg_3f_2 ? PORT_B_i[5] : reg_3f_6,
		1'h0,
		4'h0 };
	
	assign DATA_o = {
		ADDRESS[0] ? PORT_B_o[6] : PORT_B_i[1],
		ADDRESS[0] ? PORT_A_o[6] : PORT_B_i[0],
		ADDRESS[0] ? CONT1 : PORT_A_o[5],
		ADDRESS[0] ? CONT2 : PORT_A_i[4],
		ADDRESS[0] ? PORT_B_o[5] : PORT_A_i[3],
		ADDRESS[0] ? PORT_B_i[4] : PORT_A_i[2],
		ADDRESS[0] ? PORT_B_i[3] : PORT_A_i[1],
		ADDRESS[0] ? PORT_B_i[2] : PORT_A_i[0]
		};
	
	wire port_a_irq = ~PORT_A_o[6] & reg_3f_1;
	wire port_b_irq = ~PORT_B_o[6] & reg_3f_3;
	
	assign HL = ~(port_a_irq | port_b_irq);
	
	assign CE0 = MREQ | reg_3e_3;
	assign CE1 = CSRAM | reg_3e_4;
	assign CE2 = MREQ | reg_3e_5;
	assign CE3 = MREQ | reg_3e_6;
	assign CE4 = MREQ | reg_3e_7;
	
endmodule


module fujitsu_dffs(
	input MCLK,
	input set,
	input inp,
	input clk,
	output val
	);
	
	reg mem1, mem2;
	
	assign val = mem2;
	
	always @(posedge MCLK)
	begin
		if (~set)
		begin
			mem1 <= 1'h1;
			mem2 <= 1'h1;
		end
		else
		begin
			if (!clk)
				mem1 <= inp;
			else
				mem2 <= mem1;
		end
	end

endmodule


module fujitsu_dffr(
	input MCLK,
	input rst,
	input inp,
	input clk,
	output val
	);
	
	reg mem1, mem2;
	
	assign val = mem2;
	
	always @(posedge MCLK)
	begin
		if (~rst)
		begin
			mem1 <= 1'h0;
			mem2 <= 1'h0;
		end
		else
		begin
			if (!clk)
				mem1 <= inp;
			else
				mem2 <= mem1;
		end
	end

endmodule
