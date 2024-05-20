// This program was cloned from: https://github.com/Nilesh002/Multiplication-and-Accumulation-Unit-MAC-
// License: MIT License


module mac32_tb;

  // Signals
  reg [31:0] a, b;
  reg clk, rst;
  wire [63:0] p;

  // Instantiate MAC unit
  mac32 dut(
    .a(a),
    .b(b),
    .p(p),
    .clk(clk),
    .rst(rst)
  );


  initial begin
    clk = 0;
    rst = 1;
    a=0;
    b=0;
    #8;
    rst = 0;
    
  end

 
 initial
 begin
 repeat(10)
 begin
 #5 clk=0;
 #5 clk=1;
 end
 end
 
 
 initial
 begin
 #17 a=32'd5;   b=32'd6;
 #10 a=32'd12;  b=32'd5;  
 #10 a=32'd10;  b=32'd10;
 #10 a=32'd4;  b=32'd2;
 #10 a=32'd5;  b=32'd150;
 #10 a=32'd2;  b=32'd15;
 
  #10 a=32'd451;  b=32'd123;
 #10 a=32'd12;  b=32'd1680;
 #10 a=32'd22;  b=32'd15378;
// #15 $finish;
 end


endmodule
