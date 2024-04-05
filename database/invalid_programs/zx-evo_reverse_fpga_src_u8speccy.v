
module u8speccy
(
	// clock
	input wire			CLK_50MHZ,

	// reset
	input wire			RST_n,

	// SRAM
	output reg [19:0] 	SRAM_A,
	inout wire [7:0]	SRAM_D,
	output reg			SRAM_WE_n,

	// SDRAM
	output wire [12:0]	DRAM_A,
	inout wire [7:0]	DRAM_D,
	output wire [1:0]	DRAM_BA,
	output wire			DRAM_CLK,
	output wire			DRAM_WE_n,
	output wire			DRAM_CAS_n,
	output wire			DRAM_RAS_n,

	// RTC
	input wire			RTC_INT_n,
	inout wire			RTC_SCL,
	inout wire			RTC_SDA,

	// serial flash
	input wire			DATA0,
	output reg			NCSO,
	output reg			DCLK,
	output reg			ASDO,

	// audio codec
	output wire			VS_XCS,
	output wire			VS_XDCS,
	input wire			VS_DREQ,

	// video
	output wire [2:0]	VGA_R,
	output wire [2:0]	VGA_G,
	output wire [2:0]	VGA_B,
	output wire			VGA_VSYNC,
	output wire			VGA_HSYNC,

	// GPIO
	input wire			GPI,
	inout wire			GPIO,

	// PS/2
	inout wire			PS2_KBCLK,
	inout wire			PS2_KBDAT,
	inout wire			PS2_MSCLK,
	inout wire			PS2_MSDAT,

	// serial port
	input wire			TXD,
	output wire			RXD,
	input wire			CBUS4,

	// SD SPI
	output wire			SD_CLK,
	input wire			SD_DAT0,
	input wire			SD_DAT1,
	input wire			SD_DAT2,
	output wire			SD_DAT3,
	output wire			SD_CMD,
	input wire			SD_PROT,
	
	//virtual
	output wire			clk_zxfpga,
	output wire 		zclk,
	output wire [15:0]	cpu0_a,
	output wire [7:0]	cpu0_do,
	output wire [7:0]	cpu0_di,
	output wire			cpu0_mreq_n,
	output wire			cpu0_iorq_n,
	output wire			cpu0_wr_n,
	output wire			cpu0_rd_n,
	output wire			cpu0_m1_n,
	output wire			cpu0_rfsh_n,
	
	output wire [20:0]	dram_addr,
	output wire			dram_req,
	output wire			dram_rnw,
	output reg [15:0]	dram_rddata,
	output wire [1:0]	dram_bsel,
	
	output wire mreq,
	output wire mreq_s,
	output wire rdwr,
	output wire iord,
	output wire iowr,
	output wire iorw,
	output wire iord_s,
	output wire iowr_s,
	output wire iorw_s,
	output wire memrd,
	output wire memwr,
	output wire memrw,
	output wire memrd_s,
	output wire memwr_s,
	output wire memrw_s,
	output wire opfetch,
	output wire opfetch_s,
	output wire intack
);

	wire reset = !RST_n || !locked;

	assign VGA_R = {vred[1], vred[0], vred[0]};
	assign VGA_G = {vgrn[1], vgrn[0], vgrn[0]};
	assign VGA_B = {vblu[1], vblu[0], vblu[0]};

