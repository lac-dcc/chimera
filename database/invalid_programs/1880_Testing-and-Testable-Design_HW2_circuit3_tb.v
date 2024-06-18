// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "circuit3.v"
module tb_circuit3();
reg x1,x2,x3,x4,x5;
wire z;

circuit3 uut(x1,x2,x3,x4,x5,z);

initial begin
  $dumpfile("circuit3.vcd");
  $dumpvars(0, tb_circuit3);
  
  x1<=0;
  x2<=0;
  x3<=0;
  x4<=0;
  x5<=0;

  #10
  x1<=1;
  x2<=1;
  x3<=1;
  x4<=0;
  x5<=0;

  #10
  x1<=0;
  x2<=0;
  x3<=1;
  x4<=1;
  x5<=0;

  #10
  x1<=0;
  x2<=1;
  x3<=1;
  x4<=1;
  x5<=1;

  #10
  x1<=1;
  x2<=0;
  x3<=1;
  x4<=1;
  x5<=1;

  #10
  x1<=1;
  x2<=1;
  x3<=0;
  x4<=1;
  x5<=1;

  #10
  x1<=1;
  x2<=1;
  x3<=1;
  x4<=1;
  x5<=1;

  #10;

end

endmodule