
// This module generates all video raster signals


module video_sync (

// clocks
	input wire clk, f1, c0, c1, c3, pix_stb,

// video parameters
	input wire [8:0] hpix_beg,
	input wire [8:0] hpix_end,
	input wire [8:0] vpix_beg,
	input wire [8:0] vpix_end,
	input wire [4:0] go_offs,
	input wire [1:0] x_offs,
	input wire [7:0] hint_beg,
	input wire [8:0] vint_beg,
	input wire [7:0] cstart,
    input wire [8:0] rstart,

// video syncs
	output reg hsync,
	output reg vsync,
	output reg csync,

// video controls
	input wire cfg_60hz,
	input wire sync_pol,
	output reg v60hz,
	input wire nogfx,
	output wire v_pf,
	output wire hpix,
	output wire vpix,
	output wire v_ts,
	output wire hvpix,
	output wire tv_blank,
	output wire vga_blank,
	output wire vga_line,
	output wire frame_start,
	output wire line_start_s,
	output wire pix_start,
	output wire ts_start,
	output wire frame,
	output wire flash,

// video counters
	output wire [9:0] vga_cnt_in,
	output wire [9:0] vga_cnt_out,
	output wire [8:0] ts_raddr,
	output reg  [8:0] lcount,
	output reg 	[7:0] cnt_col,
	output reg 	[8:0] cnt_row,
	output reg  	  cptr,
	output reg  [3:0] scnt,

// DRAM
	input wire video_pre_next,
	output reg video_go,

// ZX controls
	input wire y_offs_wr,
	output wire int_start

);

	localparam HSYNC_BEG 	= 9'd11;
	localparam HSYNC_END 	= 9'd43;
	localparam HBLNK_BEG 	= 9'd00;
	localparam HBLNK_END 	= 9'd88;
	localparam HSYNCV_BEG 	= 9'd5;
	localparam HSYNCV_END 	= 9'd31;
	localparam HBLNKV_END 	= 9'd42;
	localparam HPERIOD   	= 9'd448;

	localparam VSYNC_BEG_50	= 9'd08;
	localparam VSYNC_END_50	= 9'd11;
	localparam VBLNK_BEG_50	= 9'd00;
	localparam VBLNK_END_50	= 9'd32;
	localparam VPERIOD_50  	= 9'd320;

	localparam VSYNC_BEG_60	= 9'd04;
	localparam VSYNC_END_60	= 9'd07;
	localparam VBLNK_BEG_60	= 9'd00;
	localparam VBLNK_END_60	= 9'd22;
	localparam VPERIOD_60  	= 9'd262;

	wire [8:0] vsync_beg = v60hz ? VSYNC_BEG_60 : VSYNC_BEG_50;
	wire [8:0] vsync_end = v60hz ? VSYNC_END_60 : VSYNC_END_50;
	wire [8:0] vblnk_beg = v60hz ? VBLNK_BEG_60 : VBLNK_BEG_50;
	wire [8:0] vblnk_end = v60hz ? VBLNK_END_60 : VBLNK_END_50;
	wire [8:0] vperiod   = v60hz ? VPERIOD_60   : VPERIOD_50;

// counters
	reg [8:0] hcount = 0;
	reg [8:0] vcount = 0;
	reg [8:0] cnt_out = 0;

	// horizontal TV (7 MHz)
	always @(posedge clk) if (c3)
		hcount <= line_start ? 9'b0 : hcount + 9'b1;

	// vertical TV (15.625 kHz)
	always @(posedge clk) if (line_start_s)
		vcount <= (vcount == (vperiod - 1)) ? 9'b0 : vcount + 9'b1;

	// horizontal VGA (14MHz)
	always @(posedge clk) if (f1)
		cnt_out <= vga_pix_start && c3 ? 9'b0 : cnt_out + 9'b1;

	// column address for DRAM
	always @(posedge clk)
    begin
		if (line_start2)
		begin
			cnt_col <= cstart;
			cptr <= 1'b0;
		end

        else
		if (video_pre_next)
		begin
			cnt_col <= cnt_col + 8'b1;
			cptr <= ~cptr;
		end
    end

	// row address for DRAM
	always @(posedge clk) if (c3)
		if (vis_start || (line_start && y_offs_wr_r))
			cnt_row <=  rstart;
		else
		if (line_start && vpix)
			cnt_row <=  cnt_row + 9'b1;


	// pixel counter
	always @(posedge clk) if (pix_stb)		// f1 or c3
		scnt <= pix_start ? 4'b0 : scnt + 4'b1;

	assign vga_cnt_in = {vcount[0], hcount - HBLNK_END};
	assign vga_cnt_out = {~vcount[0], cnt_out};


    // TS-line counter
    assign ts_raddr = hcount - hpix_beg;

	always @(posedge clk)
		if (ts_start_coarse)
			lcount <= vcount - vpix_beg + 9'b1;


