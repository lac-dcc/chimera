// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "Adder.v"

module Adder_Tb ();
  reg [7:0] in1 = 8'd5, in2 = 8'd23;
  reg cin = 1'd0;
  wire [7:0] result;
  wire cout;

  Adder to_be_tested (
      .in1(in1),
      .in2(in2),
      .cin(cin),
      .result(result),
      .cout(cout)
  );

  initial begin
    #10 $stop;
  end
endmodule
