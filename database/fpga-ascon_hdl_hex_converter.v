// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module hex_nibble_converter (
  input clk,
  input [7:0] hex,
  output reg [3:0] bits
);

always @(posedge clk) begin
  case (hex)
    "0" : bits <= 0;
    "1" : bits <= 1;
    "2" : bits <= 2;
    "3" : bits <= 3;
    "4" : bits <= 4;
    "5" : bits <= 5;
    "6" : bits <= 6;
    "7" : bits <= 7;
    "8" : bits <= 8;
    "9" : bits <= 9;
    "a" : bits <= 10;
    "A" : bits <= 10;
    "b" : bits <= 11;
    "B" : bits <= 11;
    "c" : bits <= 12;
    "C" : bits <= 12;
    "d" : bits <= 13;
    "D" : bits <= 13;
    "e" : bits <= 14;
    "E" : bits <= 14;
    "f" : bits <= 15;
    "F" : bits <= 15;
    default:
      bits <= hex[7:4];
  endcase

end
endmodule

module hex_converter (
  input clk,
  input [15:0] hex,
  output [7:0] output_byte
);

hex_nibble_converter msb_hex (
  .clk  (clk),
  .hex  (hex[15:8]),
  .bits (output_byte[7:4])
);

hex_nibble_converter lsb_hex (
  .clk  (clk),
  .hex  (hex[7:0]),
  .bits (output_byte[3:0])
);

endmodule

module nibble_hex_converter (
  input clk,
  output reg [7:0] hex,
  input [3:0] bits
);

always @(posedge clk) begin
  case (bits)
    0 : hex <= "0";
    1 : hex <= "1";
    2 : hex <= "2";
    3 : hex <= "3";
    4 : hex <= "4";
    5 : hex <= "5";
    6 : hex <= "6";
    7 : hex <= "7";
    8 : hex <= "8";
    9 : hex <= "9";
    10 : hex <= "A";
    11 : hex <= "B";
    12 : hex <= "C";
    13 : hex <= "D";
    14 : hex <= "E";
    15 : hex <= "F";
  endcase

end
endmodule

module byte_hex_converter (
  input clk,
  output [15:0] hex,
  input [7:0] input_byte
);

nibble_hex_converter first_hex (
  .clk  (clk),
  .hex  (hex[15:8]),
  .bits (input_byte[7:4])
);

nibble_hex_converter last_hex (
  .clk  (clk),
  .hex  (hex[7:0]),
  .bits (input_byte[3:0])
);

endmodule
