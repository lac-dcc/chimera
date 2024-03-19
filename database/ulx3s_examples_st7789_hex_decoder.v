// SPI OLED SSD1331 display HEX decoder core
// AUTHOR=EMARD
// LICENSE=BSD

// keep en=1 to show OLED screen

module hex_decoder
#(
  parameter C_data_len = 8, // input bits report len
  parameter C_debounce = 1'b0,
  parameter C_font_file = "oled_font.mem",
  parameter C_font_size = 136,
  // Useful values of C_data_len: 4,8,16,32,64,128,192,256,320,448,512
  // Display has 8 lines. Each line has 16 HEX digits or 64 bits.
  // C_data_len(63 downto 0) is shown on the first line
  // C_data_len(127 downto 64) is shown on second line etc.
  parameter C_color_bits = 16,
  parameter C_x_bits = 7, // X screen bits
  parameter C_y_bits = 8  // Y screen bits
)
(
  input  wire clk, // 1-25 MHz clock typical
  input  wire en, // 1-enable/0-hold input for button or other purpose
  input  wire [C_data_len-1:0] data,
  input  wire [C_x_bits-1:0] x,
  input  wire [C_y_bits-1:0] y,
  input  wire next_pixel,
  output wire [C_color_bits-1:0] color
);

  reg [4:0] C_oled_font[0:C_font_size-1];
  initial
  begin
    $readmemb(C_font_file, C_oled_font);
  end

  reg [C_data_len-1:0] R_data;

  reg R_dc = 1'b0; // 0-command, 1-data

  localparam C_holding_bits = 23;
  reg [C_holding_bits-1:0] R_holding = 0; // debounce counter
  reg R_go = 1'b1;
  reg [9:0] R_increment = 10'b0000000001; // fitted to start from char index 0

  // alias S_column: std_logic_vector(3 downto 0) is R_increment(3 downto 0);
  wire [3:0] S_column = R_increment[3:0];
  // alias S_scanline: std_logic_vector(2 downto 0) is R_increment(6 downto 4);
  wire [2:0] S_scanline = R_increment[6:4];
  // alias S_row: std_logic_vector(2 downto 0) is R_increment(9 downto 7);
  wire [2:0] S_row = R_increment[9:7];

  reg [2:0] R_cpixel = 1; // fitted to start with first pixel
  localparam C_char_line_bits = 5;
  reg [C_char_line_bits-1:0] R_char_line = 5'b01110;
  // signal R_cpixel: integer range 0 to 6; -- pixel counter
  wire [C_color_bits-1:0] S_pixel;
  reg [C_color_bits-1:0] R_pixel;

  reg [6:0] R_data_index = 7'b0000010; // tuned to start at 1st hex digit
  reg [3:0] R_indexed_data; // stored from input
  wire [3:0] S_indexed_data;

  // RGB332
  // red   20 40 80
  // green 04 08 10
  // blue     01 02
  // RGB565
  // red        0800 1000 2000 4000 8000
  // green 0020 0040 0080 0100 0200 0400
  // blue       0001 0002 0004 0008 0010 
  localparam C_color_black         = C_color_bits < 12 ? 8'h00 : 16'h0000 ;
  localparam C_color_dark_red      = C_color_bits < 12 ? 8'h40 : 16'h4000 ;
  localparam C_color_dark_brown    = C_color_bits < 12 ? 8'h44 : 16'h2100 ;
  localparam C_color_dark_yellow   = C_color_bits < 12 ? 8'h48 : 16'h4200 ;
  localparam C_color_dark_green    = C_color_bits < 12 ? 8'h08 : 16'h0200 ;
  localparam C_color_dark_cyan     = C_color_bits < 12 ? 8'h05 : 16'h0208 ;
  localparam C_color_dark_blue     = C_color_bits < 12 ? 8'h01 : 16'h0008 ;
  localparam C_color_dark_violett  = C_color_bits < 12 ? 8'h21 : 16'h4008 ;
  localparam C_color_gray          = C_color_bits < 12 ? 8'h45 : 16'h630C ;
  localparam C_color_light_red     = C_color_bits < 12 ? 8'h80 : 16'h8000 ;
  localparam C_color_orange        = C_color_bits < 12 ? 8'h84 : 16'h4200 ;
  localparam C_color_light_yellow  = C_color_bits < 12 ? 8'h90 : 16'h8400 ;
  localparam C_color_light_green   = C_color_bits < 12 ? 8'h10 : 16'h0400 ;
  localparam C_color_light_cyan    = C_color_bits < 12 ? 8'h0A : 16'h0410 ;
  localparam C_color_light_blue    = C_color_bits < 12 ? 8'h02 : 16'h0010 ;
  localparam C_color_light_violett = C_color_bits < 12 ? 8'h42 : 16'h8010 ;
  localparam C_color_white         = C_color_bits < 12 ? 8'hFF : 16'hFFFF ;

  wire [C_color_bits-1:0] C_color_map[0:15]; // char background color map
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
  reg [C_color_bits-1:0] R_indexed_color;

  generate
  if(C_debounce == 1'b1)
  always @(posedge clk)
  begin
      if (en == 1'b1)
      begin
        if(R_holding[C_holding_bits-1] == 1'b0)
          R_holding <= R_holding + 1;
      end
      else
        R_holding <= 0;

      // filter out single keypress (10 ms) or hold (1 sec)
      if(R_holding == 65536 || R_holding[C_holding_bits-1] == 1'b1)
        R_go <= 1'b1;
      else
        R_go <= 1'b0;
  end // always
  else
    always @(posedge clk)
      R_go <= en;
  endgenerate

  // S_pixel <= x"FF" when R_char_line(R_char_line'high) = '1' else R_indexed_color; -- scan left to right
  assign S_pixel = R_char_line[0] == 1'b1 ? C_color_white : R_indexed_color; // scan right to left (white on color background)
  // S_pixel <= x"FF" when R_char_line(0) = '1' else x"00"; -- scan right to left (white on black)
  assign S_indexed_data = R_data[ {R_data_index, 2'd0} +: 4 ];

  reg [10:0] R_counter;
  always @(posedge clk)
  begin
      if (next_pixel) 
      begin // next pixel appears every 16th clock cycle 
	  if (x >= 16 && x < 112)
          begin
            // pixel data
            R_pixel <= S_pixel;
            if(R_cpixel == 3)
              R_data_index <= { S_row, S_column };
            if(R_cpixel == 4)
              R_indexed_data <= S_indexed_data;
            if(R_cpixel == 5) // load new hex digit
            begin
              R_cpixel <= 0;
              R_indexed_color <= C_color_map[R_indexed_data];
              R_char_line <= C_oled_font[ {R_indexed_data, S_scanline} ];
              R_increment <= R_increment + 1; // increment for column and scan line
              if(R_increment == 0 && R_go == 1'b1)
                R_data <= data; // sample data
            end
            else
            begin
              // R_char_line <= R_char_line(R_char_line'high-1 downto 0) & '0'; -- scan left to right
              R_char_line <= { 1'b0, R_char_line[C_char_line_bits-1:1] }; // scan right to left
              R_cpixel <= R_cpixel + 1;
            end
          end
	  else
          begin
            R_pixel <= C_color_black;
	  end
      end
  end
  assign color = R_pixel;
endmodule
