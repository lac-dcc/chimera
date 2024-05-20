// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "Divide.v"

module Divide_TB ();
  reg [7:0] dividend = 8'd24, divisior = 8'd4;
  wire [7:0] result;

  Divide to_be_tested (
      .dividend(dividend),
      .divisor(divisior),
      .result  (result)
  );

  initial begin
    #10 $stop;
  end
endmodule
