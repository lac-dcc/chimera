// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014,2015,2016,2019
//
// top-level

/*
    This file is part of ZX-Evo Base Configuration firmware.

    ZX-Evo Base Configuration firmware is free software:
    you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ZX-Evo Base Configuration firmware is distributed in the hope that
    it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ZX-Evo Base Configuration firmware.
    If not, see <http://www.gnu.org/licenses/>.
*/

`include "tune.v"

module top(

	// clocks
	input fclk,
	output clkz_out,
	input clkz_in,

	// z80
	input iorq_n,
	input mreq_n,
	input rd_n,
	input wr_n,
	input m1_n,
	input rfsh_n,
	output int_n,
	output nmi_n,
	output wait_n,
	output res,

	inout [7:0] d,
	input [15:0] a,

	// zxbus and related
	output csrom,
	output romoe_n,
	output romwe_n,

	output rompg0_n,
	output dos_n, // aka rompg1
	output rompg2,
	output rompg3,
	output rompg4,

	input iorqge1,
	input iorqge2,
	output iorq1_n,
	output iorq2_n,

	// DRAM
	inout [15:0] rd,
	output [9:0] ra,
	output rwe_n,
	output rucas_n,
	output rlcas_n,
	output rras0_n,
	output rras1_n,

	// video
	output [1:0] vred,
	output [1:0] vgrn,
	output [1:0] vblu,

	output vhsync,
	output vvsync,
	output vcsync,

	// AY control and audio/tape
	output ay_clk,
	output ay_bdir,
	output ay_bc1,

	output beep,

	// IDE
	output [2:0] ide_a,
`ifdef IDE_VDAC
	output [15:0] ide_d,
`elsif IDE_VDAC2
	output [15:0] ide_d,
`else
	inout [15:0] ide_d,
`endif

	output ide_dir,

	input ide_rdy,

	output ide_cs0_n,
	output ide_cs1_n,
	output ide_rs_n,
	output ide_rd_n,
	output ide_wr_n,

	// VG93 and diskdrive
	output vg_clk,

	output vg_cs_n,
	output vg_res_n,

	output vg_hrdy,
	output vg_rclk,
	output vg_rawr,
	output [1:0] vg_a, // disk drive selection
	output vg_wrd,
	output vg_side,

	input step,
	input vg_sl,
	input vg_sr,
	input vg_tr43,
	input rdat_b_n,
	input vg_wf_de,
	input vg_drq,
	input vg_irq,
	input vg_wd,

	// serial links (atmega-fpga, sdcard)
	output sdcs_n,
	output sddo,
	output sdclk,
	input sddi,

	input spics_n,
	input spick,
	input spido,
	output spidi,
	output spiint_n
);

    wire [4:0] red;
    wire [4:0] grn;
    wire [4:0] blu;

    assign vred = red[4:3];
    assign vgrn = grn[4:3];
    assign vblu = blu[4:3];

	wire dos;

	wire zclk; // z80 clock for short

	wire zpos,zneg;

	wire rst_n; // global reset

	wire rrdy;
	wire [15:0] rddata;

	wire [4:0] rompg;

	wire [7:0] zports_dout;
	wire zports_dataout;
	wire porthit;

	wire csrom_int;


	wire [39:0] kbd_data;
	wire [ 7:0] mus_data;
	wire kbd_stb,mus_xstb,mus_ystb,mus_btnstb,kj_stb;

	wire [ 4:0] kbd_port_data;
`ifdef KEMPSTON_8BIT
	wire [ 7:0] kj_port_data;
