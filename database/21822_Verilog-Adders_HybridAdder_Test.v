// This program was cloned from: https://github.com/mongrelgem/Verilog-Adders
// License: Apache License 2.0

/* (c) Krishna Subramanian <https://github.com/mongrelgem>
 * For Issues & Bugs, report to <https://github.com/mongrelgem/Verilog-Adders/issues>
*/

module tb_HA8;
  wire [7:0] sum;
  wire cout;
  reg [7:0] a, b;
  reg cin;
  
  HA8 ha8(sum, cout, a, b);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%b|%b||%b|%b", a, b, cout, sum);
  end
  
  initial
  begin
    a=8'b11111010; b=8'b11110000;
    #40    a=8'b11111010; b=8'b11110001;
    #40    a=8'b00111000; b=8'b10010000;
    #40    a=8'b11000010; b=8'b10110000;

  end

endmodule

module tb_HA16;
  wire [15:0] sum;
  wire cout;
  reg [15:0] a, b;
  reg cin;
  
  HA16 ha16(sum, cout, a, b);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%b|%b||%b|%b", a, b, cout, sum);
  end
  
  initial
  begin
    a=16'b1111101011111010; b=16'b1111101011110000;
    #40    a=16'b1111101000111000; b=16'b0000000011110001;
    #40    a=16'b0011100000111000; b=16'b1001000011110001;
    #40    a=16'b1111110001000010; b=16'b1011111100010000;

  end

endmodule

module tb_HA32;
  wire [31:0] sum;
  wire cout;
  reg [31:0] a, b;
  reg cin;
  
  HA32 ha32(sum, cout, a, b);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%b|%b||%b|%b", a, b, cout, sum);
  end
  
  initial
  begin
    a=32'b11111010111110000000011110001111; b=32'b01010101111100000000000011110001;
    #100    a=32'b11111010001110001111111111111111; b=32'b00000000111100101010101001010001;
    #100    a=32'b00111000001110010101010011101010; b=32'b10010000111100000111111100011101;
    #100    a=32'b11111100010011111100000111110010; b=32'b10111111000100111100011100010100;

  end

endmodule


module tb_HA64;
  wire [63:0] sum;
  wire cout;
  reg [63:0] a, b;
  reg cin;
  
  HA64 ha64(sum, cout, a, b);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%b|%b||%b|%b", a, b, cout, sum);
  end
  
  initial
  begin
    a=64'b1111111101011111000000001111000111111010111110000000011110001111; b=64'b0101010111110000000111110101111100000000111100011110000011110001;
    #200 a=64'b1111101011111000111110101111100000000111100011110000011110001111; b=64'b0101010111110111110101111100000000111100011110000000000011110001;
  end

endmodule
