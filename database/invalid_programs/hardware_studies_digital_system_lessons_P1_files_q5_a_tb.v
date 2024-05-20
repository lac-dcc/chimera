// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ns/1ps

`include "q5_a.v"
module tb_gate;
  reg [2:0] addr;
  wire [1:0] count;

  LUT uut (
    .address(addr),
    .SOP(count)
  );
  initial begin
    $dumpfile("gate_simulation.vcd");

    $dumpvars(0, tb_gate);

    for(addr = 0; addr < 7; addr = addr + 1) begin
      #10;
    end
    addr = 7;
    // Finish simulation
    #10 $finish;
  end

endmodule
