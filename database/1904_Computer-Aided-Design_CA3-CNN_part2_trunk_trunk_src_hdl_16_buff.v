// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module buff_16 (
  clk, rst, writeEn, readEn,
  address, main_buff_in, buff_out
  );

  input clk, rst, writeEn, readEn;
  input [5:0] address;
  input [31:0] main_buff_in;
  output reg [7:0] buff_out;

  reg [7:0] buffer [0:3][0:3];
  reg [3:0] index;

  always @(posedge clk or posedge rst)
  begin
    if (writeEn)
    begin
        buffer[address][0] <= main_buff_in[7:0];
        buffer[address][1] <= main_buff_in[15:8];
        buffer[address][2] <= main_buff_in[23:16];
        buffer[address][3] <= main_buff_in[31:24];
    end
    if (rst)
    begin
      index <= 4'd0;
      buff_out <= 8'b0;
    end
    else if (readEn)
    begin
      buff_out <= buffer[index / 4][index % 4];
      index <= index + 1;
    end
  end

endmodule