`else
    wire [ 4:0] kj_port_data;
`endif
	wire [ 7:0] mus_port_data;

	wire [7:0] wait_read,wait_write;
	wire wait_rnw;
	wire wait_start_gluclock;
	wire wait_start_comport;
	wire wait_end;
	wire [7:0] gluclock_addr;
	wire [7:0] comport_addr;
	wire [6:0] waits;




	// config signals
	wire [7:0] not_used0;
	wire [7:0] not_used1;
	wire cfg_vga_on;
	//
	wire [1:0] modes_raster;
	wire       mode_contend_type = 1'b0; // 48/128/+2 or +2a/+3 TODO: take these signals from somewhere
	wire       mode_contend_ena  = 1'b1; // contention enable
	wire       contend;
	//
	wire [3:0] fdd_mask;

	// nmi signals
	wire gen_nmi;
	wire clr_nmi;
	wire in_nmi;
	wire in_trdemu;
	wire trdemu_wr_disable;
	wire [1:0] set_nmi;
	wire imm_nmi;
	wire nmi_buf_clr;

	// breakpoint signals
	wire brk_ena;
	wire [15:0] brk_addr;


	wire tape_in;

	wire [15:0] ideout;
	wire [15:0] idein;
	wire idedataout;


	wire [7:0] zmem_dout;
	wire zmem_dataout;



	reg [3:0] ayclk_gen;


	wire [7:0] received;
	wire [7:0] tobesent;


	wire intrq,drq;
	wire vg_wrFF_fclk;
	wire vg_rdwr_fclk;
	wire [1:0] vg_ddrv;


	wire        up_ena;
	wire [ 5:0] up_paladdr;
	wire [ 7:0] up_paldata;
	wire        up_palwr;




	assign zclk = clkz_in;


	// RESETTER
	wire genrst;

	resetter myrst( .clk(fclk),
	                .rst_in_n(~genrst),
	                .rst_out_n(rst_n) );
	defparam myrst.RST_CNT_SIZE = 6;



	assign nmi_n=gen_nmi ? 1'b0 : 1'bZ;

	assign res= ~rst_n;


    assign idein = ide_d;

`ifdef IDE_HDD
	assign ide_rs_n = rst_n;
	assign ide_d = idedataout ? ideout : 16'hZZZZ;
	assign ide_dir = ~idedataout;
`elsif IDE_VDAC
	assign ide_rs_n = rst_n;
  assign ide_d[ 4: 0] = red;
  assign ide_d[ 9: 5] = grn;
  assign ide_d[14:10] = blu;
  assign ide_d[15] = 1'b1;    // always 0-31 luma scale
  assign ide_dir = 1'b0;      // always output
  assign ide_a[1] = !fclk;
  assign ide_a[2] = vhsync;
  assign ide_cs1_n = vvsync;
  assign ide_rd_n = 1'b0;
  assign ide_wr_n = 1'b0;
`elsif IDE_VDAC2
  wire ftcs_n;
  wire [4:0] vred_raw = red;
  wire [4:0] vgrn_raw = grn;
  wire [4:0] vblu_raw = blu;
  assign ide_d[ 0] = vgrn_raw[2];
  assign ide_d[ 1] = vred_raw[0];
  assign ide_d[ 2] = vred_raw[1];
  assign ide_d[ 3] = vred_raw[2];
  assign ide_d[ 4] = vred_raw[3];
  assign ide_d[ 5] = vred_raw[4];
  assign ide_d[ 6] = vgrn_raw[0];
  assign ide_d[ 7] = vgrn_raw[1];
  assign ide_d[ 8] = vgrn_raw[3];
  assign ide_d[ 9] = vgrn_raw[4];
  assign ide_d[10] = vblu_raw[0];
  assign ide_d[11] = vblu_raw[1];
  assign ide_d[12] = vblu_raw[2];
  assign ide_d[13] = vblu_raw[3];
  assign ide_d[14] = vblu_raw[4];
  assign ide_d[15] = 1'b1;    // always 0-31 luma scale
  assign ide_rs_n = vgrn_raw[2]; // for lame RevA
  assign ide_dir = 1'b0;      // always output
  assign ide_a[0] = 1'b0;  // FT812 SCK
  assign ide_a[1] = 1'b0;  // FT812 MOSI
  assign ide_a[2] = !fclk;
  assign ide_rd_n = 1'b1; // FT812 CS_n
  assign ide_wr_n = 1'b0;
  assign ide_cs0_n = vhsync;
  assign ide_cs1_n = vvsync;
`endif

	wire [7:0] peff7;
	wire [7:0] p7ffd;


	wire romrw_en;
	wire cpm_n;
	wire fnt_wr;



	wire cpu_req,cpu_rnw,cpu_wrbsel,cpu_strobe;
	wire [20:0] cpu_addr;
	wire [15:0] cpu_rddata;
	wire [7:0] cpu_wrdata;

	wire cbeg,post_cbeg,pre_cend,cend;

	wire go;


	// AVR SDcard control
	wire       avr_lock_claim,
	           avr_lock_grant,
	           avr_sdcs_n,
	           avr_sd_start;
     	wire [7:0] avr_sd_datain;
	wire [7:0] avr_sd_dataout;

	// ZX SDcard control
	wire       zx_sdcs_n_val,
	           zx_sdcs_n_stb,
	           zx_sd_start;
	wire [7:0] zx_sd_datain;
	wire [7:0] zx_sd_dataout;


	wire tape_read; // data for tapein

	wire beeper_mux; // what is mixed to FPGA beeper output - beeper (0) or tapeout (1)

	wire [2:0] atm_scr_mode;

	wire atm_turbo;


	wire beeper_wr, covox_wr;



	wire [5:0] palcolor; // palette readback




	wire [1:0] int_turbo;
	wire cpu_next;
	wire cpu_stall;

	wire external_port;



