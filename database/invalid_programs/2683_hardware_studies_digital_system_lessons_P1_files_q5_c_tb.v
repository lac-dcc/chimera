// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ns/1ps

`include "q5_c.v"
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

    for(bits = 0; bits < 4095; bits = bits + 1) begin
      #10;
    end
    bits = 4095;
    // Finish simulation
    #10 $finish;
  end

endmodule
