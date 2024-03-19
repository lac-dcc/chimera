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
 *  Sega Master System 1 board
 *  Thanks:
 *      org, andkorzh, HardWareMan (emu-russia):
 *          help & support.
 */

module sms_board
	(
	input MCLK,
	input ext_reset,
	input pause_button,
	input reset_button,
	
	// z80 ram
	output [12:0] ram_address,
	output [7:0] ram_data,
	output ram_wren,
	input [7:0] ram_o,
	
	// cart
	input [7:0] cart_data,
	input cart_data_en,
	output [15:0] cart_address,
	output cart_cs,
	output cart_oe,
	output cart_wr,
	output [7:0] cart_data_wr,
	output cart_exm1,
	output cart_exm2,
	output cart_csram,
	input pal,
	
	// bios
	input [7:0] bios_data,
	output [12:0] bios_address,
	
	// video
	output [7:0] vid_r, vid_g, vid_b,
	output vid_csync,
	
	// audio
	output [17:0] aud_l, aud_r,
	output [9:0] opll_mo, opll_ro,
	output [15:0] vdp_psg,
	
	// input
	input [6:0] port_a_i,
	output [6:0] port_a_o,
	output [6:0] port_a_d,
	input [6:0] port_b_i,
	output [6:0] port_b_o,
	output [6:0] port_b_d,
	
	// extra
	output vdp_hclk1
	);
	
	reg [2:0] clk_div = 3'h0;
	reg clk_val;
	
	reg [15:0]ADDRESS;
	reg [7:0]DATA;
	reg [15:0]AD;
	wire HL;
	wire RD;
	wire WR;
	wire IORQ;
	wire MREQ;
	wire CSYNC_pull;
	wire CSYNC = ~CSYNC_pull;
	wire [7:0] vdp_DATA_o;
	wire vdp_DATA_d;
	wire ZCLK;
	wire vdp_NMI;
	wire KBSEL;
	wire CSRAM;
	wire EXM1;
	wire EXM2;
	wire YS;
	wire [15:0] vdp_AD_o;
	wire vdp_AD_d;
	wire vdp_OE;
	wire vdp_WE0;
	wire vdp_WE1;
	wire vdp_CE;
	wire INT;
	wire [7:0] io_DATA_o;
	wire io_DATA_d;
	wire CE0;
	wire CE1;
	wire CE2;
	wire CE3;
	wire CE4;
	wire [15:0] z80_ADDRESS_o;
	wire z80_ADDRESS_d;
	wire [7:0] z80_DATA_o;
	wire z80_DATA_d;
	wire M1;
	wire z80_MREQ_o;
	wire z80_MREQ_d;
	wire z80_IORQ_o;
	wire z80_IORQ_d;
	wire z80_RD_o;
	wire z80_RD_d;
	wire z80_WR_o;
	wire z80_WR_d;
	reg o_vdp_CE;
	reg [12:0] vram_address;
	
	always @(posedge MCLK)
	begin
		clk_div <= clk_div == 3'h4 ? 3'h0 : (clk_div + 3'h1);
		clk_val <= clk_div <= 3'h2;
	end
	
	ym2602 vdp
		(
		.MCLK(MCLK),
		.XIN(clk_val),
		.RESET(~ext_reset),
		.AD_i(AD),
		.HL(HL),
		.PAL(pal),
		.RD(RD),
		.WR(WR),
		.IORQ(IORQ),
		.ADDRESS(ADDRESS),
		.CSYNC_i(CSYNC),
		.NMI_i(~pause_button),
		.MREQ(MREQ),
		.DATA_i(DATA),
		.DATA_o(vdp_DATA_o),
		.DATA_d(vdp_DATA_d),
		.ZCLK(ZCLK),
		.DAC_r(vid_r),
		.DAC_g(vid_g),
		.DAC_b(vid_b),
		.CSYNC_pull(CSYNC_pull),
		.NMI_o(vdp_NMI),
		.KBSEL(KBSEL),
		.CSRAM(CSRAM),
		.EXM1(EXM1),
		.EXM2(EXM2),
		.YS(YS),
		.AD_o(vdp_AD_o),
		.AD_d(vdp_AD_d),
		.OE(vdp_OE),
		.WE0(vdp_WE0),
		.WE1(vdp_WE1),
		.CE(vdp_CE),
		.INT(INT),
		.PSG(vdp_psg),
		.vdp_hclk1(vdp_hclk1)
		);
	
	assign vid_csync = CSYNC;

	ym2413 fm
		(
		.MCLK(MCLK),
		.XIN(ZCLK),
		.DATA_i(DATA),
		.CS(ADDRESS[7:1] != 7'h78 | IORQ),
		.WE(WR),
		.IC(~ext_reset),
		.A0(ADDRESS[0]),
		.RO(opll_ro),
		.MO(opll_mo)
		);
	
	sega315_5216 iochip
		(
		.MCLK(MCLK),
		.DATA_i(DATA),
		.ADDRESS(ADDRESS),
		.WR(WR),
		.RD(RD),
		.IORQ(IORQ),
		.MREQ(MREQ),
		.CONT1(~pause_button),
		.CONT2(1'h1), // FIXME
		.KILLGA(1'h0),
		.CSRAM(CSRAM),
		.RESET(~ext_reset),
		.PORT_A_i(port_a_i),
		.PORT_B_i(port_b_i),
		.DATA_o(io_DATA_o),
		.DATA_d(io_DATA_d),
		.CE0(CE0),
		.CE1(CE1),
		.CE2(CE2),
		.CE3(CE3),
		.CE4(CE4),
		.PORT_A_o(port_a_o),
		.PORT_A_d(port_a_d),
		.PORT_B_o(port_b_o),
		.PORT_B_d(port_b_d),
		.HL(HL)
		);
	
	z80cpu z80
		(
		.MCLK(MCLK),
		.CLK(ZCLK),
		.ADDRESS(z80_ADDRESS_o),
		.ADDRESS_z(z80_ADDRESS_d),
		.DATA_i(DATA),
		.DATA_o(z80_DATA_o),
		.DATA_z(z80_DATA_d),
		.M1(M1),
		.MREQ(z80_MREQ_o),
		.MREQ_z(z80_MREQ_d),
		.IORQ(z80_IORQ_o),
		.IORQ_z(z80_IORQ_d),
		.RD(z80_RD_o),
		.RD_z(z80_RD_d),
		.WR(z80_WR_o),
		.WR_z(z80_WR_d),
		.RFSH(),
		.HALT(),
		.WAIT(1'h1),
		.INT(INT),
		.NMI(vdp_NMI),
		.BUSRQ(1'h1),
		.BUSAK(),
		.RESET(~ext_reset)
		);

	assign cart_csram = ~CSRAM;
	assign cart_exm1 = ~EXM1;
	assign cart_exm2 = ~EXM2;
	assign cart_address = ADDRESS;
	assign cart_cs = ~CE3;
	assign cart_oe = ~RD;
	assign cart_wr = ~WR;
	assign cart_data_wr = DATA;
	
	assign ram_address = ADDRESS[12:0];
	assign ram_data = DATA;
	
	assign bios_address = ADDRESS[12:0];
	
	assign MREQ = z80_MREQ_d | z80_MREQ_o;
	assign WR = z80_WR_d | z80_WR_o;
	assign RD = z80_RD_d | z80_RD_o;
	assign IORQ = z80_IORQ_d | z80_IORQ_o;
	
	wire ram_oe = ~CE1 & ~RD;
	wire bios_oe = ~CE0 & ~EXM2;
	assign ram_wren = ~CE1 & ~WR;
	
	wire [15:0] vram_q;
	
	reg [1:0] audio_ctrl;
	
	always @(posedge MCLK)
	begin
		if (ext_reset)
			audio_ctrl <= 2'h0;
		else if (~IORQ & ~WR & ADDRESS[7:0] == 8'hf2)
			audio_ctrl <= DATA[1:0];
		
		if (~z80_DATA_d)
			DATA <= z80_DATA_o;
		else if (~vdp_DATA_d)
			DATA <= vdp_DATA_o;
		else if (~io_DATA_d)
			DATA <= io_DATA_o;
		else if (cart_data_en)
			DATA <= cart_data;
		else if (bios_oe)
			DATA <= bios_data;
		else if (ram_oe)
			DATA <= ram_o;
		else if (~IORQ & ~RD & ADDRESS[7:0] == 8'hf2)
			DATA <= { 7'h0, audio_ctrl[0] };
		
		if (~z80_ADDRESS_d)
			ADDRESS <= z80_ADDRESS_o;
		
		if (~vdp_AD_d)
			AD <= vdp_AD_o;
		else if (~vdp_CE & ~vdp_OE)
			AD <= vram_q;
		
		if (o_vdp_CE & ~vdp_CE)
			vram_address <= AD[12:0];
		
		o_vdp_CE <= vdp_CE;
	end
	
	vram vram
		(
		.address(vram_address),
		.clock(MCLK),
		.data(AD),
		.wren(~vdp_CE & (~vdp_WE0 | ~vdp_WE1)),
		.byteena({~vdp_WE1, ~vdp_WE0}),
		.q(vram_q)
		);
	
	assign aud_l = {2'h0,vdp_psg} + {opll_ro[9], opll_ro, 7'h0} + {opll_mo[9], opll_mo, 7'h0};
	assign aud_r = {2'h0,vdp_psg} + {opll_ro[9], opll_ro, 7'h0} + {opll_mo[9], opll_mo, 7'h0};
	
endmodule
