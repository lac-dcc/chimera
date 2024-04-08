/* (c) Krishna Subramanian <https://github.com/mongrelgem>
 * For Issues & Bugs, report to <https://github.com/mongrelgem/Verilog-Adders/issues>
*/


module tb_FA;
  wire sum, cout;
  reg a, b, cin;
  
  FA fa(sum, cout, a, b, cin);
  
  initial
  begin
    $display("a|b|cin||cout|sum");
  end
  
  initial
  begin
    $monitor("%b|%b|%b  ||%b   |%b  ", a, b, cin, cout, sum);
  end
  
  initial
  begin
    a=0; b=0; cin=0;
    #10 a=0; b=0; cin=1;
    #10 a=0; b=1; cin=0;
    #10 a=0; b=1; cin=1;
    #10 a=1; b=0; cin=0;
    #10 a=1; b=0; cin=1;
    #10 a=1; b=1; cin=0;
    #10 a=1; b=1; cin=1;
  end
endmodule


module tb_RCA8;
  wire [7:0] sum;
  wire cout;
  reg [7:0] a, b;
  reg cin;
  
  reg [15:0] i;
  
  RCA8 rca8(sum[7:0], cout, a[7:0], b[7:0]);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  reg checkCarry;
  reg [7:0] checkSum;
  
  initial
  begin
    for(i=0; i<65536; i=i+1)
    begin
      #20; {checkCarry,checkSum} = a+b;
      $display("a=%b|b=%b||carry=%b|sum=%b", a[7:0], b[7:0], cout, sum[7:0]);
      $display("isCarryOK=%b|isSumOK=%b", ~(checkCarry^cout), ~|(checkSum^sum[7:0]));
      $display("---------------------------");
      {a[7:0], b[7:0]}=i;
      
    end
  end

endmodule

module tb_RCA16;
  wire [15:0] sum;
  wire cout;
  reg [15:0] a, b;
  reg cin;
  
  RCA16 rca16(sum[15:0], cout, a[15:0], b[15:0]);
  
  initial
  begin
    $display("a|b||cout|sum");
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

module tb_RCA32;
  wire [31:0] sum;
  wire cout;
  reg [31:0] a, b;
  reg cin;
  
  RCA32 rca32(sum[31:0], cout, a[31:0], b[31:0]);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%b|%b||%b|%b", a[31:0], b[31:0], cout, sum[31:0]);
  end
  
  initial
  begin
    a='b10100000101000001111111111111111; b='b10100000101111111111111111100000;
    #10 a='b01011000111111111111111111110100; b='b11110100111101001111111111111111;
    #10 a='b11111111111111110000111100111101; b='b00001111000011111111111111111111;
    #10 a='b11011111111111111110100011001010; b='b11001111111111111111100011001010;

  end
endmodule

module tb_RCA64;
  wire [63:0] sum;
  wire cout;
  reg [63:0] a, b;
  reg cin;
  
  RCA64 rca64(sum[63:0], cout, a[63:0], b[63:0]);
  
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
    a=64'd998; b=64'd128;
    #10 a=64'd9998; b=64'd9028;
    #10 a=64'd09989998; b=64'd769028;

  end
endmodule