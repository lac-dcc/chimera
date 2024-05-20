// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "Multiplier.v"

module Multiplier_TB ();

  reg [7:0] in1 = 8'd17, in2 = 8'd2;
  wire [7:0] result;

  Multiplier to_be_tested (
      .in1(in1),
      .in2(in2),
      .result(result)
  );

  initial begin
    #10 $stop;
  end

endmodule
