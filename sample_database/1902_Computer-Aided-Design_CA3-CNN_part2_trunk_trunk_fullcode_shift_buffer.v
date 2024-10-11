// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module shift_buffer (
  clk, rst, writeEn, readEn,
  main_input,sb_out
  );

  input clk, rst, writeEn, readEn;
  input [7:0] main_input [0:3];
  output reg [7:0] sb_out;

  reg [7:0] buffer [0:3][0:3];
  reg [3:0] index;

  integer i, j;
  always @(posedge clk or posedge rst)
  begin
    if (rst)
    begin
      for (i = 0; i < 4; i = i + 1)
      begin
        for (j = 0; j < 4; j = j + 1)
          buffer[i][j] <= 8'h00;
      end
      index <= 4'd0;
      sb_out <= 8'd0;
    end
    else if (writeEn)  //shifting
    begin
      index <= 4'd0;
      for (i = 0; i < 4; i = i + 1)
        buffer[i][0] <= buffer[i][1];
      for (i = 0; i < 4; i = i + 1)
        buffer[i][1] <= buffer[i][2];
      for (i = 0; i < 4; i = i + 1)
        buffer[i][2] <= buffer[i][3];
      for (i = 0; i < 4; i = i + 1)
        buffer[i][3] <= main_input[i];
    end
    else if (readEn)
    begin
      sb_out <= buffer[index / 4][index % 4];
      index <= index + 1;
    end
  end



endmodule
