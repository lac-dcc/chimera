// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// This module was contributed by Mathew Boytim <maboytim@yahoo.com>

module vga(
  input clk,
  input vga_clk, // 20 MHz
  input [15:0] TRS_A,
  input [7:0] TRS_D,
  input TRS_WR,
  input TRS_RD,
  input TRS_OUT,
  input TRS_IN,
  output [7:0] TRS_Q,
  output [7:0] le18_dout,
  output le18_dout_rdy,
  output VGA_RGB,
  output VGA_HSYNC,
  output VGA_VSYNC,
  input reset);

// The VGA display is 800x600.
// The pixel clock is divided by two and each row of the TRS-80 display is repeated three times
// for an effective resolution of 400x200 which slightly larger than the 384x192 native
// resolution of the M1 display resulting in a small border around the M1 display.
// In 64x16 mode the characters are 6x12 or 6x36 when rows are repeated.
// For convenience the VGA X and Y counters are partitioned into high and low parts which
// count the character position and the position within the charater resepctively.
reg [2:0] vga_xxx;     // 0-5
reg [6:0] vga_XXXXXXX; // 0-66-2/6 active, -87 total
reg [5:0] vga_yyyy_yy; // vga_yyyy_yy[5:2] = 0-11, vga_yyyy_yy[0:1]=0-2 in 64x16 mode
reg [4:0] vga_YYYYY;   // 0-16-23/36 active, -17-15/36 total in 64x16 mode
// VGA in active area.
wire vga_act = ( (vga_XXXXXXX < 7'd67)
               & ((vga_YYYYY < 5'd16) | ((vga_YYYYY == 5'd16) & (vga_yyyy_yy[5:2] < 4'd8))));

// Instantiate the display RAM.  The display RAM is dual port.
// The A port is connected to the z80.
// The B port is connected to the video logic.
wire [7:0] _z80_dsp_data;
wire [7:0] z80_dsp_data_b;

// Center the 64x16 text/le18 display in the 800x600 VGA display.
//wire [6:0] dsp_XXXXXXX = vga_XXXXXXX - 7'd1;
wire [6:0] dsp_XXXXXXX = ((|vga_xxx[2:1]) ? (vga_XXXXXXX - 7'd1) : (vga_XXXXXXX - 7'd2));
wire [2:0] dsp_xxx     = ((|vga_xxx[2:1]) ? (vga_xxx   - 3'b010) : (vga_xxx   + 3'b100));
//wire [4:0] dsp_YYYYY   = vga_YYYYY   - 5'd0;
wire [4:0] dsp_YYYYY   =  ((|vga_yyyy_yy[5:4]) ? (vga_YYYYY        - 5'd0) : (vga_YYYYY        - 5'd1));
wire [5:0] dsp_yyyy_yy = {((|vga_yyyy_yy[5:4]) ? (vga_yyyy_yy[5:2] - 4'd4) : (vga_yyyy_yy[5:2] + 4'd8)), vga_yyyy_yy[1:0]};

// Display in active area.
wire dsp_act = ((dsp_XXXXXXX < 7'd64) & (dsp_YYYYY < 5'd16));

// 64/32 column display mode.
// If modsel=1 then in 32 column mode.
// in 32 column mode only the even columns are active.
wire z80_outsig_sel_out = (TRS_A[7:0] == 8'hff) & TRS_OUT;

reg z80_outsig_modesel = 1'b0;

always @(posedge clk)
begin
   if(z80_outsig_sel_out)
      z80_outsig_modesel <= TRS_D[3];
end

reg reg_modsel = 1'b0;

// Synchronize to vga clock.
always @ (posedge vga_clk)
begin
   reg_modsel <= z80_outsig_modesel;
end

wire z80_dsp_sel = (TRS_A[15:10] == 6'b001111);

wire z80_dsp_wr_en;

trigger z80_dsp_wr_trigger (
  .clk(clk),
  .cond(TRS_WR & z80_dsp_sel),
  .one(z80_dsp_wr_en),
  .two(),
  .three()
);

wire z80_dsp_rd_en;

trigger z80_dsp_rd_trigger (
  .clk(clk),
  .cond(TRS_RD & z80_dsp_sel),
  .one(z80_dsp_rd_en),
  .two(),
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
   .cea(z80_dsp_rd_en | z80_dsp_wr_en), // input
   .ada(TRS_A[9:0]), // input [9:0]
   .wrea(z80_dsp_wr_en), // input
   .dina(TRS_D), // input [7:0]
   .douta(TRS_Q), // output [7:0]
   .ocea(1'b0),
   .reseta(1'b0),

   .clkb(vga_clk), // input
   .ceb(dsp_act & (dsp_xxx == 3'b000)), // input
   .adb({dsp_YYYYY[3:0], dsp_XXXXXXX[5:1], (dsp_XXXXXXX[0] & ~reg_modsel)}), // input [9:0]
   .wreb(1'b0), // input
   .dinb(8'h00), // input [7:0]
   .doutb(z80_dsp_data_b), // output [7:0]
   .oceb(dsp_act & (dsp_xxx == 3'b001)), // input
   .resetb(1'b0)
);

// Disable the splash screen and border on first write to test display.
reg splash_en = 1'b1;

always @ (posedge clk)
begin
   if(z80_dsp_sel & TRS_WR)
      splash_en <= 1'b0;
end

// le18 graphics.
wire [6:0] le18_XXXXXXX = dsp_XXXXXXX;
wire [7:0] le18_YYYYYYYY = (dsp_YYYYY << 3) + (dsp_YYYYY << 2) + dsp_yyyy_yy[5:2]; // 0-191 active

wire z80_le18_data_sel = (TRS_A[7:0] == 8'hec);
wire z80_le18_x_sel_out = (TRS_A[7:0] == 8'hed) & TRS_OUT;
wire z80_le18_y_sel_out = (TRS_A[7:0] == 8'hee) & TRS_OUT;
wire z80_le18_options_out = (TRS_A[7:0] == 8'hef) & TRS_OUT;

reg [5:0] z80_le18_x_reg;
reg [7:0] z80_le18_y_reg;
reg [0:0] z80_le18_options_reg = 1'b0;

always @(posedge clk)
begin
   if(z80_le18_x_sel_out)
      z80_le18_x_reg <= TRS_D[5:0];

   if(z80_le18_y_sel_out)
      z80_le18_y_reg <= TRS_D;

   if(z80_le18_options_out &~ splash_en)
      z80_le18_options_reg <= TRS_D[0];
end

wire le18_enable = z80_le18_options_reg[0];


wire [5:0] z80_le18_data_b;

wire le18_rd_en, le18_rd_regce;

trigger le18_rd_trigger (
  .clk(clk),
  .cond(TRS_IN & z80_le18_data_sel),
  .one(le18_rd_en),
  .two(le18_rd_regce),
  .three(le18_dout_rdy)
);

wire le18_wr_en;

trigger le18_wr_trigger (
  .clk(clk),
  .cond(TRS_OUT & z80_le18_data_sel),
  .one(le18_wr_en),
  .two(),
  .three()
);

/*
 * True Dual Port RAM, Byte Write Enable, Byte size: 8
 * Port A: Read/Write Width: 6, Write depth: 16384, Operating Mode: Write First,
 *         Core Output Registers, REGCEA Pin
 * Port B: Read/Write Width: 6, Write depth: 16384, Operating Mode: Read First,
 *         Core Output Registers, REGCEB Pin
 * Coe file: splash_le18.coe
 */
blk_mem_gen_4 z80_le18 (
   .clka(clk), // input
   .cea(le18_rd_en | le18_wr_en), // input
   .ada({z80_le18_y_reg, z80_le18_x_reg}), // input [13:0]
   .wrea(le18_wr_en), // input
   .dina(TRS_D[5:0]), // input [5:0]
   .douta(le18_dout[5:0]), // output [5:0]
   .ocea(le18_rd_regce),
   .reseta(1'b0),
 
   .clkb(vga_clk), // input
   .ceb(dsp_act & (dsp_xxx == 3'b010)), // input
   .adb({le18_YYYYYYYY, le18_XXXXXXX[5:0]}), // input [13:0]
   .wreb(1'b0), // input
   .dinb(6'h00), // input [5:0]
   .doutb(z80_le18_data_b), // output [5:0]
   .oceb(dsp_act & (dsp_xxx == 3'b011)), // input
   .resetb(1'b0)
 );
 
// Instantiate the character generator ROM.
// The character ROM has a latency of 2 clock cycles.
wire [4:0] char_rom_data;

/*
 * Single Port ROM
 * Port A: Width: 5, Depth: 1024, Primitives Output Register, REGCEA Pin
 *         Load Init File: trs80m1_chr.coe
 */
blk_mem_gen_3 char_rom (
   .clk(vga_clk), // input
   .ce(dsp_act & (dsp_yyyy_yy[5] == 1'b0) & (dsp_xxx == 3'b010)),
   .ad({z80_dsp_data_b[6:0], dsp_yyyy_yy[4:2]}), // input [9:0]
   .wre(1'b0),
   .din(5'b00000),
   .dout(char_rom_data), // output [4:0]
   .oce(dsp_act & (dsp_yyyy_yy[5] == 1'b0) & (dsp_xxx == 3'b011)),
   .reset(1'b0)
);

// Latch the character rom address with the same latency as the rom.
// This is the block graphic.
reg [11:0] char_rom_addr, _char_rom_addr;

always @ (posedge vga_clk)
begin
   if(dsp_act & (dsp_xxx == 3'b010))
      _char_rom_addr <= {z80_dsp_data_b, dsp_yyyy_yy[5:2]};
   if(dsp_act & (dsp_xxx == 3'b011))
      char_rom_addr <= _char_rom_addr;
end


// Bump the VGA counters.
always @ (posedge vga_clk)
begin
   if(reset)
   begin
      vga_xxx <= 3'b000;
      vga_XXXXXXX <= 7'd0;
      vga_yyyy_yy <= {4'd0, 2'b00};
      vga_YYYYY <= 5'd0;
   end
   else
   if(vga_xxx == 3'b101)
   begin
      vga_xxx <= 3'b000;
      if(vga_XXXXXXX == 7'd87)
      begin
         vga_XXXXXXX <= 7'd0;

         if({vga_YYYYY, vga_yyyy_yy} == {5'd17, {4'd5, 2'b00}})
         begin
            vga_yyyy_yy <= {4'd0, 2'b00};
            vga_YYYYY <= 5'd0;
         end
         else if(vga_yyyy_yy[1:0] == 2'b10)
         begin
            vga_yyyy_yy[1:0] = 2'b00;
            if(vga_yyyy_yy[5:2] == 5'd11)
            begin
               vga_yyyy_yy[5:2] <= 4'd0;
               vga_YYYYY <= vga_YYYYY + 5'd1;
            end
            else
               vga_yyyy_yy[5:2] <= vga_yyyy_yy[5:2] + 4'd1;
         end
         else
            vga_yyyy_yy[1:0] <= vga_yyyy_yy[1:0] + 2'b1;
      end
      else
         vga_XXXXXXX <= vga_XXXXXXX + 7'd1;
   end
   else
      vga_xxx <= vga_xxx + 3'b1;
end


// Load the text/le18 pixel data into the pixel shift register, or shift current contents.
reg [5:0] txt_pixel_shift_reg;
reg [5:0] le18_pixel_shift_reg;
reg [5:0] dsp_pixel_act_shift_reg;

always @ (posedge vga_clk)
begin
   // Because of the memory pipelining the pixel shift registers
   // always load when dsp_xxx == 3'b100, otherwise they shift. 
   if(dsp_xxx == 3'b100)
   begin
   // If the msb is 1 then it's block graphic.
   // Otherwise it's character data from the character rom.
   if(dsp_act)
   begin
      if(char_rom_addr[11] == 1'b0)
      begin
         if(reg_modsel)
            txt_pixel_shift_reg <= ( char_rom_addr[3] ? 6'h00 :
               ( ~dsp_XXXXXXX[0] ? { 2'b00,                {2{char_rom_data[4]}}, {2{char_rom_data[3]}}}
                                 : {{2{char_rom_data[2]}}, {2{char_rom_data[1]}}, {2{char_rom_data[0]}}} ) );
         else
            txt_pixel_shift_reg <= (char_rom_addr[3] ? 6'h00 : {1'b0, char_rom_data});
      end
      else
      begin
         // The character is 12 rows.
         if(reg_modsel)
            case(char_rom_addr[3:2])
               2'b00: txt_pixel_shift_reg <= ( ~dsp_XXXXXXX[0] ? {6{char_rom_addr[4]}} : {6{char_rom_addr[5]}} );
               2'b01: txt_pixel_shift_reg <= ( ~dsp_XXXXXXX[0] ? {6{char_rom_addr[6]}} : {6{char_rom_addr[7]}} );
               2'b10: txt_pixel_shift_reg <= ( ~dsp_XXXXXXX[0] ? {6{char_rom_addr[8]}} : {6{char_rom_addr[9]}} );
               2'b11: txt_pixel_shift_reg <= 6'h00; // should never happen
            endcase
         else
            case(char_rom_addr[3:2])
               2'b00: txt_pixel_shift_reg <= {{3{char_rom_addr[4]}}, {3{char_rom_addr[5]}}};
               2'b01: txt_pixel_shift_reg <= {{3{char_rom_addr[6]}}, {3{char_rom_addr[7]}}};
               2'b10: txt_pixel_shift_reg <= {{3{char_rom_addr[8]}}, {3{char_rom_addr[9]}}};
               2'b11: txt_pixel_shift_reg <= 6'h00; // should never happen
            endcase
      end
      // For LE18 the leftmost bit is bit 0 so load the shift register in bit reversed order.
      le18_pixel_shift_reg <= {z80_le18_data_b[0], z80_le18_data_b[1], z80_le18_data_b[2],
                               z80_le18_data_b[3], z80_le18_data_b[4], z80_le18_data_b[5]};
      dsp_pixel_act_shift_reg <= 6'h3f;
   end
   else
   begin
      txt_pixel_shift_reg <= 6'h00;
      le18_pixel_shift_reg <= 6'h00;
      dsp_pixel_act_shift_reg <= 6'h00;
   end
   end
   else
   begin
      txt_pixel_shift_reg <= {txt_pixel_shift_reg[4:0], 1'b0};
      le18_pixel_shift_reg <= {le18_pixel_shift_reg[4:0], 1'b0};
      dsp_pixel_act_shift_reg <= {dsp_pixel_act_shift_reg[4:0], 1'b0};
   end
end

// Load the vga pixel data into the pixel shift register, or shift current contents.
reg [5:0] vga_pixel_shift_reg;

always @ (posedge vga_clk)
begin
   // Because of the memory pipelining the text/le18 pixel shift registers
   // always load when dsp_xxx == 3'b100.  The vga pixel shift register must do
   // likewise to maintain the proper offset between the vga and display/le18.
   // Load the vga pixel shift register when vga_xxx == 3'b100, otherwise shift. 
   if(vga_xxx == 3'b100)
   begin
      if(vga_act)
         //vga_pixel_shift_reg <= (vga_XXXXXXX == 7'd66) ? ((vga_yyyy_yy[2] ^ vga_yyyy_yy[0]) ? 6'h14 : 6'h28)
         //                                              : ((vga_yyyy_yy[2] ^ vga_yyyy_yy[0]) ? 6'h15 : 6'h2a);
         vga_pixel_shift_reg <= (vga_XXXXXXX == 7'd66) ? 6'h3c : 6'h3f;
      else
         vga_pixel_shift_reg <= 6'h00;
   end
   else
      vga_pixel_shift_reg <= {vga_pixel_shift_reg[4:0], 1'b0};
end


reg h_sync, v_sync;

always @ (posedge vga_clk)
begin
   if({vga_XXXXXXX, vga_xxx} == {7'd69, 3'b101})
      h_sync <= 1'b1;
   else if({vga_XXXXXXX, vga_xxx} == {7'd80, 3'b011})
      h_sync <= 1'b0;

   if({vga_YYYYY, vga_yyyy_yy} == {5'd16, {4'd8, 2'b00}})
      v_sync <= 1'b1;
   else if({vga_YYYYY, vga_yyyy_yy} == {5'd16, {4'd9, 2'b01}})
      v_sync <= 1'b0;
end


reg vga_rgb_out, h_sync_out, v_sync_out;

always @ (posedge vga_clk)
begin
   vga_rgb_out <= dsp_pixel_act_shift_reg[5] ? (txt_pixel_shift_reg[5] ^ (le18_pixel_shift_reg[5] & (le18_enable | splash_en)))
                                             : (vga_pixel_shift_reg[5] & splash_en);
   h_sync_out <= h_sync;
   v_sync_out <= v_sync;
end

assign VGA_RGB   = vga_rgb_out;
assign VGA_HSYNC = h_sync_out;
assign VGA_VSYNC = v_sync_out;


assign le18_dout[6] = le18_enable;
assign le18_dout[7] = ~dsp_act;

endmodule
