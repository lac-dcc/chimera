// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "circuit1_w_set.v"
module tb_circuit1();
reg x1,x2,x3,CP,CD,SD;
wire z;

circuit1 uut(x1,x2,x3,CP,CD,SD,z);

initial begin 
    CP=0;
    CD=0;
    SD=1;
end

always #5 CP=~CP;

initial begin
  $dumpfile("circuit1_w_set.vcd");
  $dumpvars(0, tb_circuit1);


  x1<=0;
  x2<=0;  //test cases here
  x3<=0;
  #10

  x1<=0;
  x2<=1;
  x3<=0;
  #10

  SD<=0;
  x1<=0;
  x2<=1;
  x3<=0;
  #10

  CD<=1;
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