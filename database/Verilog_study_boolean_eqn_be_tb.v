// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns / 1ps
module be_tb;
reg aTB, bTB, cTB, dTB;
wire zTB;
be uut(.a(aTB), .b(bTB), .c(cTB), .d(dTB), .z(zTB));
initial begin
  $dumpfile("be_tb.vcd");
  $dumpvars(0, be_tb);    // Initialize Inputs of the UUT
  // Initialize Inputs
  // Initialize Inputs
  aTB = 0;
  bTB = 0;
  cTB = 0;
  dTB = 0;

  //  all 20 ns time gap between all possible combinations
  #20 aTB = 0; bTB = 0; cTB = 0; dTB = 0;
  #20 aTB = 0; bTB = 0; cTB = 0; dTB = 1;
  #20 aTB = 0; bTB = 0; cTB = 1; dTB = 0;
  #20 aTB = 0; bTB = 0; cTB = 1; dTB = 1;
  #20 aTB = 0; bTB = 1; cTB = 0; dTB = 0;
  #20 aTB = 0; bTB = 1; cTB = 0; dTB = 1;
  #20 aTB = 0; bTB = 1; cTB = 1; dTB = 0;
  #20 aTB = 0; bTB = 1; cTB = 1; dTB = 1;
  #20 aTB = 1; bTB = 0; cTB = 0; dTB = 0;
  #20 aTB = 1; bTB = 0; cTB = 0; dTB = 1;
  #20 aTB = 1; bTB = 0; cTB = 1; dTB = 0;
  #20 aTB = 1; bTB = 0; cTB = 1; dTB = 1;
  #20 aTB = 1; bTB = 1; cTB = 0; dTB = 0;
  #20 aTB = 1; bTB = 1; cTB = 0; dTB = 1;
  #20 aTB = 1; bTB = 1; cTB = 1; dTB = 0;
  #20 aTB = 1; bTB = 1; cTB = 1; dTB = 1;
  #20;
end

initial begin
  $monitor("a=%b, b=%b, c=%b, d=%b, z=%b", aTB, bTB, cTB, dTB, zTB);
end
endmodule