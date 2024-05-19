// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// This module was contributed by Mathew Boytim <maboytim@yahoo.com>

module vga3(
  input clk,
  input srst,
  input vga_clk, // 25 MHz
  input [15:0] TRS_A,
  input [7:0] TRS_D,
  input TRS_WR,
  input TRS_OUT,
  input TRS_IN,
  input io_access,
  output [7:0] hires_dout,
  output hires_dout_rdy,
  output hires_enable,
  output VGA_VID,
  output VGA_HSYNC,
  output VGA_VSYNC,
  input genlock);


// The VGA display is 640x480.
// Each row of the TRS-80 display is repeated two times for an effective resolution of
// 640x240 which larger than the 512x192 native resolution of the M3 text display
// resulting in a small border around the M3 text display.
// In 64x16 mode the characters are 8x12 or 8x24 when rows are repeated.
// For convenience the VGA X and Y counters are partitioned into high and low parts which
// count the character position and the position within the character resepctively.
reg [2:0] vga_xxx;     // 0-7
reg [6:0] vga_XXXXXXX; // 0-79 active, -99 total
reg [4:0] vga_yyyy_y;  // 0-23 in 64x16 mode
reg [4:0] vga_YYYYY;   // 0-19 active, -20-20/24 total in 64x16 mode
// VGA in active area.
wire vga_act = ( (vga_XXXXXXX < 7'd80)
               & (vga_YYYYY < 5'd20));

// Instantiate the display RAM.  The display RAM is dual port.
// The A port is connected to the z80.
// The B port is connected to the video logic.
wire [7:0] dsp_data_b;

// Center the 64x16 text display in the 640x480 VGA display.
wire [6:0] dsp_XXXXXXX = vga_XXXXXXX - 7'd8;
wire [2:0] dsp_xxx     = vga_xxx;
wire [4:0] dsp_YYYYY   = vga_YYYYY   - 5'd2;
wire [4:0] dsp_yyyy_y  = vga_yyyy_y;

// Display in active area.
wire dsp_act = ((dsp_XXXXXXX < 7'd64) & (dsp_YYYYY < 5'd16));

// 64/32 column display mode.
// If modsel=1 then in 32 column mode.
// in 32 column mode only the even columns are active.
wire z80_outsig_sel_out = (TRS_A[7:0] == 8'hFF) & ~TRS_OUT;

reg z80_outsig_modesel = 1'b0;

always @(posedge clk)
begin
   if(io_access & z80_outsig_sel_out)
      z80_outsig_modesel <= TRS_D[3];
end

reg reg_modsel = 1'b0;

// Synchronize to vga clock.
always @ (posedge vga_clk)
begin
   reg_modsel <= z80_outsig_modesel;
end

wire z80_dsp_sel = (TRS_A[15:10] == (16'h3C00 >> 10));

wire z80_dsp_wr_en;

trigger z80_dsp_wr_trigger (
  .clk(clk),
  .cond(io_access & z80_dsp_sel & ~TRS_WR),
  .one(),
  .two(z80_dsp_wr_en),
  .three()
);

/*
 * True Dual Port RAM, Byte Write Enable, Byte size: 8
 * Port A: Read/Write Width: 8, Write depth: 1024, Operating Mode: Write First,
 *         Core Output Registers, REGCEA Pin
 * Port B: Read/Write Width: 8, Write depth: 1024, Operating Mode: Read First,
 *         Core Output Registers, REGCEB Pin
 * Fill remaining memory locations: 0x20
 */
display_ram z80_dsp (
   .clka(clk), // input
   .cea(z80_dsp_wr_en), // input
   .ada(TRS_A[9:0]), // input [9:0]
   .wrea(1'b1), // input
   .dina(TRS_D), // input [7:0]
   .douta(), // output [7:0]
   .ocea(1'b0),
   .reseta(1'b0),

   .clkb(vga_clk), // input
   .ceb(dsp_act & (dsp_xxx == 3'b010)), // input
   .adb({dsp_YYYYY[3:0], dsp_XXXXXXX[5:1], (dsp_XXXXXXX[0] & ~reg_modsel)}), // input [9:0]
   .wreb(1'b0), // input
   .dinb(8'h00), // input [7:0]
   .doutb(dsp_data_b), // output [7:0]
   .oceb(dsp_act & (dsp_xxx == 3'b011)), // input
   .resetb(1'b0)
);

// Disable the splash screen and border on first write to text display.
reg splash_en = 1'b1;

always @(posedge clk)
begin
   if(io_access & z80_dsp_sel & ~TRS_WR)
      splash_en <= 1'b0;
end

// hires graphics.
wire [6:0] hires_XXXXXXX = vga_XXXXXXX; // 0-79 active
wire [7:0] hires_YYYYYYYY = (vga_YYYYY << 3) + (vga_YYYYY << 2) + vga_yyyy_y[4:1]; // 0-239 active
// Hires in active area.
wire hires_act = vga_act;

// Hi-res board
wire z80_hires_x_sel_out = (TRS_A[7:0] == 8'h80) & ~TRS_OUT; // 80
wire z80_hires_y_sel_out = (TRS_A[7:0] == 8'h81) & ~TRS_OUT; // 81
wire z80_hires_data_sel_out = (TRS_A[7:0] == 8'h82) & ~TRS_OUT; // 82
wire z80_hires_data_sel_in  = (TRS_A[7:0] == 8'h82) & ~TRS_IN; // 82
wire z80_hires_options_sel_out = (TRS_A[7:0] == 8'h83) & ~TRS_OUT; // 83

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
      z80_hires_options_reg <= {7'h7E, splash_en};
   else
   begin
      if(io_access & z80_hires_options_sel_out & ~splash_en)
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
blk_mem_gen_6 z80_hires (
   .clka(clk), // input
   .cea(hires_rd_en | hires_wr_en), // input
   .ada({z80_hires_x_reg, z80_hires_y_reg}), // input [14:0]
   .wrea(hires_wr_en), // input
   .dina(TRS_D), // input [7:0]
   .douta(hires_dout), // output [7:0]
   .ocea(hires_rd_regce),
   .reseta(1'b0),
 
   .clkb(vga_clk), // input
   .ceb(hires_act & (vga_xxx == 3'b100)), // input
   .adb({hires_XXXXXXX, hires_YYYYYYYY}), // input [14:0]
   .wreb(1'b0), // input
   .dinb(8'h00), // input [7:0]
   .doutb(hires_data_b), // output [7:0]
   .oceb(hires_act & (vga_xxx == 3'b101)), // input
   .resetb(1'b0)
 );
 
// Instantiate the character generator ROM.
// The character ROM has a latency of 2 clock cycles.
wire [7:0] char_rom_data;

/*
 * Single Port ROM
 * Port A: Width: 8, Depth: 2048, Primitives Output Register, REGCEA Pin
 *         Load Init File: trs80m1_chr.coe
 */
blk_mem_gen_5 char_rom (
   .clk(vga_clk), // input
   .ce(dsp_act & (dsp_yyyy_y[4] == 1'b0) & (dsp_xxx == 3'b100)),
   .ad({1'b0, dsp_data_b[6:0], dsp_yyyy_y[3:1]}), // input [10:0]
   .dout(char_rom_data), // output [7:0]
   .oce(dsp_act & (dsp_yyyy_y[4] == 1'b0) & (dsp_xxx == 3'b101)),
   .reset(1'b0)
);

// Latch the character rom address with the same latency as the rom.
// This is the block graphic.
reg [11:0] char_rom_addr, _char_rom_addr;

always @ (posedge vga_clk)
begin
   if(dsp_act & (dsp_xxx == 3'b100))
      _char_rom_addr <= {dsp_data_b, dsp_yyyy_y[4:1]};
   if(dsp_act & (dsp_xxx == 3'b101))
      char_rom_addr <= _char_rom_addr;
end


// Bump the VGA counters.
always @ (posedge vga_clk)
begin
   if(genlock)
   begin
      vga_xxx <= 3'b000;
      vga_XXXXXXX <= 7'd0;
      vga_yyyy_y <= 5'd0;
      vga_YYYYY <= 5'd0;
   end
   else
   begin
      if(vga_xxx == 3'b111)
      begin
         if(vga_XXXXXXX == 7'd99)
         begin
            vga_XXXXXXX <= 7'd0;

            if({vga_YYYYY, vga_yyyy_y} == {5'd20, 5'd20})
            begin
               vga_yyyy_y <= 5'd0;
               vga_YYYYY <= 5'd0;
            end
            else if(vga_yyyy_y == 5'd23)
            begin
               vga_yyyy_y <= 5'd0;
               vga_YYYYY <= vga_YYYYY + 5'd1;
            end
            else
               vga_yyyy_y <= vga_yyyy_y + 5'd1;
         end
         else
            vga_XXXXXXX <= vga_XXXXXXX + 7'd1;
      end
      vga_xxx <= vga_xxx + 3'b1;
   end
end


// Load the text/hires pixel data into the pixel shift register, or shift current contents.
reg [7:0] txt_pixel_shift_reg;

always @ (posedge vga_clk)
begin
   // Because of the memory pipelining the pixel shift registers
   // always load when dsp_xxx == 3'b110, otherwise they shift. 
   if(dsp_xxx == 3'b110)
   begin
      // If the msb is 1 then it's block graphic.
      // Otherwise it's character data from the character rom.
      if(dsp_act)
      begin
         if(char_rom_addr[11] == 1'b0)
         begin
            if(reg_modsel)
               txt_pixel_shift_reg <= ( char_rom_addr[3] ? 8'h00 :
                  ( ~dsp_XXXXXXX[0] ? {{2{char_rom_data[7]}}, {2{char_rom_data[6]}}, {2{char_rom_data[5]}}, {2{char_rom_data[4]}}}
                                    : {{2{char_rom_data[3]}}, {2{char_rom_data[2]}}, {2{char_rom_data[1]}}, {2{char_rom_data[0]}}} ) );
            else
               txt_pixel_shift_reg <= (char_rom_addr[3] ? 8'h00 : char_rom_data);
         end
         else
         begin
            // The character is 12 rows.
            if(reg_modsel)
               case(char_rom_addr[3:2])
                  2'b00: txt_pixel_shift_reg <= ( ~dsp_XXXXXXX[0] ? {8{char_rom_addr[4]}} : {8{char_rom_addr[5]}} );
                  2'b01: txt_pixel_shift_reg <= ( ~dsp_XXXXXXX[0] ? {8{char_rom_addr[6]}} : {8{char_rom_addr[7]}} );
                  2'b10: txt_pixel_shift_reg <= ( ~dsp_XXXXXXX[0] ? {8{char_rom_addr[8]}} : {8{char_rom_addr[9]}} );
                  2'b11: txt_pixel_shift_reg <= 8'h00; // should never happen
               endcase
            else
               case(char_rom_addr[3:2])
                  2'b00: txt_pixel_shift_reg <= {{4{char_rom_addr[4]}}, {4{char_rom_addr[5]}}};
                  2'b01: txt_pixel_shift_reg <= {{4{char_rom_addr[6]}}, {4{char_rom_addr[7]}}};
                  2'b10: txt_pixel_shift_reg <= {{4{char_rom_addr[8]}}, {4{char_rom_addr[9]}}};
                  2'b11: txt_pixel_shift_reg <= 8'h00; // should never happen
               endcase
         end
      end
      else
      begin
         txt_pixel_shift_reg <= 8'h00;
      end
   end
   else
      txt_pixel_shift_reg <= {txt_pixel_shift_reg[6:0], 1'b0};
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


reg vga_hsync, vga_vsync;

always @ (posedge vga_clk)
begin
   if({vga_XXXXXXX, vga_xxx} == {7'd82, 3'b010})
      vga_hsync <= 1'b1;
   else if({vga_XXXXXXX, vga_xxx} == {7'd94, 3'b010})
      vga_hsync <= 1'b0;

   if({vga_YYYYY, vga_yyyy_y} == {5'd20, 5'd9})
      vga_vsync <= 1'b1;
   else if({vga_YYYYY, vga_yyyy_y} == {5'd20, 5'd11})
      vga_vsync <= 1'b0;
end


reg vga_vid_out, vga_hsync_out, vga_vsync_out;

always @ (posedge vga_clk)
begin
   vga_vid_out <= (txt_pixel_shift_reg[7] ^ (hires_pixel_shift_reg[7] & (hires_options_graphics_alpha_n | splash_en)));
   vga_hsync_out <= vga_hsync;
   vga_vsync_out <= vga_vsync;
end

assign hires_enable = hires_options_graphics_alpha_n;

assign VGA_VID   = vga_vid_out;
assign VGA_HSYNC = vga_hsync_out;
assign VGA_VSYNC = vga_vsync_out;

endmodule
