// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ns/1ps

`include "q5_d.v"
module tb_gate;
  reg [11:0] bits;
  wire [3:0] count;

  LUT_12bit_1s uut (
    .bits(bits),
    .count(count)
  );
  initial begin
    $dumpfile("gate_simulation.vcd");

    $dumpvars(0, tb_gate);

    bits = 12'b111111111111;
    #10;
    bits = 12'b010110101101;
    #10;
    bits = 12'b100001011100;
    #10;

    // Finish simulation
    #10 $finish;
  end

endmodule
