// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "circuit1.v"
module tb_circuit1();
reg x1,x2;
wire z;

circuit1 uut(x1,x2,z);

initial begin
  $dumpfile("circuit1.vcd");
  $dumpvars(0, tb_circuit1);


  x1<=0;
  x2<=0;  //test cases here

  #10
  x1<=0;
  x2<=1;

  #10
  x1<=1;
  x2<=0;

  #10
  x1<=1;
  x2<=1;

  #10;
end

endmodule