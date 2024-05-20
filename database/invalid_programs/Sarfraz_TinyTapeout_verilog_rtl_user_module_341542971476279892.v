// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341542971476279892(
  input [7:0] io_in, 
  output [7:0] io_out
);

  logo_341542971476279892 logo(
    .clk(io_in[0]),    
    .reset(io_in[1]),

    .tx_out(io_out[0])
  );

endmodule

//  Any submodules should be included in this file,
//  so they are copied into the main TinyTapeout repo.
//  Appending your ID to any submodules you create 
//  ensures there are no clashes in full-chip simulation.

module logo_341542971476279892 (
    input clk,
    input reset,
    
    output reg tx_out
  );

  reg       [7:0] rle_segment_counter;
  reg       [7:0] rle_pixel_counter;
  reg             rle_pixel_state;

  reg       [7:0] line_pixel_counter; //0 to IMG_WIDTH-1, pixels within a line

  reg       [7:0] next_rle_segment_counter;
  reg       [7:0] next_rle_pixel_counter;
  reg             next_rle_pixel_state;

  reg       [7:0] next_line_pixel_counter;

  reg       [7:0] current_rle_length; //length of current segment
  reg       [7:0] current_rle_n_segments; //number of segments in image
  
  reg             start_pixel;
  reg       [7:0] img_width; //max 255 with 8 bits

  //picture data

  parameter LEN_lambdaRLE = 207;
  parameter WIDTH_lambdaRLE = 41;
  parameter START_lambdaRLE = 1;
  wire [7:0] lambdaRLE [0:LEN_lambdaRLE-1]; //Lambda symbol
  
  assign lambdaRLE[0] = 41; assign lambdaRLE[1] = 136; assign lambdaRLE[2] = 3; assign lambdaRLE[3] = 9; assign lambdaRLE[4] = 3; assign lambdaRLE[5] = 26; assign lambdaRLE[6] = 3; assign lambdaRLE[7] = 9; assign lambdaRLE[8] = 3; assign lambdaRLE[9] = 26; assign lambdaRLE[10] = 3; assign lambdaRLE[11] = 9; assign lambdaRLE[12] = 3; assign lambdaRLE[13] = 26; assign lambdaRLE[14] = 3; assign lambdaRLE[15] = 3; assign lambdaRLE[16] = 9; assign lambdaRLE[17] = 26; assign lambdaRLE[18] = 3; assign lambdaRLE[19] = 3; assign lambdaRLE[20] = 9; assign lambdaRLE[21] = 26; assign lambdaRLE[22] = 3; assign lambdaRLE[23] = 3; assign lambdaRLE[24] = 9; assign lambdaRLE[25] = 19; assign lambdaRLE[26] = 10; assign lambdaRLE[27] = 9; assign lambdaRLE[28] = 10; assign lambdaRLE[29] = 11; assign lambdaRLE[30] = 11; assign lambdaRLE[31] = 9; assign lambdaRLE[32] = 11; assign lambdaRLE[33] = 9; assign lambdaRLE[34] = 12; assign lambdaRLE[35] = 9; assign lambdaRLE[36] = 12; assign lambdaRLE[37] = 8; assign lambdaRLE[38] = 4; assign lambdaRLE[39] = 5; assign lambdaRLE[40] = 3; assign lambdaRLE[41] = 3; assign lambdaRLE[42] = 9; assign lambdaRLE[43] = 5; assign lambdaRLE[44] = 4; assign lambdaRLE[45] = 8; assign lambdaRLE[46] = 3; assign lambdaRLE[47] = 6; assign lambdaRLE[48] = 3; assign lambdaRLE[49] = 3; assign lambdaRLE[50] = 9; assign lambdaRLE[51] = 6; assign lambdaRLE[52] = 3; assign lambdaRLE[53] = 8; assign lambdaRLE[54] = 3; assign lambdaRLE[55] = 6; assign lambdaRLE[56] = 3; assign lambdaRLE[57] = 3; assign lambdaRLE[58] = 9; assign lambdaRLE[59] = 6; assign lambdaRLE[60] = 3; assign lambdaRLE[61] = 8; assign lambdaRLE[62] = 3; assign lambdaRLE[63] = 6; assign lambdaRLE[64] = 3; assign lambdaRLE[65] = 9; assign lambdaRLE[66] = 3; assign lambdaRLE[67] = 6; assign lambdaRLE[68] = 3; assign lambdaRLE[69] = 8; assign lambdaRLE[70] = 3; assign lambdaRLE[71] = 6; assign lambdaRLE[72] = 3; assign lambdaRLE[73] = 9; assign lambdaRLE[74] = 3; assign lambdaRLE[75] = 6; assign lambdaRLE[76] = 3; assign lambdaRLE[77] = 8; assign lambdaRLE[78] = 3; assign lambdaRLE[79] = 6; assign lambdaRLE[80] = 3; assign lambdaRLE[81] = 9; assign lambdaRLE[82] = 3; assign lambdaRLE[83] = 6; assign lambdaRLE[84] = 3; assign lambdaRLE[85] = 8; assign lambdaRLE[86] = 3; assign lambdaRLE[87] = 27; assign lambdaRLE[88] = 3; assign lambdaRLE[89] = 8; assign lambdaRLE[90] = 3; assign lambdaRLE[91] = 27; assign lambdaRLE[92] = 3; assign lambdaRLE[93] = 8; assign lambdaRLE[94] = 3; assign lambdaRLE[95] = 27; assign lambdaRLE[96] = 3; assign lambdaRLE[97] = 8; assign lambdaRLE[98] = 3; assign lambdaRLE[99] = 6; assign lambdaRLE[100] = 3; assign lambdaRLE[101] = 3; assign lambdaRLE[102] = 3; assign lambdaRLE[103] = 3; assign lambdaRLE[104] = 3; assign lambdaRLE[105] = 6; assign lambdaRLE[106] = 3; assign lambdaRLE[107] = 8; assign lambdaRLE[108] = 3; assign lambdaRLE[109] = 6; assign lambdaRLE[110] = 3; assign lambdaRLE[111] = 3; assign lambdaRLE[112] = 3; assign lambdaRLE[113] = 3; assign lambdaRLE[114] = 3; assign lambdaRLE[115] = 6; assign lambdaRLE[116] = 3; assign lambdaRLE[117] = 8; assign lambdaRLE[118] = 3; assign lambdaRLE[119] = 6; assign lambdaRLE[120] = 3; assign lambdaRLE[121] = 3; assign lambdaRLE[122] = 3; assign lambdaRLE[123] = 3; assign lambdaRLE[124] = 3; assign lambdaRLE[125] = 6; assign lambdaRLE[126] = 3; assign lambdaRLE[127] = 8; assign lambdaRLE[128] = 3; assign lambdaRLE[129] = 6; assign lambdaRLE[130] = 3; assign lambdaRLE[131] = 3; assign lambdaRLE[132] = 3; assign lambdaRLE[133] = 3; assign lambdaRLE[134] = 3; assign lambdaRLE[135] = 6; assign lambdaRLE[136] = 3; assign lambdaRLE[137] = 8; assign lambdaRLE[138] = 3; assign lambdaRLE[139] = 6; assign lambdaRLE[140] = 3; assign lambdaRLE[141] = 3; assign lambdaRLE[142] = 3; assign lambdaRLE[143] = 3; assign lambdaRLE[144] = 3; assign lambdaRLE[145] = 6; assign lambdaRLE[146] = 3; assign lambdaRLE[147] = 8; assign lambdaRLE[148] = 4; assign lambdaRLE[149] = 5; assign lambdaRLE[150] = 3; assign lambdaRLE[151] = 3; assign lambdaRLE[152] = 3; assign lambdaRLE[153] = 3; assign lambdaRLE[154] = 3; assign lambdaRLE[155] = 5; assign lambdaRLE[156] = 4; assign lambdaRLE[157] = 8; assign lambdaRLE[158] = 12; assign lambdaRLE[159] = 9; assign lambdaRLE[160] = 12; assign lambdaRLE[161] = 9; assign lambdaRLE[162] = 11; assign lambdaRLE[163] = 9; assign lambdaRLE[164] = 11; assign lambdaRLE[165] = 11; assign lambdaRLE[166] = 10; assign lambdaRLE[167] = 9; assign lambdaRLE[168] = 10; assign lambdaRLE[169] = 19; assign lambdaRLE[170] = 3; assign lambdaRLE[171] = 3; assign lambdaRLE[172] = 3; assign lambdaRLE[173] = 3; assign lambdaRLE[174] = 3; assign lambdaRLE[175] = 26; assign lambdaRLE[176] = 3; assign lambdaRLE[177] = 3; assign lambdaRLE[178] = 3; assign lambdaRLE[179] = 3; assign lambdaRLE[180] = 3; assign lambdaRLE[181] = 26; assign lambdaRLE[182] = 3; assign lambdaRLE[183] = 3; assign lambdaRLE[184] = 3; assign lambdaRLE[185] = 3; assign lambdaRLE[186] = 3; assign lambdaRLE[187] = 26; assign lambdaRLE[188] = 3; assign lambdaRLE[189] = 3; assign lambdaRLE[190] = 3; assign lambdaRLE[191] = 3; assign lambdaRLE[192] = 3; assign lambdaRLE[193] = 26; assign lambdaRLE[194] = 3; assign lambdaRLE[195] = 3; assign lambdaRLE[196] = 3; assign lambdaRLE[197] = 3; assign lambdaRLE[198] = 3; assign lambdaRLE[199] = 26; assign lambdaRLE[200] = 3; assign lambdaRLE[201] = 3; assign lambdaRLE[202] = 3; assign lambdaRLE[203] = 3; assign lambdaRLE[204] = 3; assign lambdaRLE[205] = 136; assign lambdaRLE[206] = 41;

  always @(posedge clk) begin
    if (reset) begin
      rle_segment_counter <= 0;
      rle_pixel_counter   <= 0;
      rle_pixel_state     <= start_pixel;

      line_pixel_counter  <= 0;
    end else begin
      rle_segment_counter <= next_rle_segment_counter;
      rle_pixel_counter <= next_rle_pixel_counter;
      rle_pixel_state <= next_rle_pixel_state;

      line_pixel_counter <= next_line_pixel_counter;
    end
  end

  always @(*) begin
    next_rle_segment_counter = rle_segment_counter;
    next_rle_pixel_counter = rle_pixel_counter;
    next_rle_pixel_state = rle_pixel_state;

    next_line_pixel_counter = line_pixel_counter;

    current_rle_length     = lambdaRLE[rle_segment_counter];
    current_rle_n_segments = LEN_lambdaRLE;
    start_pixel = START_lambdaRLE;
    img_width = WIDTH_lambdaRLE;
    
    if(rle_pixel_counter < current_rle_length-1) begin
      next_rle_pixel_counter = rle_pixel_counter + 1;
    end else begin
      next_rle_pixel_counter = 0;
      next_rle_pixel_state = !rle_pixel_state;

      if(rle_segment_counter < current_rle_n_segments-1) begin
        next_rle_segment_counter = rle_segment_counter + 1;
      end else begin
        next_rle_segment_counter = 0;
        next_rle_pixel_state = start_pixel;
        next_line_pixel_counter = 0;
      end
    end

    tx_out = rle_pixel_state;
  end


endmodule