// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`include "project_defines.v"
module rgb_generator #(
  parameter           X_FRONT_PORCH = 32,
  parameter           X_BACK_PORCH = 32
)(
  input               clk,                // 100MHz system clock signal
  input               rst,                // reset signal

  //Generated Signals to Drive Display
  output        [9:0] o_image_width,
  output        [9:0] o_image_height,

  output              o_vsync,
  output              o_hsync,
  output        [2:0] o_r_out,               // vga red signal
  output        [2:0] o_g_out,               // vga green signal
  output        [1:0] o_b_out,               // vga blue signal

  //From the below control signal, the PPU returns this value
  input         [5:0] i_sys_palette_idx_in,  // system palette index (selects output color)

  //X, Y, Y Next, pixel clock and a vblank
  output        [9:0] o_nes_x_out,           // nes x coordinate
  output        [9:0] o_nes_y_out,           // nes y coordinate
  output        [9:0] o_nes_y_next_out,      // next line's nes y coordinate
  output  reg         o_pix_pulse_out,       // 1 clk pulse prior to o_nes_x update
  output              o_vblank               // indicates a vblank is occuring (no PPU vram access)
);

//local parameters
// NES screen dimensions (256x240).
localparam  FRAME_WIDTH     = 400;
localparam  FRAME_HEIGHT    = 260;
//localparam  FRAME_HEIGHT    = 3;

localparam  VBLANK_START_X  = 365;
localparam  VBLANK_START_Y  = 238;

localparam  VBLANK_END_X    = 32;
localparam  VBLANK_END_Y    = 259;

//localparam  X_FRONT_PORCH      = 32;
//localparam  X_FRONT_PORCH      = 32;
localparam  IMAGE_Y_FP      = 0;  //XXX: This doesn't work when IMAGE_Y_FP > 0
localparam  IMAGE_Y_BP      = 0;

localparam  IMAGE_WIDTH     = 256;
localparam  IMAGE_HEIGHT    = 240;
//localparam  IMAGE_HEIGHT    = 2;


localparam  FPS             = 60;
localparam  CLK_DIV         = `CLOCK_RATE / (FPS * 400 * 260);
//localparam  VBLANK_TIMEOUT    = `CLOCK_RATE / FPS;

reg   [8:0]       r_x_pos;
reg   [8:0]       r_y_pos;
reg   [7:0]       r_rgb;

wire  [8:0]       w_x_pos;
wire  [8:0]       w_y_pos;

wire  [31:0]      w_clk_div = CLK_DIV;
reg   [7:0]       r_clk_div_count;

//Submodules
//Asynchronous Logic
assign            o_r_out   = r_rgb[7:5];
assign            o_g_out   = r_rgb[4:2];
assign            o_b_out   = r_rgb[1:0];
//synchronous logic

always @ (posedge clk) begin
  if (rst) begin
    r_clk_div_count <=  4;
    o_pix_pulse_out <=  0;
  end
  else begin
    //Stobe
    o_pix_pulse_out <=  0;
    if (r_clk_div_count < w_clk_div - 1) begin
      r_clk_div_count <= r_clk_div_count + 1;
    end
    else begin
      r_clk_div_count <=  0;
      o_pix_pulse_out <=  1;
    end
  end
end