// Y offset re-latch trigger
    reg y_offs_wr_r;
    always @(posedge clk)
        if (y_offs_wr)
            y_offs_wr_r <= 1'b1;
        else
        if (line_start_s)
            y_offs_wr_r <= 1'b0;

// FLASH generator
	reg [4:0] flash_ctr;
	assign frame = flash_ctr[0];
	assign flash = flash_ctr[4];
	always @(posedge clk)
		if (frame_start && c3)
		begin
			v60hz <= !cfg_60hz;		// re-sync of 60Hz mode selector
			flash_ctr <= flash_ctr + 5'b1;
		end

// sync strobes
	wire hs = (hcount >= HSYNC_BEG) && (hcount < HSYNC_END);
	wire vs = (vcount >= vsync_beg) && (vcount < vsync_end);

	assign tv_blank = tv_hblank || tv_vblank;
	wire tv_hblank = (hcount > HBLNK_BEG) && (hcount <= HBLNK_END);
	wire tv_vblank = (vcount >= vblnk_beg) && (vcount < vblnk_end);
	assign vga_blank = vga_hblank || vga_vblank;


	wire vga_hblank1 = (cnt_out > 9'd359);
	reg vga_hblank;
	always @(posedge clk) if (f1)		// fix me - bydlocode !!!
		vga_hblank <= vga_hblank1;

	wire hs_vga = ((hcount >= HSYNCV_BEG) && (hcount < HSYNCV_END)) ||
			((hcount >= (HSYNCV_BEG + HPERIOD/2)) && (hcount < (HSYNCV_END + HPERIOD/2)));

	wire vga_pix_start = ((hcount == (HBLNKV_END)) || (hcount == (HBLNKV_END + HPERIOD/2)));

	assign vga_line = (hcount >= HPERIOD/2);

	assign hvpix = hpix && vpix;
	
	assign hpix = (hcount >= hpix_beg) && (hcount < hpix_end);
	
	assign vpix = (vcount >= vpix_beg)        && (vcount < vpix_end);			// vertical pixels window
	assign v_ts = (vcount >= (vpix_beg - 1))  && (vcount < (vpix_end - 1));		// vertical TS window
    assign v_pf = (vcount >= (vpix_beg - 17)) && (vcount < (vpix_end - 9));		// vertical tilemap prefetch window

    always @(posedge clk)
		video_go <= (hcount >= (hpix_beg - go_offs - x_offs)) && (hcount < (hpix_end - go_offs - x_offs + 4)) && vpix && !nogfx;

	wire line_start = hcount == (HPERIOD - 1);
	assign line_start_s = line_start && c3;
	wire line_start2 = hcount == (HSYNC_END - 1);
	assign frame_start = line_start && (vcount == (vperiod - 1));
	wire vis_start = line_start && (vcount == (vblnk_end - 1));
	assign pix_start = hcount == (hpix_beg - x_offs - 1);
	wire ts_start_coarse = hcount == (hpix_beg - 1);
	assign ts_start = c3 && ts_start_coarse;
	assign int_start = (hcount == {hint_beg, 1'b0}) && (vcount == vint_beg) && c0;


	reg vga_vblank;
	always @(posedge clk) if (line_start_s)		// fix me - bydlocode !!!
		vga_vblank <= tv_vblank;


	always @(posedge clk)
	begin
		hsync <= sync_pol ^ hs_vga;
		vsync <= sync_pol ^ vs;
		csync <= ~(vs ^ hs);
	end


endmodule
