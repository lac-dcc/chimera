
// This module is a video top-level


module video_top (

// clocks
	input wire clk,
	input wire f0, f1,
	input wire h0, h1,
	input wire c0, c1, c2, c3,
	// input wire t0,	// debug!!!

// video DAC
	output wire	[1:0] vred,
	output wire	[1:0] vgrn,
	output wire	[1:0] vblu,

// video syncs
	output wire	hsync,
	output wire	vsync,
	output wire	csync,

// Z80 controls
	input wire [15:0] a,
	input wire [ 7:0] d,
	input wire [15:0] zmd,
	input wire [ 7:0] zma,
	input wire 		  cram_we,
	input wire 		  sfile_we,

// port write strobes
    input wire zborder_wr,
    input wire border_wr,
    input wire zvpage_wr,
    input wire vpage_wr,
    input wire vconf_wr,
    input wire gx_offsl_wr,
    input wire gx_offsh_wr,
    input wire gy_offsl_wr,
    input wire gy_offsh_wr,
    input wire t0x_offsl_wr,
    input wire t0x_offsh_wr,
    input wire t0y_offsl_wr,
    input wire t0y_offsh_wr,
    input wire t1x_offsl_wr,
    input wire t1x_offsh_wr,
    input wire t1y_offsl_wr,
    input wire t1y_offsh_wr,
    input wire tsconf_wr,
    input wire palsel_wr,
    input wire tmpage_wr,
    input wire t0gpage_wr,
    input wire t1gpage_wr,
    input wire sgpage_wr,
    input wire hint_beg_wr ,
    input wire vint_begl_wr,
    input wire vint_begh_wr,

// ZX controls
    input wire  res,
	output wire int_start,
	output wire	line_start_s,

// DRAM interface
	output wire [20:0] video_addr,
	output wire [ 4:0] video_bw,
	output wire        video_go,
	input  wire [15:0] dram_rdata,      // raw, should be latched by c2 (video_next)
	input  wire        video_next,
	input  wire        video_pre_next,
	input  wire        next_video,
	input  wire        video_strobe,
	output wire [20:0] ts_addr,
	output wire        ts_req,
	output wire        ts_z80_lp,
	input  wire        ts_pre_next,
	input  wire        ts_next,
	output wire [20:0] tm_addr,
	output wire        tm_req,
	input  wire        tm_next,

// video controls
	input wire cfg_60hz,
	input wire sync_pol,
	input wire vga_on,

	input wire [2:0] tst
);

	// wire [2:0] tst;


    assign ts_z80_lp = tsconf[4];

// video config
	wire [7:0] vpage;      // re-latched at line_start
	wire [7:0] vconf;      //
	wire [8:0] gx_offs;    //
	wire [8:0] gy_offs;    //
	wire [7:0] palsel;     //
	wire [8:0] t0x_offs;   // 
	wire [8:0] t1x_offs;   // 
	wire [7:0] t0gpage;    //
	wire [7:0] t1gpage;    //
	wire [7:0] sgpage;     // * not yet !!!
	wire [8:0] t0y_offs;
	wire [8:0] t1y_offs;
	wire [7:0] tsconf;
	wire [7:0] tmpage;
	wire [7:0] hint_beg;
	wire [8:0] vint_beg;
	wire [8:0] hpix_beg;
	wire [8:0] hpix_end;
	wire [8:0] vpix_beg;
	wire [8:0] vpix_end;
	wire [5:0] x_tiles;
    wire [9:0] x_offs_mode;
    wire [4:0] go_offs;
	wire [1:0] render_mode;
	wire tv_hires;
	wire vga_hires;
	wire v60hz;
	wire nogfx;
	wire tv_blank;

// counters
    wire [7:0] cnt_col;
    wire [8:0] cnt_row;
	wire cptr;
    wire [3:0] scnt;
	wire [8:0] lcount;

// synchro
	wire frame_start;
	wire pix_start;
	wire tv_pix_start;
    wire vga_pix_start;
	wire ts_start;
	wire vga_blank;
	wire vga_line;
	wire v_ts;
	wire v_pf;
	wire hpix;
	wire vpix;
	wire hvpix;
	wire frame;
	wire flash;
	wire pix_stb;

