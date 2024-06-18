// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

// File hdl/vga.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 2001

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002-2017 Larry Doolittle
//     http://doolittle.icarus.com/~larry/vhd2vl/
//   Modifications (C) 2017 Rodrigo A. Melo
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

// AUTHOR=EMARD
// LICENSE=BSD
//
// Generates VGA picture from sequential bitmap data from pixel clock
// synchronous FIFO.
// the pixel data in r_i, g_i, b_i registers
// should be present ahead of time
// signal 'fetch_next' is set high for 1 clk_pixel
// period as soon as current pixel data is consumed
// fifo should be fast enough to fetch new data for
// new pixel
//use ieee.std_logic_unsigned.all;
//use ieee.std_logic_arith.all;
// use ieee.math_real.all; -- to calculate log2 bit size
// no timescale needed

module vga(
input wire clk_pixel,
input wire clk_pixel_ena,
input wire test_picture,
output wire fetch_next,
output wire [c_bits_x - 1:0] beam_x,
output wire [c_bits_y - 1:0] beam_y,
input wire [7:0] r_i,
input wire [7:0] g_i,
input wire [7:0] b_i,
output wire [7:0] vga_r,
output wire [7:0] vga_g,
output wire [7:0] vga_b,
output wire vga_hsync,
output wire vga_vsync,
output wire vga_vblank,
output wire vga_blank,
output wire vga_de
);

parameter [31:0] c_resolution_x=640;
parameter [31:0] c_hsync_front_porch=16;
parameter [31:0] c_hsync_pulse=96;
parameter [31:0] c_hsync_back_porch=44;
parameter [31:0] c_resolution_y=480;
parameter [31:0] c_vsync_front_porch=10;
parameter [31:0] c_vsync_pulse=2;
parameter [31:0] c_vsync_back_porch=31;
parameter [31:0] c_bits_x=10;
parameter [31:0] c_bits_y=10;
parameter [31:0] c_dbl_x=0;
parameter [31:0] c_dbl_y=0;
// 0-normal X, 1-double X
// pixel clock, 25 MHz for 640x480
// pixel clock ena
// '1' to show test picture
// request FIFO to fetch next pixel data
// pixel data from FIFO
// 8-bit VGA video signal out
// VGA sync
// V blank for CPU interrupts and H+V blank for digital encoder (HDMI)