//AY control
	always @(posedge fclk)
	begin
		ayclk_gen <= ayclk_gen + 4'd1;
	end

	assign ay_clk = ayclk_gen[3];





	// fix ATM2-style ROM addressing for PENT-like ROM layout.
	// this causes compications when writing to the flashROM from Z80
	// and need to split and re-build old ATM romfiles before burning in
	// flash
//	wire [1:0] adr_fix;
//	assign adr_fix = ~{ rompg[0], rompg[1] };
//	assign rompg0_n = ~adr_fix[0];
//	assign dos_n    =  adr_fix[1];
//	assign rompg2   =  1'b0;//rompg[2];
//	assign rompg3   =  1'b0;//rompg[3];
//	assign rompg4   =  1'b0;//rompg[4];

	assign rompg0_n = ~rompg[0];
	assign dos_n    =  rompg[1];
	assign rompg2   =  rompg[2];
	assign rompg3   =  rompg[3];
	assign rompg4   =  rompg[4];

	wire [3:0] zclk_stall;

	zclock zclock
	(
		.fclk (fclk ),
		.zclk (zclk ),
		.rst_n(rst_n),

		.a(a),

		.mreq_n(mreq_n),
		.iorq_n(iorq_n),
		.m1_n  (m1_n  ),
		.rfsh_n(rfsh_n),

		.modes_raster     (modes_raster     ),
		.mode_contend_type(mode_contend_type),
		.mode_contend_ena (mode_contend_ena ),
		.mode_7ffd_bits   (p7ffd[2:0]       ),
		.contend          (contend          ),

		.zclk_out(clkz_out),

		.zpos(zpos),
		.zneg(zneg),


		.pre_cend(pre_cend),
		.cbeg    (cbeg    ),

		.zclk_stall( cpu_stall | (|zclk_stall) ),
		.turbo     ( {atm_turbo,~(peff7[4])}   ),
		.int_turbo (int_turbo                  ),
		
		.external_port(external_port)
	);



	wire [7:0] dout_ram;
	wire ena_ram;
	wire [7:0] dout_ports;
	wire ena_ports;


	wire [3:0] border;

	wire drive_ff;
	wire drive_00;


	wire       atm_palwr;
	wire [5:0] atm_paldata;
	wire [5:0] atm_paldatalow;
	wire pal444_ena;

	wire [7:0] fontrom_readback;




	wire int_start;



	// data bus out: either RAM data or internal ports data or 0xFF with unused ports
