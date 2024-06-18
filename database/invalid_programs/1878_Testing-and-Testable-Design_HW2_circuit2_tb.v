// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "circuit2.v"
module tb_circuit2();
reg x1,x2,x3;
wire z;

circuit2 uut(x1,x2,x3,z);

initial begin

  $dumpfile("circuit2.vcd");
  $dumpvars(0, tb_circuit2);


  x1<=0;
  x2<=0;
  x3<=0;

  #10
  x1<=1;
  x2<=0;
  x3<=1;

  #10
  x1<=1;
  x2<=1;
  x3<=0;

  #10
  x1<=0;
  x2<=0;
  x3<=1;

  #10
  x1<=1;
  x2<=0;
  x3<=0;

  #10
  x1<=1;
  x2<=0;
  x3<=1;

  #10
  x1<=1;
  x2<=1;
  x3<=0;

  #10
  x1<=1;
  x2<=1;
  x3<=1;

  #10;
end

endmodule