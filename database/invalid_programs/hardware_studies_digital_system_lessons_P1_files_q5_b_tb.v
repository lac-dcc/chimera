// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ns/1ps

`include "q5_b.v"
module tb_gate;
  reg [3:0] bits;
  wire [2:0] count;

  LUT_4bit_1s uut (
    .bits(bits),
    .count(count)
  );
  initial begin
    $dumpfile("gate_simulation.vcd");

    $dumpvars(0, tb_gate);

    for(bits = 0; bits < 15; bits = bits + 1) begin
      #10;
    end
    bits = 15;
    // Finish simulation
    #10 $finish;
  end

endmodule