//	assign d = ena_ram ? dout_ram : ( ena_ports ? dout_ports : ( (drive_ff|drive_00) ? {8{drive_ff}} : 8'bZZZZZZZZ ) );

	wire [7:0] d_pre_out;
	wire d_ena;

	assign d_pre_out = ({8{ena_ram&(~drive_00)}} & dout_ram) | ({8{ena_ports}} & dout_ports) | {8{drive_ff}} ;
	assign d_ena = (ena_ram|ena_ports|drive_ff|drive_00);
	//
	assign d = d_ena ? d_pre_out : 8'bZZZZ_ZZZZ;
	//
	assign csrom = csrom_int && !drive_00;


	zbus zxbus( .iorq_n(iorq_n), .rd_n(rd_n), .wr_n(wr_n), .m1_n(m1_n),
	            .iorq1_n(iorq1_n), .iorq2_n(iorq2_n), .iorqge1(iorqge1), .iorqge2(iorqge2),
	            .porthit(porthit), .drive_ff(drive_ff) );




	/////////////////////////////////////
	// ATM memory pagers instantiation //
	/////////////////////////////////////

	wire pager_off;

	wire        pent1m_ROM;
	wire [ 5:0] pent1m_page;
	wire        pent1m_ram0_0;
	wire        pent1m_1m_on;

	wire atmF7_wr_fclk;

	wire [3:0] dos_turn_off,
	           dos_turn_on;

	wire [ 7:0] page [0:3];
	wire [ 3:0] romnram;
	wire [ 3:0] wrdisable;

	// for reading back data via xxBE port
	wire [ 7:0] rd_pages [0:7];
	wire [ 7:0] rd_ramnrom;
	wire [ 7:0] rd_dos7ffd;
	wire [ 7:0] rd_wrdisables;

	generate

		genvar i;

		for(i=0;i<4;i=i+1)
		begin : instantiate_atm_pagers
			atm_pager #( .ADDR(i) ) atm_pager
			(
				.rst_n(rst_n),
				.fclk (fclk),
				.zpos (zpos),
				.zneg (zneg),
                                
				.za(a),
				.zd(d),
				.mreq_n(mreq_n),
				.rd_n  (rd_n),
				.m1_n  (m1_n),
                                
				.pager_off(pager_off),
                                
				.pent1m_ROM   (pent1m_ROM),
				.pent1m_page  (pent1m_page),
				.pent1m_ram0_0(pent1m_ram0_0),
				.pent1m_1m_on (pent1m_1m_on),
                                
                                
				.in_nmi   (in_nmi   ),
				.in_trdemu(in_trdemu),
				
				.trdemu_wr_disable(trdemu_wr_disable), 
                                
				.atmF7_wr(atmF7_wr_fclk),
                                
				.dos(dos),
                                
				.dos_turn_on (dos_turn_on[i]),
				.dos_turn_off(dos_turn_off[i]),
                                
				.zclk_stall(zclk_stall[i]),
                                
				.page     (page[i]     ),
				.romnram  (romnram[i]  ),
                        	.wrdisable(wrdisable[i]),
                                
				.rd_page0  (rd_pages[i  ]),
				.rd_page1  (rd_pages[i+4]),
                                
				.rd_ramnrom   ( {rd_ramnrom   [i+4], rd_ramnrom   [i]} ),
				.rd_dos7ffd   ( {rd_dos7ffd   [i+4], rd_dos7ffd   [i]} ),
				.rd_wrdisables( {rd_wrdisables[i+4], rd_wrdisables[i]} )
			);

		end

	endgenerate


	///////////////////////////
	// DOS signal controller //
	///////////////////////////

	zdos zdos( .rst_n(rst_n),

	           .fclk(fclk),

	           .dos_turn_on ( |dos_turn_on  ),
	           .dos_turn_off( |dos_turn_off ),

	           .cpm_n(cpm_n),

	           .dos(dos),

	           .zpos(zpos),
	           .m1_n(m1_n),


	           .trdemu_wr_disable(trdemu_wr_disable),

	           .in_trdemu   (in_trdemu   ),
	           .clr_nmi     (clr_nmi     ),
	           .vg_rdwr_fclk(vg_rdwr_fclk),
	           .fdd_mask    (fdd_mask    ),
	           .vg_a        (vg_ddrv     ),
	           .romnram     (romnram[0]  )
	         );




	///////////////////////////
	// Z80 memory controller //
	///////////////////////////

	zmem z80mem
	(
		.fclk (fclk ),
		.rst_n(rst_n),
		
		.zpos(zpos),
		.zneg(zneg),

		.cbeg     (cbeg     ),
		.post_cbeg(post_cbeg),
		.pre_cend (pre_cend ),
		.cend     (cend     ),
		
		.za    (a       ),
		.zd_in (d       ),
		.zd_out(dout_ram), 
		.zd_ena(ena_ram ), 
		.m1_n  (m1_n    ),
		.rfsh_n(rfsh_n  ), 
		.iorq_n(iorq_n  ), 
		.mreq_n(mreq_n  ),
		.rd_n  (rd_n    ), 
		.wr_n  (wr_n    ),

		.win0_romnram(romnram[0]),
		.win1_romnram(romnram[1]),
		.win2_romnram(romnram[2]),
		.win3_romnram(romnram[3]),

		.win0_page(page[0]),
		.win1_page(page[1]),
		.win2_page(page[2]),
		.win3_page(page[3]),

		.win0_wrdisable(wrdisable[0]),
		.win1_wrdisable(wrdisable[1]),
		.win2_wrdisable(wrdisable[2]),
		.win3_wrdisable(wrdisable[3]),

		.romrw_en(romrw_en),

		.rompg  (rompg  ),
		.romoe_n(romoe_n),
		.romwe_n(romwe_n),
		.csrom  (csrom_int),

		.cpu_req   (cpu_req   ),
		.cpu_rnw   (cpu_rnw   ),
		.cpu_wrbsel(cpu_wrbsel),
		.cpu_strobe(cpu_strobe),
		.cpu_addr  (cpu_addr  ),
		.cpu_wrdata(cpu_wrdata),
		.cpu_rddata(cpu_rddata),
		.cpu_stall (cpu_stall ),
		.cpu_next  (cpu_next  ),

		.int_turbo(int_turbo),
		.nmi_buf_clr(nmi_buf_clr)
	);




	wire [20:0] daddr;
	wire dreq;
	wire drnw;
	wire [15:0] drddata;
	wire [15:0] dwrdata;
	wire [1:0] dbsel;




	dram dram( .clk(fclk),
	           .rst_n(rst_n),

	           .addr(daddr),
	           .req(dreq),
	           .rnw(drnw),
	           .cbeg(cbeg),
	           .rrdy(drrdy),
	           .rddata(drddata),
	           .wrdata(dwrdata),
	           .bsel(dbsel),

	           .ra(ra),
	           .rd(rd),
	           .rwe_n(rwe_n),
	           .rucas_n(rucas_n),
	           .rlcas_n(rlcas_n),
	           .rras0_n(rras0_n),
	           .rras1_n(rras1_n)
	         );


	wire [1:0] bw;

	wire [20:0] video_addr;
	wire [15:0] video_data;
	wire video_strobe;
	wire video_next;

	arbiter dramarb( .clk(fclk),
	                 .rst_n(rst_n),

	                 .dram_addr(daddr),
	                 .dram_req(dreq),
	                 .dram_rnw(drnw),
	                 .dram_cbeg(cbeg),
	                 .dram_rrdy(drrdy),
	                 .dram_bsel(dbsel),
	                 .dram_rddata(drddata),
	                 .dram_wrdata(dwrdata),

	                 .post_cbeg(post_cbeg),
	                 .pre_cend (pre_cend ),
	                 .cend     (cend     ),

	                 .go(go),
	                 .bw(bw),

	                 .video_addr(video_addr),
	                 .video_data(video_data),
	                 .video_strobe(video_strobe),
	                 .video_next(video_next),

	                 //.cpu_waitcyc(cpu_waitcyc),
			 .cpu_next (cpu_next),
	                 .cpu_req(cpu_req),
	                 .cpu_rnw(cpu_rnw),
	                 .cpu_addr(cpu_addr),
	                 .cpu_wrbsel(cpu_wrbsel),
	                 .cpu_wrdata(cpu_wrdata),
	                 .cpu_rddata(cpu_rddata),
	                 .cpu_strobe(cpu_strobe) );

	video_top video_top
	(
		.clk(fclk),

		.vred(red),
		.vgrn(grn),
		.vblu(blu),
		.vhsync(vhsync),
		.vvsync(vvsync),
		.vcsync(vcsync),

		.zxborder(border),

		.pent_vmode( {peff7[0],peff7[5]} ),
		.atm_vmode (atm_scr_mode),

		.scr_page(p7ffd[3]),

		.vga_on(cfg_vga_on),

		.modes_raster     (modes_raster     ),
		.mode_contend_type(mode_contend_type),
		
		.contend(contend),

		.cbeg     (cbeg     ),
		.post_cbeg(post_cbeg),
		.pre_cend (pre_cend ),
		.cend     (cend     ),

		.video_go    (go          ),
		.video_bw    (bw          ),
		.video_addr  (video_addr  ),
		.video_data  (video_data  ),
		.video_strobe(video_strobe),
		.video_next  (video_next  ),

		.atm_palwr  (atm_palwr  ),
		.atm_paldata(atm_paldata),
		.atm_paldatalow(atm_paldatalow),
		.pal444_ena(pal444_ena),
		
		.up_ena    (up_ena    ),
		.up_paladdr(up_paladdr),
		.up_paldata(up_paldata),
		.up_palwr  (up_palwr  ),

		.int_start(int_start),

		.fnt_a (a[10:0]),
		.fnt_d (d      ),
		.fnt_wr(fnt_wr ),

		.palcolor(palcolor),

		.fontrom_readback(fontrom_readback)
	);


	slavespi slavespi(
		.fclk(fclk), .rst_n(rst_n),

		.spics_n(spics_n), .spidi(spidi),
		.spido(spido), .spick(spick),
		.status_in({/* wait_rnw */ wr_n, waits[6:0]}), .genrst(genrst),
		.kbd_out(kbd_data),
		.kbd_stb(kbd_stb), .mus_out(mus_data),
		.mus_xstb(mus_xstb), .mus_ystb(mus_ystb),
		.mus_btnstb(mus_btnstb), .kj_stb(kj_stb),
		.gluclock_addr(gluclock_addr),
		.comport_addr (comport_addr),
		.wait_write(wait_write),
		.wait_read(wait_read),
		.wait_rnw(wait_rnw),
		.wait_end(wait_end),
		.config0( {not_used0[7:6], modes_raster, beeper_mux, tape_read, set_nmi[0], cfg_vga_on} ),

		.sd_lock_out(avr_lock_claim),
		.sd_lock_in (avr_lock_grant),
		.sd_cs_n    (avr_sdcs_n    ),
		.sd_start   (avr_sd_start  ),
		.sd_datain  (avr_sd_datain ),
		.sd_dataout (avr_sd_dataout)
	);

	zkbdmus zkbdmus( .fclk(fclk), .rst_n(rst_n),
	                 .kbd_in(kbd_data), .kbd_stb(kbd_stb),
	                 .mus_in(mus_data), .mus_xstb(mus_xstb),
	                 .mus_ystb(mus_ystb), .mus_btnstb(mus_btnstb),
	                 .kj_stb(kj_stb), .kj_data(kj_port_data),
	                 .zah(a[15:8]), .kbd_data(kbd_port_data),
	                 .mus_data(mus_port_data)
	               );


	zports zports( .zclk(zclk), .fclk(fclk), .rst_n(rst_n), .zpos(zpos), .zneg(zneg),
	               .din(d), .dout(dout_ports), .dataout(ena_ports),
	               .a(a), .iorq_n(iorq_n), .rd_n(rd_n), .wr_n(wr_n), .porthit(porthit),
	               .ay_bdir(ay_bdir), .ay_bc1(ay_bc1), .border(border),
	               .p7ffd(p7ffd), .peff7(peff7), .mreq_n(mreq_n), .m1_n(m1_n), .dos(dos),

	               .vg_cs_n     (vg_cs_n     ),
	               .vg_intrq    (intrq       ),
	               .vg_drq      (drq         ),
	               .vg_wrFF_fclk(vg_wrFF_fclk),
	               .vg_rdwr_fclk(vg_rdwr_fclk),
	               .vg_a        (vg_ddrv     ),
	               .vg_res_n    (vg_res_n    ),
	               .vg_hrdy     (vg_hrdy     ),
	               .vg_side     (vg_side     ),

			

	               .idein(idein), .ideout(ideout), .idedataout(idedataout),
`ifdef IDE_HDD
	               .ide_a(ide_a), .ide_cs0_n(ide_cs0_n), .ide_cs1_n(ide_cs1_n),
	               .ide_wr_n(ide_wr_n), .ide_rd_n(ide_rd_n),
`endif

		       .sd_cs_n_val(zx_sdcs_n_val),
		       .sd_cs_n_stb(zx_sdcs_n_stb),
		       .sd_start   (zx_sd_start  ),
		       .sd_datain  (zx_sd_datain ),
		       .sd_dataout (zx_sd_dataout),

	               .keys_in(kbd_port_data),
	               .mus_in (mus_port_data),
	               .kj_in  (kj_port_data ),

	               .tape_read(tape_read),

	               .gluclock_addr(gluclock_addr),
	               .comport_addr (comport_addr ),
	               .wait_start_gluclock(wait_start_gluclock),
	               .wait_start_comport (wait_start_comport ),
	               .wait_rnw  (wait_rnw  ),
	               .wait_write(wait_write),
	               .wait_read (wait_read ),
		
		.atmF7_wr_fclk(atmF7_wr_fclk),

		.atm_scr_mode(atm_scr_mode),
		.atm_turbo   (atm_turbo),
		.atm_pen     (pager_off),
		.atm_cpm_n   (cpm_n),
		.atm_pen2    (atm_pen2),

		.romrw_en(romrw_en),

		.pent1m_ram0_0(pent1m_ram0_0),
		.pent1m_1m_on (pent1m_1m_on),
		.pent1m_page  (pent1m_page),
		.pent1m_ROM   (pent1m_ROM),

		.atm_palwr  (atm_palwr  ),
		.atm_paldata(atm_paldata),
		.atm_paldatalow(atm_paldatalow),
		.pal444_ena(pal444_ena),

		.beeper_wr(beeper_wr),
		.covox_wr (covox_wr ),

		.fnt_wr(fnt_wr),
		.clr_nmi(clr_nmi),


		.pages(~{ rd_pages[7], rd_pages[6],
		          rd_pages[5], rd_pages[4],
		          rd_pages[3], rd_pages[2],
		          rd_pages[1], rd_pages[0] }),

		.ramnroms  ( rd_ramnrom    ),
		.dos7ffds  ( rd_dos7ffd    ),
		.wrdisables( rd_wrdisables ),

		.palcolor(palcolor),
		.fontrom_readback(fontrom_readback),
	
		.up_ena    (up_ena    ),
		.up_paladdr(up_paladdr),
		.up_paldata(up_paldata),
		.up_palwr  (up_palwr  ),

        .modes_raster(modes_raster),

		.external_port(external_port),

		.set_nmi(set_nmi[1]),

		.brk_ena (brk_ena ),
		.brk_addr(brk_addr),

		.fdd_mask(fdd_mask)
	);


	zint zint(
		.fclk(fclk),
		.zpos(zpos),
		.zneg(zneg),

		.int_start(int_start),

		.iorq_n(iorq_n),
		.m1_n  (m1_n  ),

		.wait_n(spiint_n), // spiint_n is 1-0 signal, wait_n is Z-0

		.int_n(int_n)
	);

	znmi znmi
	(
		.rst_n(rst_n),
		.fclk(fclk),
		.zpos(zpos),
		.zneg(zneg),

		.rfsh_n(rfsh_n),
		.m1_n  (m1_n  ),
		.mreq_n(mreq_n),
		.csrom (csrom ),
		.a     (a     ),

		.int_start(int_start),

		.set_nmi(set_nmi),
		.imm_nmi(imm_nmi),
		.clr_nmi(clr_nmi),

		.drive_00(drive_00),

		.in_nmi (in_nmi ),
		.gen_nmi(gen_nmi),
		.nmi_buf_clr(nmi_buf_clr)
	);


	zbreak zbreak
	(
		.rst_n(rst_n),
		.fclk(fclk),
		.zpos(zpos),
		.zneg(zneg),

		.m1_n  (m1_n  ),
		.mreq_n(mreq_n),
		.a     (a     ),

		.imm_nmi(imm_nmi),

		.brk_ena (brk_ena ),
		.brk_addr(brk_addr)
	);






	zwait zwait( .wait_start_gluclock(wait_start_gluclock),
	             .wait_start_comport (wait_start_comport),
	             .wait_end(wait_end),
	             .rst_n(rst_n),
	             .wait_n(wait_n),
	             .waits(waits),
	             .spiint_n(spiint_n) );




	assign vg_a[0] = vg_ddrv[0] ? 1'b1 : 1'b0; // possibly open drain?
	assign vg_a[1] = vg_ddrv[1] ? 1'b1 : 1'b0;

	vg93 vgshka( .zclk(zclk), .rst_n(rst_n), .fclk(fclk), .vg_clk(vg_clk),
	             .vg_res_n(vg_res_n), .din(d), .intrq(intrq), .drq(drq), .vg_wrFF_fclk(vg_wrFF_fclk),
	             .vg_hrdy(vg_hrdy), .vg_rclk(vg_rclk), .vg_rawr(vg_rawr), .vg_a(vg_ddrv),
	             .vg_wrd(vg_wrd), .vg_side(vg_side), .step(step), .vg_sl(vg_sl), .vg_sr(vg_sr),
	             .vg_tr43(vg_tr43), .rdat_n(rdat_b_n), .vg_wf_de(vg_wf_de), .vg_drq(vg_drq),
	             .vg_irq(vg_irq), .vg_wd(vg_wd) );




