// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

module rgb_generator #(
  parameter           CLOCK_RATE    = 100000000,
  parameter           FPS           = 60,

  //Should be at the center of the screen
  parameter           FRAME_WIDTH   = 480,
  parameter           FRAME_HEIGHT  = 272,
  parameter           X_OFFSET      = 112,
  parameter           Y_OFFSET      = 6,
  parameter           BG_COLOR      = 8'h00,
  parameter           HBLANK        = 100,
  parameter           VBLANK        = 10
)(
  input               clk,                // 100MHz system clock signal
  input               rst,                // reset signal

  //X, Y, Y Next, pixel clock and a vblank
  output        [9:0] o_nes_x_out,        // nes x coordinate
  output        [9:0] o_nes_y_out,        // nes y coordinate
  output        [9:0] o_nes_y_next_out,   // next line's nes y coordinate
  output  reg         o_pix_pulse_out,    // 1 clk pulse prior to o_nes_x update
  //output              o_pix_pulse_out,    // 1 clk pulse prior to o_nes_x update
  output              o_vblank,           // indicates a vblank is occuring (no PPU vram access)

  //From the below control signal, the PPU returns this value
  input         [5:0] i_sys_palette_idx_in,  // system palette index (selects output color)

  //Generated Signals to Drive Display
  output  reg         o_video_hsync = 0,  // Video horizontal sync
  output  reg         o_sof_stb = 0,      // Start of frame
  output        [2:0] o_r_out,            // vga red signal
  output        [2:0] o_g_out,            // vga green signal
  output        [1:0] o_b_out             // vga blue signal
);


//local parameters
localparam  IMAGE_WIDTH     = 256;
localparam  IMAGE_HEIGHT    = 240;
localparam  VBLANK_TIMEOUT = ((((FRAME_WIDTH + HBLANK) * FRAME_HEIGHT) + VBLANK) > (CLOCK_RATE / FPS)) ?
                                          10 :
                                          (CLOCK_RATE / FPS) - (((FRAME_WIDTH + HBLANK) * FRAME_HEIGHT) + VBLANK);

//localparam VBLANK_TIMEOUT = 500;
//localparam VBLANK_TIMEOUT = 148064;
//localparam VBLANK_TIMEOUT = 150000;


localparam  IDLE            = 0;
localparam  VID             = 1;

//Registers/Wires
reg   [9:0]       r_x_pos;
reg   [9:0]       r_y_pos;
reg   [7:0]       r_rgb;

wire  [8:0]       w_x_pos;
wire  [8:0]       w_y_pos;

reg   [23:0]      r_clk_div_count;
wire  [23:0]      w_vblank_debug = VBLANK_TIMEOUT;
reg   [3:0]       state;

wire  [7:0]       w_bg_color;
wire              w_valid;
reg               r_valid;
wire  [31:0]      w_vblank_timeout = VBLANK_TIMEOUT;
reg               r_start_stb;


//synchronous logic

//Generate a pulse when we are about to start capturing video
always @ (posedge clk) begin
  r_start_stb       <=  0;
  if (rst) begin
    r_clk_div_count <=  0;
  end
  else begin
    if (r_clk_div_count < VBLANK_TIMEOUT) begin
      r_clk_div_count <= r_clk_div_count + 1;
    end
    else begin
      r_clk_div_count <=  0;
      r_start_stb     <=  1;
    end
  end
end

//Color lookup table
always @ (*) begin
  if (!r_valid) begin
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
      default: r_rgb = {3'h0, 3'h0, 2'h0 };
    endcase
  end
end

assign  o_vblank          = state == VID;
//assign  o_pix_pulse_out   = w_valid;
assign  w_valid           = (r_x_pos >= X_OFFSET) && (r_x_pos < (X_OFFSET + IMAGE_WIDTH)) &&
                            (r_y_pos >= Y_OFFSET) && (r_y_pos < (Y_OFFSET + IMAGE_HEIGHT));


assign  w_x_pos           = w_valid ? r_x_pos - X_OFFSET: 0;
assign  w_y_pos           = w_valid ? r_y_pos - Y_OFFSET: 0;

assign  o_nes_x_out       = {1'b0, w_x_pos};
assign  o_nes_y_out       = {1'b0, w_y_pos};
assign  o_nes_y_next_out  = w_valid ? o_nes_y_out + 1: 1;

assign  o_r_out           = r_valid ? r_rgb[7:5]: w_bg_color[7:5];
assign  o_g_out           = r_valid ? r_rgb[4:2]: w_bg_color[4:2];
assign  o_b_out           = r_valid ? r_rgb[1:0]: w_bg_color[1:0];

assign  w_bg_color        = BG_COLOR;


//Positional data
always @ (posedge clk) begin
  o_sof_stb               <=  0;
  r_valid                 <=  w_valid;
  o_pix_pulse_out         <=  0;
  if (rst) begin
    r_x_pos               <=  0;
    r_y_pos               <=  0;
    o_video_hsync         <=  0;
    state                 <=  IDLE;
  end
  else begin
    case (state)
      IDLE: begin
        if (r_start_stb) begin
          state           <=  VID;
          r_y_pos         <=  0;
          r_x_pos         <=  0;
        end
      end
      VID: begin
        //if ((r_y_pos == Y_OFFSET) && (r_x_pos == X_OFFSET)) begin
        if ((r_y_pos == 0) && (r_x_pos == 0)) begin
          o_sof_stb       <=  1;
        end
        if ((r_x_pos == 0) && (r_y_pos < FRAME_HEIGHT)) begin
          o_video_hsync   <=  1;
        end
        if (r_y_pos < (FRAME_HEIGHT + VBLANK)) begin
          if (r_x_pos < (FRAME_WIDTH + HBLANK)) begin
            if (r_x_pos < FRAME_WIDTH) begin
              if (((r_y_pos >= (Y_OFFSET - 1)) && (r_y_pos < (Y_OFFSET + IMAGE_HEIGHT))) &&
                  ((r_x_pos >= (X_OFFSET - 1)) && (r_x_pos < (X_OFFSET + IMAGE_WIDTH )))) begin
                o_pix_pulse_out <=  1;
              end
            end
            else begin
              o_video_hsync   <=  0;
            end
            r_x_pos       <=  r_x_pos + 1;
          end
          else begin
            //$display("Next Line!");
            r_x_pos       <=  0;
            r_y_pos       <=  r_y_pos + 1;
          end
        end
        else begin
          state           <=  IDLE;
        end
      end
      default: begin
      end
    endcase
  end
end

endmodule