// DRAM emulator via SRAM
	// address is latched at c3, data should be available at c2 of next DRAM cycle

	// wire [20:0] dram_addr;
	// wire dram_req;
	// wire dram_rnw;
	// reg [15:0] dram_rddata;
	// wire [1:0] dram_bsel;
	wire [15:0] dram_wrdata;
	reg int_SRAM_WE_n;
	
	reg [7:0] sram_wrdata;
	assign SRAM_D = SRAM_WE_n ? 8'hZZ : sram_wrdata;

	always @(posedge clk_zxfpga)
	begin
		// address
		if (c3)
			SRAM_A <= {dram_addr, 1'b0};
		else if (c0)
			SRAM_A <= SRAM_A + 1;
			
		// read data
		if (c0)
			dram_rddata[7:0] <= SRAM_D;
		else if (c1)
			dram_rddata[15:8] <= SRAM_D;
			
		// write data
		if (c3)
			sram_wrdata <= dram_wrdata[7:0];
		else if (c0)
			sram_wrdata <= dram_wrdata[15:8];
			
		// write enable
		if (c3)
		begin
			SRAM_WE_n <= dram_req ? (dram_rnw || !dram_bsel[0]) : 1'b1;
			int_SRAM_WE_n <= dram_req ? (dram_rnw || !dram_bsel[1]) : 1'b1;
		end
			
		else if (c0)
			SRAM_WE_n <= int_SRAM_WE_n;
			
		else if (c1)
			SRAM_WE_n <= 1'b1;
	end

    wire clk_sdram;
    // wire clk_zxfpga;
    wire clk_vs1053;
    wire clk_spi;
    wire locked;

	pll pll (
		.areset(!RST_n),
		.inclk0(CLK_50MHZ),
		.locked(locked),
		.c0(clk_sdram),		// 112MHz (was 84)
		.c1(clk_zxfpga),	// 28MHz
		.c2(clk_vs1053),	// 1.536MHz
		.c3(clk_spi)		// 28MHz (was 21)
	);

	wire f0, f1, h0, h1, c0, c1, c2, c3, ay_clk;

	clock clock
	(
		.clk(clk_zxfpga),
		.f0(f0),
		.f1(f1),
		.h0(h0),
		.h1(h1),
		.c0(c0),
		.c1(c1),
		.c2(c2),
		.c3(c3),
		.ay_clk(ay_clk),
		// .ay_mod(sysconf[4:3])
		.ay_mod(2'b00)
	);

    // wire [15:0] cpu0_a;
    // wire [7:0] cpu0_do;
    // wire [7:0] cpu0_di;
    // wire cpu0_mreq_n;
    // wire cpu0_iorq_n;
    // wire cpu0_wr_n;
    // wire cpu0_rd_n;
    // wire cpu0_m1_n;
    wire cpu0_int_n;
    // wire cpu0_rfsh_n;
	
    assign cpu0_di = csrom ? rom_do : (ena_ram ? dout_ram : (ena_ports ? dout_ports : (intack ? im2vect : 8'hFF)));

	tv80s #(.Mode(0), .T2Write(1), .IOWait(1)) cpu0 (
		.reset_n(!reset),
		.clk(zclk),
		.wait_n(1'b1),
		// .int_n(cpu0_int_n),
		.int_n(0),
		.nmi_n(1'b1),
		.busrq_n(1'b1),
		.m1_n(cpu0_m1_n),
		.mreq_n(cpu0_mreq_n),
		.iorq_n(cpu0_iorq_n),
		.rd_n(cpu0_rd_n),
		.wr_n(cpu0_wr_n),
		.rfsh_n(cpu0_rfsh_n),
		.halt_n(),
		.busak_n(),
		.A(cpu0_a),
		.di(cpu0_di),
		.dout(cpu0_do)
	);

	wire [7:0] rom_do;

	rom	cpu0_rom (
		.clock(clk_zxfpga),
		.address_a(cpu0_a[13:0]),
		.q_a(rom_do),
		.address_b(),
		.q_b()
	);

	// wire [12:0] ram_a;
	// wire [15:0] ram_di;
	// wire [15:0] ram_do;
	// wire [1:0] ram_bs;
	// wire ram_we;
	
	// ram	cpu0_ram (
		// .clock(clk_zxfpga),
		// .address(video_addr),
		// .data(ram_di),
		// .q(ram_do),
		// .byteena(ram_bs),
		// .wren(0)
	// );

	wire [1:0] ay_mod;
	wire dos;
	wire vdos;
	wire zpos, zneg;
	wire [7:0] zports_dout;
	wire zports_dataout;
	wire porthit;
	wire [7:0] kbd_data;
	wire [2:0] kbd_data_sel;
	wire [7:0] mus_data;
	wire kbd_stb, mus_xstb, mus_ystb, mus_btnstb, kj_stb;
	wire [4:0] kbd_port_data;
	wire [4:0] kj_port_data;
	wire [7:0] mus_port_data;
	wire [7:0] wait_read,wait_write;
	wire wait_rnw;
	wire wait_start_gluclock;
	wire wait_start_comport;
	wire wait_end;
	wire [7:0] gluclock_addr;
	wire [2:0] comport_addr;
	wire [6:0] waits;

	// config signals
	wire [7:0] not_used;
	wire cfg_60hz;
	wire cfg_sync_pol;
	wire cfg_vga_on;
	wire [1:0] set_nmi;

	wire tape_in;
	wire [7:0] zmem_dout;
	wire zmem_dataout;
	// wire vg_wrFF;
	wire [1:0] rstrom;

	wire go;
	wire tape_read; // data for tapein
	wire beeper_mux; // what is mixed to FPGA beeper output - beeper(0) or tapeout(1)
	wire beeper_wr, covox_wr;
	wire external_port;
	wire ide_stall;

	wire [1:0] turbo =  sysconf[1:0];
	// wire [1:0] turbo =  2'b00;
	wire cache_en = sysconf[2];
	wire [7:0] border;
	wire int_start_lin;
	wire int_start_frm;
	wire int_start_dma;

	wire [7:0] dout_ram;
	wire [7:0] dout_ports;
	wire [7:0] im2vect;
	wire ena_ram;
	wire ena_ports;
	wire drive_ff;

	wire rampage_wr;		// ports #10AF-#13AF
	wire [7:0] memconf;
	wire [7:0] xt_ramp[0:3];
	wire [4:0] rompg;
	wire vdos_on, vdos_off;
	wire dos_on, dos_off;

	wire [20:0] daddr;
	wire dreq;
	wire drnw;

	wire cpu_req, cpu_wrbsel, cpu_strobe, cpu_latch;
	wire [20:0] cpu_addr;
	wire [20:0] video_addr;
	wire cpu_next;
	wire cpu_stall;

	wire [4:0] video_bw;
	wire video_strobe;
	wire video_next;
	wire video_pre_next;
	wire next_video;

	wire [20:0] dma_addr;
	wire [15:0] dma_wrdata;
	wire dma_req;
	wire dma_z80_lp;
	wire dma_rnw;
	wire dma_next;
	wire dma_strobe;

	wire [20:0] ts_addr;
	wire ts_req;
	wire ts_z80_lp;
	wire ts_pre_next;
	wire ts_next;

	wire [20:0] tm_addr;
	wire tm_req;
	wire tm_next;

	wire border_wr;
	wire zborder_wr;
	wire zvpage_wr;
	wire vpage_wr;
	wire vconf_wr;
	wire gx_offsl_wr;
	wire gx_offsh_wr;
	wire gy_offsl_wr;
	wire gy_offsh_wr;
	wire t0x_offsl_wr;
	wire t0x_offsh_wr;
	wire t0y_offsl_wr;
	wire t0y_offsh_wr;
	wire t1x_offsl_wr;
	wire t1x_offsh_wr;
	wire t1y_offsl_wr;
	wire t1y_offsh_wr;
	wire palsel_wr;
	wire hint_beg_wr;
	wire vint_begl_wr;
	wire vint_begh_wr;
	wire tsconf_wr;
	wire tmpage_wr;
	wire t0gpage_wr;
	wire t1gpage_wr;
	wire sgpage_wr;

	wire [2:0] tst;

	wire [15:0]	   zmd;
	wire [7:0]	   zma;
	wire cram_we;
	wire sfile_we;

	wire rst;
	wire m1;
	wire rfsh;
	wire rd;
	wire wr;
	wire iorq;
	wire iorq_s;
	// wire iorq_s2;
	// wire mreq;
	// wire mreq_s;
	// wire rdwr;
	// wire iord;
	// wire iowr;
	// wire iorw;
	// wire iord_s;
	// wire iowr_s;
	// wire iorw_s;
	// wire memrd;
	// wire memwr;
	// wire memrw;
	// wire memrd_s;
	// wire memwr_s;
	// wire memrw_s;
	// wire opfetch;
	// wire opfetch_s;
	// wire intack;
	wire csrom;

	wire [31:0] xt_page;

	wire [8:0] dmaport_wr;
	wire [4:0] fmaddr;

	wire [7:0] sysconf;
	wire [3:0] fddvirt;

	wire [15:0] z80_ide_out;
	wire z80_ide_cs0_n;
	wire z80_ide_cs1_n;
	wire z80_ide_req;
	wire z80_ide_rnw;

	wire [2:0] im2v_frm;
	wire [2:0] im2v_lin;
	wire [2:0] im2v_dma;
	wire [7:0] intmask;

	wire dma_act;

	wire [15:0] dma_data;
	wire [7:0] dma_wraddr;
	wire dma_cram_we;

	wire dma_sfile_we;

	wire [15:0] dma_ide_out;
	wire dma_ide_req;
	wire dma_ide_rnw;

	wire cpu_spi_req;
	wire dma_spi_req;
	wire spi_rdy;
	wire spi_stb;
	wire spi_start;
	wire [7:0] cpu_spi_din;
	wire [7:0] dma_spi_din;
	wire [7:0] spi_dout;

	// wire zclk;

	zclock zclock
	(
		.clk(clk_zxfpga),
		.c0(c0),
		.c2(c2),
		.iorq_s(iorq_s),
		.zclk_out(zclk),
		.zpos(zpos),
		.zneg(zneg),
		.turbo(turbo),
		.dos_on(dos_on),
		.vdos_off(vdos_off),
		.cpu_stall(cpu_stall),
		.ide_stall(0),
		.external_port(0)
	);

	zmem zmem (
		.clk(clk_zxfpga),
		.c0(c0),
		.c1(c1),
		.c2(c2),
		.c3(c3),
		.rst(reset),
		.zpos(zpos),
		.zneg(zneg),
		.za(cpu0_a),
		.zd_out(dout_ram),
		.zd_ena(ena_ram),
		.opfetch(opfetch),
		.opfetch_s(opfetch_s),
		.mreq(mreq),
		.memrd(memrd),
		.memwr(memwr),
		.memwr_s(memwr_s),
		.memconf(memconf[3:0]),
		.xt_page(xt_page),
		.rompg(rompg),
		.cache_en(cache_en),
		.romoe_n(romoe_n),
		.romwe_n(romwe_n),
		.csrom(csrom),
		.dos(dos),
		.dos_on(dos_on),
		.dos_off(dos_off),
		.vdos(vdos),
		.vdos_on(vdos_on),
		.vdos_off(vdos_off),
		.cpu_req(cpu_req),
		.cpu_wrbsel(cpu_wrbsel),
		.cpu_strobe(cpu_strobe),
		.cpu_latch(cpu_latch),
		.cpu_addr(cpu_addr),
		.cpu_rddata(dram_rddata),   		// raw
		.cpu_stall(cpu_stall),
		.cpu_next(cpu_next),
		.turbo(turbo)
	);

	arbiter arbiter (
		.clk(clk_zxfpga),
		.c0(c0),
		.c1(c1),
		.c2(c2),
		.c3(c3),
		.dram_addr(dram_addr),
		.dram_req(dram_req),
		.dram_rnw(dram_rnw),
		.dram_bsel(dram_bsel),
		.dram_wrdata(dram_wrdata),
		.cpu_addr(cpu_addr),
		.cpu_wrdata(cpu0_do),
		.cpu_req(cpu_req),
		.cpu_rnw(rd),
		.cpu_wrbsel(cpu_wrbsel),
		.cpu_next(cpu_next),
		.cpu_strobe(cpu_strobe),
		.cpu_latch(cpu_latch),
		.go(go),
		.video_bw(video_bw),
		.video_addr(video_addr),
		.video_strobe(video_strobe),
		.video_pre_next(video_pre_next),
		.video_next(video_next),
		.next_vid(next_video),
		.dma_addr(dma_addr),
		.dma_wrdata(dma_wrdata),
		.dma_req(dma_req),
		.dma_rnw(dma_rnw),
		.dma_next(dma_next),
		.ts_req(ts_req),
		.ts_addr(ts_addr),
		.ts_pre_next(ts_pre_next),
		.ts_next(ts_next),
		.tm_addr(tm_addr),
		.tm_req(tm_req),
		.tm_next(tm_next)
	);

	wire [1:0] vred;
	wire [1:0] vgrn;
	wire [1:0] vblu;

	video_top video_top (
		.clk(clk_zxfpga),
		.res(reset),
		.f0(f0),
		.f1(f1),
		.h0(h0),
		.h1(h1),
		.c0(c0),
		.c1(c1),
		.c2(c2),
		.c3(c3),
		.vred(vred),
		.vgrn(vgrn),
		.vblu(vblu),
		.vsync(VGA_VSYNC),
		.hsync(VGA_HSYNC),
		// .cfg_60hz(cfg_60hz),		// uncomment to enable 60Hz VGA timings
		.cfg_60hz(1),
		.sync_pol(1),
		.vga_on(1),
		.border_wr(border_wr),
		.zborder_wr(zborder_wr),
		.zvpage_wr(zvpage_wr),
		.vpage_wr(vpage_wr),
		.vconf_wr(vconf_wr),
		.gx_offsl_wr(gx_offsl_wr),
		.gx_offsh_wr(gx_offsh_wr),
		.gy_offsl_wr(gy_offsl_wr),
		.gy_offsh_wr(gy_offsh_wr),
		.t0x_offsl_wr(t0x_offsl_wr),
		.t0x_offsh_wr(t0x_offsh_wr),
		.t0y_offsl_wr(t0y_offsl_wr),
		.t0y_offsh_wr(t0y_offsh_wr),
		.t1x_offsl_wr(t1x_offsl_wr),
		.t1x_offsh_wr(t1x_offsh_wr),
		.t1y_offsl_wr(t1y_offsl_wr),
		.t1y_offsh_wr(t1y_offsh_wr),
		.palsel_wr(palsel_wr),
		.hint_beg_wr(hint_beg_wr),
		.vint_begl_wr(vint_begl_wr),
		.vint_begh_wr(vint_begh_wr),
		.tsconf_wr(tsconf_wr),
		.tmpage_wr(tmpage_wr),
		.t0gpage_wr(t0gpage_wr),
		.t1gpage_wr(t1gpage_wr),
		.sgpage_wr(sgpage_wr),
		// .video_addr(video_addr),
		.video_addr(video_addr),
		.video_bw(video_bw),
		.video_go(go),
   		.dram_rdata(dram_rddata),			   // raw, should be latched by c2
		.video_strobe(video_strobe),
		.video_next(video_next),
		.video_pre_next(video_pre_next),
		.next_video(next_video),
		.ts_req(ts_req),
		.ts_pre_next(ts_pre_next),
		.ts_addr(ts_addr),
		.ts_next(ts_next),
		.tm_addr(tm_addr),
		.tm_req(tm_req),
		.tm_next(tm_next),
		.a(cpu0_a),
		.d(cpu0_do),
		.zmd(zmd),
		.zma(zma),
		.cram_we(cram_we),
		.sfile_we(sfile_we),
		.int_start(int_start_frm),
		.line_start_s(int_start_lin)
	);

	zmaps zmaps (
		.clk(clk_zxfpga),
		.memwr_s(memwr_s),
		.a(cpu0_a),
		.d(cpu0_do),
		.fmaddr(fmaddr),
		.zmd(zmd),
		.zma(zma),
		.dma_wraddr(dma_wraddr),
		.dma_data(dma_data),
		.dma_cram_we(dma_cram_we),
		.dma_sfile_we(dma_sfile_we),
		.cram_we(cram_we),
		.sfile_we(sfile_we)
	);

	zsignals zsignals (
		.clk(clk_zxfpga),
		.zpos(zpos),
		.iorq_n(cpu0_iorq_n),
		.mreq_n(cpu0_mreq_n),
		.m1_n(cpu0_m1_n),
		.rfsh_n(cpu0_rfsh_n),
		.rd_n(cpu0_rd_n),
		.wr_n(cpu0_wr_n),
		.m1(m1),
		.rfsh(rfsh),
		.rd(rd),
		.wr(wr),
		.iorq(iorq),
		.iorq_s(iorq_s),
		// .iorq_s2	(iorq_s2),
		.mreq(mreq),
		.mreq_s(mreq_s),
		.rdwr(rdwr),
		.iord(iord),
		.iowr(iowr),
		.iorw(iorw),
		.iord_s(iord_s),
		.iowr_s(iowr_s),
		.iorw_s(iorw_s),
		.memrd(memrd),
		.memwr(memwr),
		.memrw(memrw),
		.memrd_s(memrd_s),
		.memwr_s(memwr_s),
		.memrw_s(memrw_s),
		.opfetch(opfetch),
		.opfetch_s(opfetch_s),
		.intack(intack)
	);

	zports zports
	(
		.zclk(zclk),
		.clk(clk_zxfpga),
		.din(cpu0_do),
		.dout(dout_ports),
		.dataout(ena_ports),
		.a(cpu0_a),
		.rst(reset),
		.opfetch(opfetch),
		.rd(rd),
		.wr(wr),
		.rdwr(rdwr),
		.iorq(iorq),
		.iord(iord),
		.iowr(iowr),
		.iorw(iorw),
		.iorq_s(iorq_s),
		// .iorq_s2	(iorq_s2),
		.iord_s(iord_s),
		.iowr_s(iowr_s),
		.iorw_s(iorw_s),
		.ay_bdir(ay_bdir),
		.ay_bc1(ay_bc1),
		.rstrom(rstrom),
		// .vg_intrq(intrq),
		// .vg_drq(drq),
		// .vg_cs_n(vg_cs_n),
		// .vg_wrFF(vg_wrFF),
		// .sd_start(cpu_spi_req),
		// .sd_dataout(spi_dout),
		// .sd_datain(cpu_spi_din),
		// .sdcs_n(sdcs_n),
		// .ide_in(ide_d),
		// .ide_out(z80_ide_out),
		// .ide_cs0_n(z80_ide_cs0_n),
		// .ide_cs1_n(z80_ide_cs1_n),
		// .ide_req(z80_ide_req),
		// .ide_stb(ide_stb),
		// .ide_ready(ide_ready),
		// .ide_stall(ide_stall),
		.border_wr(border_wr),
		.zborder_wr(zborder_wr),
		.zvpage_wr(zvpage_wr),
		.vpage_wr(vpage_wr),
		.vconf_wr(vconf_wr),
		.gx_offsl_wr(gx_offsl_wr),
		.gx_offsh_wr(gx_offsh_wr),
		.gy_offsl_wr(gy_offsl_wr),
		.gy_offsh_wr(gy_offsh_wr),
		.t0x_offsl_wr(t0x_offsl_wr),
		.t0x_offsh_wr(t0x_offsh_wr),
		.t0y_offsl_wr(t0y_offsl_wr),
		.t0y_offsh_wr(t0y_offsh_wr),
		.t1x_offsl_wr(t1x_offsl_wr),
		.t1x_offsh_wr(t1x_offsh_wr),
		.t1y_offsl_wr(t1y_offsl_wr),
		.t1y_offsh_wr(t1y_offsh_wr),
		.palsel_wr(palsel_wr),
		.hint_beg_wr(hint_beg_wr),
		.vint_begl_wr(vint_begl_wr),
		.vint_begh_wr(vint_begh_wr),
		.tsconf_wr(tsconf_wr),
		.tmpage_wr(tmpage_wr),
		.t0gpage_wr(t0gpage_wr),
		.t1gpage_wr(t1gpage_wr),
		.sgpage_wr(sgpage_wr),
		.xt_page(xt_page),
		.fmaddr(fmaddr),
		.sysconf(sysconf),
		.memconf(memconf),
		.im2v_frm(im2v_frm),
		.im2v_lin(im2v_lin),
		.im2v_dma(im2v_dma),
		.intmask(intmask),
		.fddvirt(fddvirt),
		// .drive_sel(vg_a),
		.dos(dos),
		.vdos(vdos),
		.vdos_on(vdos_on),
		.vdos_off(vdos_off),
		.dmaport_wr(dmaport_wr),
		.dma_act(dma_act),
		// .keys_in(kbd_port_data),
		// .mus_in(mus_port_data),
		// .kj_in(kj_port_data),
		// .tape_read(tape_read),
		.beeper_wr(beeper_wr),
		.covox_wr(covox_wr),
		// .gluclock_addr(gluclock_addr),
		// .comport_addr(comport_addr),
		// .wait_start_gluclock(wait_start_gluclock),
		// .wait_start_comport(wait_start_comport),
		// .wait_rnw(wait_rnw),
		// .wait_read(wait_read),
		// .wait_write(wait_write),
		// .porthit(porthit),
		// .external_port(external_port)
	);

	dma dma
	(
		.clk(clk_zxfpga),
		.c2(c2),
		.reset(reset),
		.int_start(int_start_dma),
		.zdata(cpu0_do),
		.dmaport_wr(dmaport_wr),
		.dma_act(dma_act),
		.dram_addr(dma_addr),
		.dram_rnw(dma_rnw),
		.dram_req(dma_req),
		.dma_z80_lp(dma_z80_lp),
		.dram_rddata(dram_rddata),
		.dram_wrdata(dma_wrdata),
		.dram_next(dma_next),
		.data(dma_data),
		.wraddr(dma_wraddr),
		.cram_we(dma_cram_we),
		.sfile_we(dma_sfile_we),
		.spi_req(dma_spi_req),
		.spi_stb(spi_stb),
		.spi_start(spi_start),
		.spi_rddata(spi_dout),
		.spi_wrdata(dma_spi_din)
		// .ide_in(ide_d),
		// .ide_out(dma_ide_out),
		// .ide_req(dma_ide_req),
		// .ide_rnw(dma_ide_rnw),
		// .ide_stb(ide_stb)
	);

	zint zint
	(
		.clk(clk_zxfpga),
		.zclk(zclk),
		.res(reset),
		.im2vect(im2vect),
		.im2v_frm(im2v_frm),
		.im2v_lin(im2v_lin),
		.im2v_dma(im2v_dma),
		.intmask(intmask),
		.int_start_lin(int_start_lin),
		.int_start_frm(int_start_frm),
		.int_start_dma(int_start_dma),
		.vdos(vdos),
		.intack(intack),
		.int_n(cpu0_int_n)
	);

endmodule
