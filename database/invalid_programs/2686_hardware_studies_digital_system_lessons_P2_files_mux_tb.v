// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ns/1ps

`include "./digital_system_lessons/P2_files/mux8-1.v"

module tb_gate;
  reg [2:0] Sel;
  reg [7:0] A;
  wire F1, F2;

  mux8_1cond uut1 (
    .Sel(Sel),
    .A(A),
    .F(F1)
  );

  mux8_1logic uut2 (
    .Sel(Sel),
    .A(A),
    .F(F2)
  );

  initial begin
    $dumpfile("gate_simulation.vcd");

    $dumpvars(0, tb_gate);
    for (Sel = 0; Sel < 7; Sel = Sel + 1) begin
      for (A = 0; A < 255; A = A + 1) begin
        #1;
      end
      A = 255;
        #1;
    end
    Sel = 7;
      for (A = 0; A < 255; A = A + 1) begin
        #1;
      end
      A = 255;
        #1;
    $finish;
  end

endmodule