//	spi2 zspi( .clock(fclk), .sck(sdclk), .sdo(sddo), .sdi(sddi), .start(sd_start),
//	           .speed(2'b00), .din(sd_datain), .dout(sd_dataout) );
	spihub spihub(

		.fclk (fclk ),
		.rst_n(rst_n),

		.sdcs_n(sdcs_n),
		.sdclk (sdclk ),
		.sddo  (sddo  ),
		.sddi  (sddi  ),

		.zx_sdcs_n_val(zx_sdcs_n_val),
		.zx_sdcs_n_stb(zx_sdcs_n_stb),
		.zx_sd_start  (zx_sd_start  ),
		.zx_sd_datain (zx_sd_datain ),
		.zx_sd_dataout(zx_sd_dataout),

		.avr_lock_in   (avr_lock_claim),
		.avr_lock_out  (avr_lock_grant),
		.avr_sdcs_n    (avr_sdcs_n    ),
		.avr_sd_start  (avr_sd_start  ),
		.avr_sd_datain (avr_sd_datain ),
		.avr_sd_dataout(avr_sd_dataout)


	);





	  //////////////////////////////////////
	 // sound: beeper, tapeout and covox //
	//////////////////////////////////////

	sound sound(

		.clk(fclk),

		.din(d),

		.beeper_wr(beeper_wr),
		.covox_wr (covox_wr ),

		.beeper_mux(beeper_mux),

		.sound_bit(beep)
	);


endmodule