// fetcher
	wire [31:0] fetch_data;
	wire [31:0] fetch_temp;
	wire [3:0] fetch_sel;
	wire [1:0] fetch_bsl;
	wire fetch_stb;

// video data
 	wire [7:0] border;
	wire [7:0] vplex;
	wire [7:0] vgaplex;

// TS
    wire tsr_go;
    wire [5:0] tsr_addr;
    wire [8:0] tsr_line;
    wire [7:0] tsr_page;
    wire [8:0] tsr_x;
    wire [2:0] tsr_xs;
    wire tsr_xf;
    wire [3:0] tsr_pal;
    wire tsr_rdy;

// TS-line
	// wire [8:0] ts_waddr = a[8:0];
	// wire [7:0] ts_wdata = {d[7:1], 1'b1};
	// wire ts_we = c3;
	wire [8:0] ts_waddr;
	wire [7:0] ts_wdata;
	wire ts_we;
	wire [8:0] ts_raddr;

// VGA-line
	wire [9:0] vga_cnt_in;
	wire [9:0] vga_cnt_out;


	video_ports video_ports (
		.clk		  	(clk),
        .d              (d),
        .res            (res),
		.line_start_s	(line_start_s),
        .border_wr      (border_wr),
        .zborder_wr     (zborder_wr),
    	.zvpage_wr	    (zvpage_wr),
    	.vpage_wr	    (vpage_wr),
    	.vconf_wr	    (vconf_wr),
		.gx_offsl_wr	(gx_offsl_wr),
		.gx_offsh_wr	(gx_offsh_wr),
		.gy_offsl_wr	(gy_offsl_wr),
		.gy_offsh_wr	(gy_offsh_wr),
		.t0x_offsl_wr	(t0x_offsl_wr),
		.t0x_offsh_wr	(t0x_offsh_wr),
		.t0y_offsl_wr	(t0y_offsl_wr),
		.t0y_offsh_wr	(t0y_offsh_wr),
		.t1x_offsl_wr	(t1x_offsl_wr),
		.t1x_offsh_wr	(t1x_offsh_wr),
		.t1y_offsl_wr	(t1y_offsl_wr),
		.t1y_offsh_wr	(t1y_offsh_wr),
    	.palsel_wr	    (palsel_wr),
    	.hint_beg_wr    (hint_beg_wr),
    	.vint_begl_wr   (vint_begl_wr),
    	.vint_begh_wr   (vint_begh_wr),
    	.tsconf_wr	    (tsconf_wr),
    	.tmpage_wr	    (tmpage_wr),
    	.t0gpage_wr	    (t0gpage_wr),
    	.t1gpage_wr	    (t1gpage_wr),
    	.sgpage_wr	    (sgpage_wr),
        .border         (border),
        .vpage          (vpage),
        .vconf          (vconf),
        .gx_offs        (gx_offs),
        .gy_offs        (gy_offs),
        .t0x_offs       (t0x_offs),
        .t1x_offs       (t1x_offs),
        .t0y_offs       (t0y_offs),
        .t1y_offs       (t1y_offs),
        .palsel         (palsel),
        .hint_beg       (hint_beg),
        .vint_beg       (vint_beg),
		// .int_start		(int_start),	// uncomment to enable VSINT auto-increment
        .tsconf         (tsconf),
        .tmpage         (tmpage),
        .t0gpage        (t0gpage),
        .t1gpage        (t1gpage),
        .sgpage         (sgpage)
);


	video_mode video_mode (
		.clk		  	(clk),
		.f1			    (f1),
		.c3			    (c3),
		.vpage	    	(vpage),
		.vconf	    	(vconf),
		.v60hz	    	(v60hz),
		.fetch_sel		(fetch_sel),
		.fetch_bsl		(fetch_bsl),
		.fetch_cnt	    (scnt),
		.fetch_stb	    (fetch_stb),
		.txt_char	    (fetch_temp[15:0]),
		.gx_offs		(gx_offs),
		.x_offs_mode	(x_offs_mode),
		.hpix_beg	    (hpix_beg),
		.hpix_end	    (hpix_end),
		.vpix_beg	    (vpix_beg),
		.vpix_end	    (vpix_end),
		.x_tiles	    (x_tiles),
        .go_offs        (go_offs),
        .cnt_col        (cnt_col),
        .cnt_row        (cnt_row),
        .cptr	        (cptr),
		.line_start_s	(line_start_s),
		.pix_start	    (pix_start),
		.tv_hires		(tv_hires),
		.vga_hires	    (vga_hires),
		.nogfx		    (nogfx),
		.pix_stb	    (pix_stb),
		.render_mode	(render_mode),
		.video_addr	    (video_addr),
		.video_bw		(video_bw)
);


	video_sync video_sync (
		.clk			(clk),
		.f1				(f1),
		.c0				(c0),
		.c1				(c1),
		.c3				(c3),
		.hpix_beg		(hpix_beg),
		.hpix_end		(hpix_end),
		.vpix_beg		(vpix_beg),
		.vpix_end		(vpix_end),
        .go_offs        (go_offs),
        .x_offs         (x_offs_mode[1:0]),
        .y_offs_wr      (gy_offsl_wr || gy_offsh_wr),
		.line_start_s	(line_start_s),
		.hint_beg		(hint_beg),
		.vint_beg		(vint_beg),
		.hsync			(hsync),
		.vsync			(vsync),
		.csync			(csync),
		.tv_blank		(tv_blank),
		.vga_blank		(vga_blank),
		.vga_cnt_in		(vga_cnt_in),
		.vga_cnt_out	(vga_cnt_out),
		.ts_raddr	    (ts_raddr),
		.lcount			(lcount),
        .cnt_col        (cnt_col),
        .cnt_row        (cnt_row),
        .cptr	        (cptr),
		.scnt			(scnt),
		.frame			(frame),
		.flash			(flash),
		.pix_stb	    (pix_stb),
		.pix_start		(pix_start),
		.ts_start		(ts_start),
		.cstart			(x_offs_mode[9:2]),
		.rstart			(gy_offs),
		.vga_line		(vga_line),
		.frame_start	(frame_start),
		.int_start		(int_start),
		.v_pf			(v_pf),
		.hpix			(hpix),
		.v_ts			(v_ts),
		.vpix			(vpix),
		.hvpix			(hvpix),
		.nogfx			(nogfx),
		.cfg_60hz		(cfg_60hz),
		.sync_pol		(sync_pol),
		.v60hz			(v60hz),
		.video_go		(video_go),
		.video_pre_next	(video_pre_next)
);


	video_fetch video_fetch (
		.clk			(clk),
		.f_sel			(fetch_sel),
		.b_sel			(fetch_bsl),
		.fetch_stb		(fetch_stb),
		.fetch_data		(fetch_data),
		.fetch_temp		(fetch_temp),
		.video_strobe	(video_strobe),
		.video_data		(dram_rdata)
);

	video_ts video_ts (
		.clk		    (clk),
        .start          (ts_start),
		.line			(lcount),
		.v_ts		    (v_ts),

        .tsconf         (tsconf),
        .t0gpage        (t0gpage),
        .t1gpage        (t1gpage),
        .sgpage         (sgpage),
        .tmpage         (tmpage),
		.num_tiles		(x_tiles),
		.v_pf	        (v_pf),
        .t0x_offs       (t0x_offs),
        .t1x_offs       (t1x_offs),
        .t0y_offs       (t0y_offs),
        .t1y_offs       (t1y_offs),
        .t0_palsel      (palsel[5:4]),
        .t1_palsel      (palsel[7:6]),

        .dram_addr      (tm_addr),
        .dram_req       (tm_req),
        .dram_next      (tm_next),
        .dram_rdata     (dram_rdata),

        .tsr_go         (tsr_go),
        .tsr_addr       (tsr_addr),
        .tsr_line       (tsr_line),
        .tsr_page       (tsr_page),
        .tsr_pal        (tsr_pal),
        .tsr_x          (tsr_x),
        .tsr_xs         (tsr_xs),
        .tsr_xf         (tsr_xf),
        .tsr_rdy        (tsr_rdy),

		.sfile_addr_in	(zma),
		.sfile_data_in	(zmd),
		.sfile_we		(sfile_we)
);


	video_ts_render video_ts_render (
		.clk		    (clk),

        .reset          (ts_start),

        .tsr_go         (tsr_go),
        .addr           (tsr_addr),
        .line           (tsr_line),
        .page           (tsr_page),
        .pal            (tsr_pal),
        .x_coord        (tsr_x),
        .x_size         (tsr_xs),
        .flip           (tsr_xf),
        .mem_rdy        (tsr_rdy),

        .ts_waddr       (ts_waddr),
        .ts_wdata       (ts_wdata),
        .ts_we          (ts_we),

        .dram_addr      (ts_addr),
        .dram_req       (ts_req),
        .dram_pre_next  (ts_pre_next),
        .dram_next      (ts_next),
        .dram_rdata     (dram_rdata)
);


	video_render video_render (
		.clk		    (clk),
		.c1			    (c1),
		.hvpix 	        (hvpix),
		.nogfx			(nogfx),
		.flash			(flash),
		.hires			(tv_hires),
		.psel			(scnt),
		.palsel			(palsel[3:0]),
		.render_mode	(render_mode),
		.data	 	    (fetch_data),
		.border_in 	    (border),
		.tsdata_in 	    (ts_rdata),
		.vplex_out 	    (vplex)
);

	video_out video_out (
		.clk			(clk),
		.f0				(f0),
		.c3				(c3),
		.vga_on			(vga_on),
		.tv_blank 		(tv_blank),
		.vga_blank		(vga_blank),
		.vga_line		(vga_line),
		.frame			(frame),
		.palsel			(palsel[3:0]),
	    .plex_sel_in	({h1, f1}),
		.tv_hires		(tv_hires),
		.vga_hires		(vga_hires),
		.cram_addr_in	(zma),
		.cram_data_in	(zmd[14:0]),
		.cram_we		(cram_we),
	    .vplex_in		(vplex),
	    .vgaplex		(vgaplex),
		.vred			(vred),
	    .vgrn			(vgrn),
	    .vblu			(vblu)
);


