// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "circuit1_wo_set.v"
module tb_circuit1();
reg x1,x2,x3,CP;
wire z;

circuit1 uut(x1,x2,x3,CP,z);

initial CP=0;
always #5 CP=~CP;

initial begin
  $dumpfile("circuit1_wo_set.vcd");
  $dumpvars(0, tb_circuit1);


  x1<=0;
  x2<=0;  //test cases here
  x3<=0;
  #10

  x1<=0;
  x2<=1;
  x3<=0;
  #10

  x1<=1;
  x2<=0;
  x3<=1;
  #10

  x1<=1;
  x2<=1;
  x3<=1;
  #10;
  $finish;
end

endmodule