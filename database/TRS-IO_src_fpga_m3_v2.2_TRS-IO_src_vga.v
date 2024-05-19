// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// This module was contributed by Mathew Boytim <maboytim@yahoo.com>

module vga(
  input clk,
  input srst,
  input vga_clk, // 25 MHz
  input [7:0] TRS_A,
  input [7:0] TRS_D,
  input TRS_OUT,
  input TRS_IN,
  input io_access,
  output [7:0] hires_dout,
  output hires_dout_rdy,
  output hires_enable,
  output VGA_VID,
  output VGA_HSYNC,
  output VGA_VSYNC,
  output CRT_VID,
  output CRT_HSYNC,
  output CRT_VSYNC,
  input HZ50,
  input genlock);


// The VGA display is 640x480.
// Each row of the TRS-80 display is repeated two times for an effective resolution of
// 640x240.
// For convenience the VGA X is partitioned into a bit counter and a byte counter.
// The VGA Y counter is partitioned into a repeat count and line counter.
// count the character position and the position within the character resepctively.
reg [2:0] vga_xxx; // 0-7
reg [6:0] vga_XXXXXXX; // 0-79 active, -99 total (100)
reg [9:0] vga_YYYYYYYYY_y; // 0-479 active, -524 total (525)
// VGA in active area.
wire vga_act = ( (vga_XXXXXXX < 7'd80)
               & (vga_YYYYYYYYY_y < 10'd480));

// The CRT is true 240 lines - half of the VGA 480.
// The pixel rate is half that of the VGA so the CRT outputs 640 pixels in one line in
// the same time that the VGA outputs 1280 pixels in two lines.
// To synchronize the VGA and CRT accesses to the RAM the same byte counter is used
// except the CRT makes an actual memory access only every other time.  For the CRT the
// lsb of vga_xxx is essentially a divide by two of the VGA bitclock.
// The CRT X is partitioned into the msb of the bit counter and a byte counter.
reg [7:0] crt_XXXXXXX_x;
reg [8:0] crt_YYYYYYYYY;
// CRT in active area.
wire crt_act = ( (crt_XXXXXXX_x[7:1] < 7'd80)
               & (crt_YYYYYYYYY < 9'd240));

// Instantiate the display RAM.  The display RAM is dual port.
// The A port is connected to the z80.
// The B port is connected to the video logic.
wire [7:0] _z80_dsp_data;
wire [7:0] z80_dsp_data_b;


// hires graphics.
wire [6:0] hires_XXXXXXX = vga_XXXXXXX; // 0-79 active
wire [7:0] hires_YYYYYYYY = vga_YYYYYYYYY_y[8:1]; // 0-239 active
// Hires in active area.
wire hires_act = vga_act;

// Hi-res board
wire z80_hires_x_sel_out = (TRS_A == 8'h80) & ~TRS_OUT; // 80
wire z80_hires_y_sel_out = (TRS_A == 8'h81) & ~TRS_OUT; // 81
wire z80_hires_data_sel_out = (TRS_A == 8'h82) & ~TRS_OUT; // 82
wire z80_hires_data_sel_in  = (TRS_A == 8'h82) & ~TRS_IN; // 82
wire z80_hires_options_sel_out = (TRS_A == 8'h83) & ~TRS_OUT; // 83

reg [6:0] z80_hires_x_reg;
reg [7:0] z80_hires_y_reg;
reg [7:0] z80_hires_options_reg = 8'hFC;
wire hires_options_graphics_alpha_n = z80_hires_options_reg[0];
wire hires_options_unused           = z80_hires_options_reg[1];
wire hires_options_x_dec_inc_n      = z80_hires_options_reg[2];
wire hires_options_y_dec_inc_n      = z80_hires_options_reg[3];
wire hires_options_x_read_clk_n     = z80_hires_options_reg[4];
wire hires_options_y_read_clk_n     = z80_hires_options_reg[5];
wire hires_options_x_write_clk_n    = z80_hires_options_reg[6];
wire hires_options_y_write_clk_n    = z80_hires_options_reg[7];


wire hires_rd_en, hires_rd_regce;

trigger hires_rd_trigger (
  .clk(clk),
  .cond(io_access & z80_hires_data_sel_in),
  .one(hires_rd_en),
  .two(hires_rd_regce),
  .three(hires_dout_rdy)
);

wire hires_wr_en;

trigger hires_wr_trigger (
  .clk(clk),
  .cond(io_access & z80_hires_data_sel_out),
  .one(),
  .two(hires_wr_en),
  .three()
);


always @(posedge clk)
begin
   if(io_access & z80_hires_x_sel_out)
      z80_hires_x_reg <= TRS_D[6:0];
   else if((hires_rd_en & ~hires_options_x_read_clk_n ) | 
           (hires_wr_en & ~hires_options_x_write_clk_n) )
   begin
      if(hires_options_x_dec_inc_n)
         z80_hires_x_reg <= z80_hires_x_reg - 7'd1;
      else
         z80_hires_x_reg <= z80_hires_x_reg + 7'd1;
   end

   if(io_access & z80_hires_y_sel_out)
      z80_hires_y_reg <= TRS_D;
   else if((hires_rd_en & ~hires_options_y_read_clk_n ) | 
           (hires_wr_en & ~hires_options_y_write_clk_n) )
   begin
      if(hires_options_y_dec_inc_n)
         z80_hires_y_reg <= z80_hires_y_reg - 8'd1;
      else
         z80_hires_y_reg <= z80_hires_y_reg + 8'd1;
   end
end

always @(posedge clk)
begin
   if(srst)
      z80_hires_options_reg <= 8'hFC;
   else
   begin
      if(io_access & z80_hires_options_sel_out)
         z80_hires_options_reg <= TRS_D;
   end
end


wire [7:0] hires_data_b;

/*
 * True Dual Port RAM, Byte Write Enable, Byte size: 8
 * Port A: Read/Write Width: 8, Write depth: 20480, Operating Mode: Write First,
 *         Core Output Registers, REGCEA Pin
 * Port B: Read/Write Width: 8, Write depth: 20480, Operating Mode: Read First,
 *         Core Output Registers, REGCEB Pin
 * Coe file: splash_hires.mi
 */
blk_mem_gen_4 z80_hires (
   .clka(clk), // input
   .cea(hires_rd_en | hires_wr_en), // input
   .ada({z80_hires_x_reg, z80_hires_y_reg}), // input [14:0]
   .wrea(hires_wr_en), // input
   .dina(TRS_D), // input [7:0]
   .douta(hires_dout), // output [7:0]
   .ocea(hires_rd_regce),
   .reseta(1'b0),
 
   .clkb(vga_clk), // input
   .ceb(vga_xxx[2] ? (hires_act & (vga_xxx[1:0] == 2'b00)) : (crt_act & (crt_XXXXXXX_x[0] == 1'b0 && vga_xxx == 2'b00))), // input
   .adb(vga_xxx[2] ? {hires_XXXXXXX, hires_YYYYYYYY} : {crt_XXXXXXX_x[7:1], crt_YYYYYYYYY[7:0]}), // input [14:0]
   .wreb(1'b0), // input
   .dinb(8'h00), // input [7:0]
   .doutb(hires_data_b), // output [7:0]
   .oceb(vga_xxx[2] ? (hires_act & (vga_xxx[1:0] == 2'b01)) : (crt_act & (crt_XXXXXXX_x[0] == 1'b0 && vga_xxx == 2'b01))), // input
   .resetb(1'b0)
 );


// Bump the VGA counters.
always @ (posedge vga_clk)
begin
   if(genlock)
   begin
      vga_xxx <= 3'b000;
      vga_XXXXXXX <= 7'd0;
      vga_YYYYYYYYY_y <= 10'd0;
   end
   else
   begin
      if(vga_xxx == 3'b111)
      begin
         if(vga_XXXXXXX == 7'd99)
         begin
            vga_XXXXXXX <= 7'd0;

            if(vga_YYYYYYYYY_y == 10'd524)
               vga_YYYYYYYYY_y <= 10'd0;
            else
               vga_YYYYYYYYY_y <= vga_YYYYYYYYY_y + 10'd1;
         end
         else
            vga_XXXXXXX <= vga_XXXXXXX + 7'd1;
      end
      vga_xxx <= vga_xxx + 3'b1;
   end
end


// Bump the CRT counters.
always @ (posedge vga_clk)
begin
   if(vga_xxx == 3'b111)
   begin
      if(crt_XXXXXXX_x == {7'd99, 1'b1})
      begin
         crt_XXXXXXX_x <= 8'd0;
         if(crt_YYYYYYYYY == (HZ50 ? 9'd311 : 9'd263))
           crt_YYYYYYYYY <= 9'd0;
        else
           crt_YYYYYYYYY <= crt_YYYYYYYYY + 9'd1;
      end
      else
         crt_XXXXXXX_x <= crt_XXXXXXX_x + 8'd1;
   end
end


// Load the hires pixel data into the pixel shift register, or shift current contents.
reg [7:0] hires_pixel_shift_reg;
 
always @ (posedge vga_clk)
begin
   if(vga_xxx == 3'b110)
   begin
      if(hires_act)
         hires_pixel_shift_reg <= hires_data_b;
      else
         hires_pixel_shift_reg <= 8'h00;
   end
   else
      hires_pixel_shift_reg <= {hires_pixel_shift_reg[6:0], 1'b0};
end


// Load the crt pixel data into the crt shift register, or shift current contents.
reg [7:0] crt_pixel_shift_reg;

always @ (posedge vga_clk)
begin
   if(crt_XXXXXXX_x[0] == 1'b0 && vga_xxx == 3'b010)
   begin
      if(crt_act)
         crt_pixel_shift_reg <= hires_data_b;
      else
         crt_pixel_shift_reg <= 8'h00;
   end
   else
      if(vga_xxx[0] == 1'b0)
         crt_pixel_shift_reg <= {crt_pixel_shift_reg[6:0], 1'b0};
end


reg vga_hsync, vga_vsync;

always @ (posedge vga_clk)
begin
   if({vga_XXXXXXX, vga_xxx} == 10'd655)
      vga_hsync <= 1'b1;
   else if({vga_XXXXXXX, vga_xxx} == 10'd751)
      vga_hsync <= 1'b0;

   if({vga_XXXXXXX, vga_xxx} == 10'd799)
      if(vga_YYYYYYYYY_y == 10'd489)
         vga_vsync <= 1'b1;
      else if(vga_YYYYYYYYY_y == 10'd491)
         vga_vsync <= 1'b0;
end


reg crt_hsync, crt_vsync;

always @ (posedge vga_clk)
begin
   if(crt_XXXXXXX_x[0] == 1'b1 && vga_xxx == 3'b111)
   begin
      if(crt_XXXXXXX_x[7:1] == 7'd84)
         crt_hsync <= 1'b1;
      else if(crt_XXXXXXX_x[7:1] == 7'd92)
         crt_hsync <= 1'b0;

      if(crt_XXXXXXX_x[7:1] == 7'd99)
         if(crt_YYYYYYYYY == (HZ50 ? 9'd271 : 9'd240))
            crt_vsync <= 1'b1;
         else if(crt_YYYYYYYYY == (HZ50 ? 9'd287 : 9'd256))
            crt_vsync <= 1'b0;
   end
end


reg vga_vid_out, vga_hsync_out, vga_vsync_out;

always @ (posedge vga_clk)
begin
   vga_vid_out <= hires_pixel_shift_reg[7];
   vga_hsync_out <= vga_hsync;
   vga_vsync_out <= vga_vsync;
end

assign VGA_VID   = vga_vid_out;
assign VGA_HSYNC = vga_hsync_out;
assign VGA_VSYNC = vga_vsync_out;

assign CRT_VID   = crt_pixel_shift_reg[7];
assign CRT_HSYNC = crt_hsync;
assign CRT_VSYNC = crt_vsync;

assign hires_enable = hires_options_graphics_alpha_n;

endmodule
