/* (c) Krishna Subramanian <https://github.com/mongrelgem>
 * For Issues & Bugs, report to <https://github.com/mongrelgem/Verilog-Adders/issues>
*/ 

module tb_CLA8;
  wire [7:0] sum;
  wire cout;
  reg [7:0] a, b;
  reg cin;
  
  CLA8 cla8(sum[7:0], cout, a[7:0], b[7:0]);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%b|%b||%b|%b", a[7:0], b[7:0], cout, sum[7:0]);
  end
  
  initial
  begin
    a=8'b11111010; b=8'b11110000;
    #10    a=8'b11111010; b=8'b11110001;
    #10    a=8'b00111000; b=8'b10010000;
    #10    a=8'b11000010; b=8'b10110000;

  end

endmodule


module tb_CLA16;
  wire [15:0] sum;
  wire cout;
  reg [15:0] a, b;
  reg cin;
  
  CLA16 cla16(sum[15:0], cout, a[15:0], b[15:0]);
  
  initial
  begin
    $display("a               |b               ||cout|sum             ");
  end
  
  initial
  begin
    $monitor("%b|%b||%b   |%b", a[15:0], b[15:0], cout, sum[15:0]);
  end
  
  initial
  begin
    a=16'b1010000010100000; b=16'b1010000010100000;
    #10 a=16'b0101100011110100; b=16'b1111010011110100;
    #10 a=16'b0000111100111101; b=16'b0000111100001111;
    #10 a=16'b1100100011001010; b=16'b1100100011001010;

  end
endmodule

module tb_CLA32;
  wire [31:0] sum;
  wire cout;
  reg [31:0] a, b;
  reg cin;
  
  CLA32 cla32(sum[31:0], cout, a[31:0], b[31:0]);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%d|%d||%d|%d", a[31:0], b[31:0], cout, sum[31:0]);
  end
  
  initial
  begin
    a='d999; b='d98999;

  end
endmodule

module tb_CLA64;
  wire [63:0] sum;
  wire cout;
  reg [63:0] a, b;
  reg cin;
  
  CLA64 cla64(sum[63:0], cout, a[63:0], b[63:0]);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%d|%d||%d|%d", a[63:0], b[63:0], cout, sum[63:0]);
  end
  
  initial
  begin
    a=64'd9991; b=64'd8810;

  end
endmodule