// 2 buffers: 512 pixels * 8 bits (9x8) - used as bitmap buffer for TS overlay over graphics
// (2 altdprams)
    wire tl_act0 = lcount[0];
    wire tl_act1 = ~lcount[0];
    wire [8:0] ts_waddr0 = tl_act0 ? ts_raddr : ts_waddr;
    wire [7:0] ts_wdata0 = tl_act0 ? 8'd0 : ts_wdata;
    wire       ts_we0    = tl_act0 ? c3 : ts_we;
    wire [8:0] ts_waddr1 = tl_act1 ? ts_raddr : ts_waddr;
    wire [7:0] ts_wdata1 = tl_act1 ? 8'd0 : ts_wdata;
    wire       ts_we1    = tl_act1 ? c3 : ts_we;
    wire [7:0] ts_rdata  = tl_act0 ? ts_rdata0 : ts_rdata1;
    wire [7:0] ts_rdata0, ts_rdata1;


    video_tsline0 video_tsline0 (
        .clock      (clk),
        .wraddress  (ts_waddr0),
        .data       (ts_wdata0),
        .wren       (ts_we0),
        .rdaddress  (ts_raddr),
        .q          (ts_rdata0)
);
    video_tsline1 video_tsline1 (
        .clock      (clk),
        .wraddress  (ts_waddr1),
        .data       (ts_wdata1),
        .wren       (ts_we1),
        .rdaddress  (ts_raddr),
        .q          (ts_rdata1)
);


// 2 lines * 512 pix * 8 bit (10x8) - used for VGA doubler
// (1 altdpram)
	video_vmem video_vmem(
		.clock		(clk),
		.wraddress	(vga_cnt_in),
		.data		(vplex),
		.wren		(c3),
	    .rdaddress	(vga_cnt_out),
	    .q			(vgaplex)
);


endmodule
