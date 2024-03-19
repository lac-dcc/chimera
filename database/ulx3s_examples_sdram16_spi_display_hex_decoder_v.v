// X/Y video HEX decoder core
// AUTHOR=EMARD
// LICENSE=BSD

// simplified hex decoder for 6x6 and 8x8 font grid

module hex_decoder_v
#(
  parameter c_data_len = 64, // input bits data len
  parameter c_row_bits = 4,  // 2^n hex digits: splits data into rows of hex digits 3:8, 4:16, 5:32, 6:64, etc.
  parameter c_grid_6x8 = 0,  // 0:8x8 grid, 1:6x8 grid NOTE: trellis must use "-abc9" to compile
  parameter c_pipeline = 1,  // 0:combinatorial (no clk), 1:pipelined (uses clk)
  parameter c_font_file = "hex_font.mem",
  parameter c_font_size = 136,
  parameter c_color_bits = 16, // 8 or 16 for color screens, 7 monochrome for SSD1306
  parameter c_x_bits = 7,    // X screen bits
  parameter c_y_bits = 7     // Y screen bits
)
(
  input  wire clk, // 25-100 MHz clock typical
  input  wire [c_data_len-1:0] data,
  input  wire [c_x_bits-1:0] x,
  input  wire [c_y_bits-1:0] y,
  output wire [c_color_bits-1:0] color
);
  parameter C_fontbits = c_color_bits == 7 ? 7 : 5;
  reg [C_fontbits-1:0] C_oled_font[0:c_font_size-1];
  initial
    $readmemb(c_font_file, C_oled_font);
  // RGB332
  // red   20 40 80
  // green 04 08 10
  // blue     01 02
  // RGB565
  // red        0800 1000 2000 4000 8000
  // green 0020 0040 0080 0100 0200 0400
  // blue       0001 0002 0004 0008 0010 
  localparam C_color_black         = c_color_bits < 12 ? 8'h00 : 16'h0000 ;
  localparam C_color_dark_red      = c_color_bits < 12 ? 8'h40 : 16'h4000 ;
  localparam C_color_dark_brown    = c_color_bits < 12 ? 8'h44 : 16'h2100 ;
  localparam C_color_dark_yellow   = c_color_bits < 12 ? 8'h48 : 16'h4200 ;
  localparam C_color_dark_green    = c_color_bits < 12 ? 8'h08 : 16'h0200 ;
  localparam C_color_dark_cyan     = c_color_bits < 12 ? 8'h05 : 16'h0208 ;
  localparam C_color_dark_blue     = c_color_bits < 12 ? 8'h01 : 16'h0008 ;
  localparam C_color_dark_violett  = c_color_bits < 12 ? 8'h21 : 16'h4008 ;
  localparam C_color_gray          = c_color_bits < 12 ? 8'h45 : 16'h630C ;
  localparam C_color_light_red     = c_color_bits < 12 ? 8'h80 : 16'h8000 ;
  localparam C_color_orange        = c_color_bits < 12 ? 8'h84 : 16'h4200 ;
  localparam C_color_light_yellow  = c_color_bits < 12 ? 8'h90 : 16'h8400 ;
  localparam C_color_light_green   = c_color_bits < 12 ? 8'h10 : 16'h0400 ;
  localparam C_color_light_cyan    = c_color_bits < 12 ? 8'h0A : 16'h0410 ;
  localparam C_color_light_blue    = c_color_bits < 12 ? 8'h02 : 16'h0010 ;
  localparam C_color_light_violett = c_color_bits < 12 ? 8'h42 : 16'h8010 ;
  localparam C_color_white         = c_color_bits < 12 ? 8'hFF : 16'hFFFF ;

  wire [c_color_bits-1:0] C_color_map[0:15]; // char background color map
  assign C_color_map[0] = C_color_black;
  assign C_color_map[1] = C_color_dark_red;
  assign C_color_map[2] = C_color_dark_brown;
  assign C_color_map[3] = C_color_dark_yellow;
  assign C_color_map[4] = C_color_dark_green;
  assign C_color_map[5] = C_color_dark_cyan;
  assign C_color_map[6] = C_color_dark_blue;
  assign C_color_map[7] = C_color_dark_violett;
  assign C_color_map[8] = C_color_gray;
  assign C_color_map[9] = C_color_light_red;
  assign C_color_map[10] = C_color_orange;
  assign C_color_map[11] = C_color_light_yellow;
  assign C_color_map[12] = C_color_light_green;
  assign C_color_map[13] = C_color_light_cyan;
  assign C_color_map[14] = C_color_light_blue;
  assign C_color_map[15] = C_color_light_violett;

  wire [3:0] S_data_mux[c_data_len/4-1:0];
  generate
    genvar i;
    for(i = 0; i < c_data_len/4; i=i+1)
      assign S_data_mux[i] = data[i*4+3:i*4];
  endgenerate

  generate
  if(c_color_bits == 7)
  begin
      // NOTE large combinatorial logic!
      // Works for slow SPI LCD screens that take a long time
      // from changing (x,y) to reading color.
      wire [c_row_bits-1:0] S_xdiv = c_grid_6x8 ? x/6 : x[2+c_row_bits:3]; // x/6 : x/8
      wire [2:0] S_xmod = c_grid_6x8 ? x%6 : x[2:0]; // x%6 : x%8
      wire [3:0] S_hex_digit = S_data_mux[{y[c_y_bits-1:0],S_xdiv}]; // y/8*2^c_row_bits+x/8
      wire [6:0] S_font_addr = {S_hex_digit+1,2'd0} + S_hex_digit - S_xmod; // hex_digit * 5 + 4 - xmod
      assign color = S_xmod < 5 ? C_oled_font[S_font_addr] : 7'd0;
  end
  else // color bits != 7
  begin
    if(c_pipeline)
    begin
      reg [c_y_bits-1:0] R_y1;
      reg [2:0] R_y2;
      reg [c_row_bits-1:0] R_xdiv;
      reg [2:0] R_xmod, R_xmod2;
      reg [3:0] R_hex_digit;
      reg [c_color_bits-1:0] R_background, R_color;
      reg R_pixel_on;
      always @(posedge clk) 
      begin
        // stage 1
        R_xdiv <= c_grid_6x8 ? x/6 : x[2+c_row_bits:3]; // x/6 : x/8
        R_xmod <= c_grid_6x8 ? x%6 : x[2:0]; // x%6 : x%8
        R_y1 <= y;
        // stage 2
        R_hex_digit <= S_data_mux[{R_y1[c_y_bits-1:3],R_xdiv}]; // y/8*2^c_row_bits+x/8
        R_xmod2 <= R_xmod;
        R_y2 <= R_y1[2:0];
        // stage 3
        R_background <= C_color_map[R_hex_digit];
        R_pixel_on <= R_xmod2 < 5 ? C_oled_font[{R_hex_digit,R_y2[2:0]}][R_xmod2] : 0;
        // stage 4
        R_color <= R_pixel_on ? C_color_white : R_background;
      end
      assign color = R_color;
    end
    else // combinatorial
    begin
      // NOTE large combinatorial logic!
      // Works for slow SPI LCD screens that take a long time
      // from changing (x,y) to reading color.
      wire [c_row_bits-1:0] S_xdiv = c_grid_6x8 ? x/6 : x[2+c_row_bits:3]; // x/6 : x/8
      wire [2:0] S_xmod = c_grid_6x8 ? x%6 : x[2:0]; // x%6 : x%8
      wire [3:0] S_hex_digit = S_data_mux[{y[c_y_bits-1:3],S_xdiv}]; // y/8*2^c_row_bits+x/8
      wire [c_color_bits-1:0] S_background = C_color_map[S_hex_digit];
      wire [6:0] S_font_addr = {S_hex_digit,y[2:0]};
      wire S_pixel_on = S_xmod < 5 ? C_oled_font[S_font_addr][S_xmod] : 1'b0;
      assign color = S_pixel_on ? C_color_white : S_background;
    end
  end
  endgenerate
endmodule