// function integer ceiling log2
// returns how many bits are needed to represent a number of states
// example ceil_log2(255) = 8,  ceil_log2(256) = 8, ceil_log2(257) = 9
//  function ceil_log2(x: integer) return integer is
//  begin
//    return integer(ceil((log2(real(x)+1.0E-6))-1.0E-6));
//  end ceil_log2;
//constant c_bits_x: integer := 13; -- ceil_log2(c_frame_x-1)
//constant c_bits_y: integer := 11; -- ceil_log2(c_frame_y-1)
reg [c_bits_x - 1:0] CounterX;  // (9 downto 0) is good for up to 1023 frame timing width (resolution 640x480)
reg [c_bits_y - 1:0] CounterY;  // (9 downto 0) is good for up to 1023 frame timing width (resolution 640x480)
parameter c_hblank_on = c_resolution_x - 1;
parameter c_hsync_on = c_resolution_x + c_hsync_front_porch - 1;
parameter c_hsync_off = c_resolution_x + c_hsync_front_porch + c_hsync_pulse - 1;
parameter c_hblank_off = c_resolution_x + c_hsync_front_porch + c_hsync_pulse + c_hsync_back_porch - 1;
parameter c_frame_x = c_resolution_x + c_hsync_front_porch + c_hsync_pulse + c_hsync_back_porch - 1;  // frame_x = 640 + 16 + 96 + 48 = 800;
parameter c_vblank_on = c_resolution_y - 1;
parameter c_vsync_on = c_resolution_y + c_vsync_front_porch - 1;
parameter c_vsync_off = c_resolution_y + c_vsync_front_porch + c_vsync_pulse - 1;
parameter c_vblank_off = c_resolution_y + c_vsync_front_porch + c_vsync_pulse + c_vsync_back_porch - 1;
parameter c_frame_y = c_resolution_y + c_vsync_front_porch + c_vsync_pulse + c_vsync_back_porch - 1;  // frame_y = 480 + 10 + 2 + 33 = 525;
// refresh_rate = pixel_clock/(frame_x*frame_y) = 25MHz / (800*525) = 59.52Hz
reg R_hsync; reg R_vsync; reg R_blank; reg R_disp;  // disp = not blank
reg R_disp_early; reg R_vdisp;  // blank generation
reg R_blank_early; reg R_vblank;  // blank generation
reg R_fetch_next;
reg [7:0] R_vga_r; reg [7:0] R_vga_g; reg [7:0] R_vga_b;  // test picture generation
wire [7:0] W; wire [7:0] A; wire [7:0] T;
wire [5:0] Z;

  always @(posedge clk_pixel) begin
    if(clk_pixel_ena == 1'b1) begin
      if(CounterX == c_frame_x) begin
        CounterX <= {((c_bits_x - 1)-(0)+1){1'b0}};
        if(CounterY == c_frame_y) begin
          CounterY <= {((c_bits_y - 1)-(0)+1){1'b0}};
        end
        else begin
          CounterY <= CounterY + 1;
        end
      end
      else begin
        CounterX <= CounterX + 1;
      end
      R_fetch_next <= R_disp_early;
    end
    else begin
      R_fetch_next <= 1'b0;
    end
  end

  assign beam_x = CounterX;
  assign beam_y = CounterY;
  assign fetch_next = R_fetch_next;
  // generate sync and blank
  always @(posedge clk_pixel) begin
    if(CounterX == c_hblank_on) begin
      R_blank_early <= 1'b1;
      R_disp_early <= 1'b0;
    end
    else if(CounterX == c_hblank_off) begin
      R_blank_early <= R_vblank;
      // "OR" function
      R_disp_early <= R_vdisp;
      // "AND" function
    end
  end

  always @(posedge clk_pixel) begin
    if(CounterX == c_hsync_on) begin
      R_hsync <= 1'b1;
    end
    else if(CounterX == c_hsync_off) begin
      R_hsync <= 1'b0;
    end
  end

  always @(posedge clk_pixel) begin
    if(CounterY == c_vblank_on) begin
      R_vblank <= 1'b1;
      R_vdisp <= 1'b0;
    end
    else if(CounterY == c_vblank_off) begin
      R_vblank <= 1'b0;
      R_vdisp <= 1'b1;
    end
  end

  always @(posedge clk_pixel) begin
    if(CounterY == c_vsync_on) begin
      R_vsync <= 1'b1;
    end
    else if(CounterY == c_vsync_off) begin
      R_vsync <= 1'b0;
    end
  end

  // test picture generator
  assign A = (CounterX[7:5]) == 3'b010 && (CounterY[7:5]) == 3'b010 ? {8{1'b1}} : {8{1'b0}};
  assign W = CounterX[7:0] == CounterY[7:0] ? {8{1'b1}} : {8{1'b0}};
  assign Z = (CounterY[4:3]) == ( ~(CounterX[4:3])) ? {6{1'b1}} : {6{1'b0}};
  assign T = {8{CounterY[6]}};
  always @(posedge clk_pixel) begin
    if(R_blank == 1'b1) begin
      // analog VGA needs this, DVI doesn't
      R_vga_r <= {8{1'b0}};
      R_vga_g <= {8{1'b0}};
      R_vga_b <= {8{1'b0}};
    end
    else begin
      R_vga_r <= (({(CounterX[5:0]) & Z,2'b00}) | W) &  ~A;
      R_vga_g <= (((CounterX[7:0]) & T) | W) &  ~A;
      R_vga_b <= (CounterY[7:0]) | W | A;
    end
    R_blank <= R_blank_early;
    R_disp <= R_disp_early;
  end

  assign vga_r = R_vga_r;
  assign vga_g = R_vga_g;
  assign vga_b = R_vga_b;
  assign vga_hsync = R_hsync;
  assign vga_vsync = R_vsync;
  assign vga_blank = R_blank;
  assign vga_vblank = R_vblank;
  assign vga_de = R_disp;

endmodule