always @ (*) begin
  if (o_hsync == 0) begin
    r_rgb             = 0;
  end
  else begin
    // Lookup RGB values based on sys_palette_idx.  Table is an approximation of the NES
    // system palette.  Taken from http://nesdev.parodius.com/NESTechFAQ.htm#nessnescompat.
    case (i_sys_palette_idx_in)
      6'h00:  r_rgb = { 3'h3, 3'h3, 2'h1 };
      6'h01:  r_rgb = { 3'h1, 3'h0, 2'h2 };
      6'h02:  r_rgb = { 3'h0, 3'h0, 2'h2 };
      6'h03:  r_rgb = { 3'h2, 3'h0, 2'h2 };
      6'h04:  r_rgb = { 3'h4, 3'h0, 2'h1 };
      6'h05:  r_rgb = { 3'h5, 3'h0, 2'h0 };
      6'h06:  r_rgb = { 3'h5, 3'h0, 2'h0 };
      6'h07:  r_rgb = { 3'h3, 3'h0, 2'h0 };
      6'h08:  r_rgb = { 3'h2, 3'h1, 2'h0 };
      6'h09:  r_rgb = { 3'h0, 3'h2, 2'h0 };
      6'h0a:  r_rgb = { 3'h0, 3'h2, 2'h0 };
      6'h0b:  r_rgb = { 3'h0, 3'h1, 2'h0 };
      6'h0c:  r_rgb = { 3'h0, 3'h1, 2'h1 };
      6'h0d:  r_rgb = { 3'h0, 3'h0, 2'h0 };
      6'h0e:  r_rgb = { 3'h0, 3'h0, 2'h0 };
      6'h0f:  r_rgb = { 3'h0, 3'h0, 2'h0 };

      6'h10:  r_rgb = { 3'h5, 3'h5, 2'h2 };
      6'h11:  r_rgb = { 3'h0, 3'h3, 2'h3 };
      6'h12:  r_rgb = { 3'h1, 3'h1, 2'h3 };
      6'h13:  r_rgb = { 3'h4, 3'h0, 2'h3 };
      6'h14:  r_rgb = { 3'h5, 3'h0, 2'h2 };
      6'h15:  r_rgb = { 3'h7, 3'h0, 2'h1 };
      6'h16:  r_rgb = { 3'h6, 3'h1, 2'h0 };
      6'h17:  r_rgb = { 3'h6, 3'h2, 2'h0 };
      6'h18:  r_rgb = { 3'h4, 3'h3, 2'h0 };
      6'h19:  r_rgb = { 3'h0, 3'h4, 2'h0 };
      6'h1a:  r_rgb = { 3'h0, 3'h5, 2'h0 };
      6'h1b:  r_rgb = { 3'h0, 3'h4, 2'h0 };
      6'h1c:  r_rgb = { 3'h0, 3'h4, 2'h2 };
      6'h1d:  r_rgb = { 3'h0, 3'h0, 2'h0 };
      6'h1e:  r_rgb = { 3'h0, 3'h0, 2'h0 };
      6'h1f:  r_rgb = { 3'h0, 3'h0, 2'h0 };

      6'h20:  r_rgb = { 3'h7, 3'h7, 2'h3 };
      6'h21:  r_rgb = { 3'h1, 3'h5, 2'h3 };
      6'h22:  r_rgb = { 3'h2, 3'h4, 2'h3 };
      6'h23:  r_rgb = { 3'h5, 3'h4, 2'h3 };
      6'h24:  r_rgb = { 3'h7, 3'h3, 2'h3 };
      6'h25:  r_rgb = { 3'h7, 3'h3, 2'h2 };
      6'h26:  r_rgb = { 3'h7, 3'h3, 2'h1 };
      6'h27:  r_rgb = { 3'h7, 3'h4, 2'h0 };
      6'h28:  r_rgb = { 3'h7, 3'h5, 2'h0 };
      6'h29:  r_rgb = { 3'h4, 3'h6, 2'h0 };
      6'h2a:  r_rgb = { 3'h2, 3'h6, 2'h1 };
      6'h2b:  r_rgb = { 3'h2, 3'h7, 2'h2 };
      6'h2c:  r_rgb = { 3'h0, 3'h7, 2'h3 };
      6'h2d:  r_rgb = { 3'h0, 3'h0, 2'h0 };
      6'h2e:  r_rgb = { 3'h0, 3'h0, 2'h0 };
      6'h2f:  r_rgb = { 3'h0, 3'h0, 2'h0 };

      6'h30:  r_rgb = { 3'h7, 3'h7, 2'h3 };
      6'h31:  r_rgb = { 3'h5, 3'h7, 2'h3 };
      6'h32:  r_rgb = { 3'h6, 3'h6, 2'h3 };
      6'h33:  r_rgb = { 3'h6, 3'h6, 2'h3 };
      6'h34:  r_rgb = { 3'h7, 3'h6, 2'h3 };
      6'h35:  r_rgb = { 3'h7, 3'h6, 2'h3 };
      6'h36:  r_rgb = { 3'h7, 3'h5, 2'h2 };
      6'h37:  r_rgb = { 3'h7, 3'h6, 2'h2 };
      6'h38:  r_rgb = { 3'h7, 3'h7, 2'h2 };
      6'h39:  r_rgb = { 3'h7, 3'h7, 2'h2 };
      6'h3a:  r_rgb = { 3'h5, 3'h7, 2'h2 };
      6'h3b:  r_rgb = { 3'h5, 3'h7, 2'h3 };
      6'h3c:  r_rgb = { 3'h4, 3'h7, 2'h3 };
      6'h3d:  r_rgb = { 3'h0, 3'h0, 2'h0 };
      6'h3e:  r_rgb = { 3'h0, 3'h0, 2'h0 };
      6'h3f:  r_rgb = { 3'h0, 3'h0, 2'h0 };
    endcase
  end
end

assign  o_vblank          = ((r_x_pos == VBLANK_START_X)  && (r_y_pos == VBLANK_START_Y)) ? 1 :
                            ((r_x_pos == VBLANK_END_X)    && (r_y_pos == VBLANK_END_Y))   ? 0 : o_vblank;


assign  w_x_pos           = r_x_pos - X_FRONT_PORCH;
assign  w_y_pos           = r_y_pos - IMAGE_Y_FP;
assign  o_nes_x_out       = {1'b0, w_x_pos};
assign  o_nes_y_out       = {1'b0, w_y_pos};
assign  o_nes_y_next_out  = (r_x_pos == (FRAME_WIDTH / 2)) ? o_nes_y_out + 1 :
                             !rst ? o_nes_y_next_out :
                             10'h000;

assign  o_hsync           = (o_vsync) &&
                            ((o_nes_x_out >= X_FRONT_PORCH) &&
                             (o_nes_x_out <= X_FRONT_PORCH + IMAGE_WIDTH + X_BACK_PORCH));

assign  o_vsync           = ((o_nes_y_out == IMAGE_Y_FP)                              ) ? 1'b1 :
                            ((o_nes_y_out == (IMAGE_Y_FP + IMAGE_HEIGHT + IMAGE_Y_BP))) ? 1'b0:
                            !rst ? o_vsync :
                            1'b0;

assign  o_image_width     = (X_FRONT_PORCH + IMAGE_WIDTH + X_BACK_PORCH);
assign  o_image_height    = (IMAGE_Y_FP + IMAGE_HEIGHT + IMAGE_Y_BP);

//Positional data
always @ (posedge clk) begin
  if (rst) begin
    /*
    r_x_pos <=  VBLANK_START_X;
    r_y_pos <=  VBLANK_START_Y;
    */
    r_x_pos <=  0;
    r_y_pos <=  0;

  end
  else begin
    //Increment Position
    if (o_pix_pulse_out) begin
      if (r_x_pos < (FRAME_WIDTH - 1)) begin
        r_x_pos <= r_x_pos + 1;
      end
      else begin
        r_x_pos <= 0;
        if (r_y_pos < (FRAME_HEIGHT - 1)) begin
          r_y_pos <=  r_y_pos + 1;
        end
        else begin
          r_y_pos <=  0;
        end
      end
    end
  end
end

endmodule
