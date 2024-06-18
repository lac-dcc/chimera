// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef  V_74377
`define  V_74377
// based on https://raw.githubusercontent.com/TimRudy/ice-chips-verilog/master/source-7400/74377.v
// timings from https://assets.nexperia.com/documents/data-sheet/74HC_HCT377.pdf

// Octal D flip-flop with enable

`timescale 1ns/1ns

module hct74377 #(parameter WIDTH = 8, LOG = 0)
(
  input _EN,
  input CP,
  input [WIDTH-1:0] D,
  output [WIDTH-1:0] Q
);

parameter [WIDTH-1:0] UNDEF = {(WIDTH/4){4'bzxxz}};
reg [WIDTH-1:0] Q_current=UNDEF;

always @(posedge CP)
begin
  if (!_EN) begin
    if (LOG)  $display("%9t", $time, " REGISTER %m   ASSIGNING D=%08b to Q_current", D);
    Q_current = D;
  end
end

if (LOG)
  always @(Q) begin
      $display("%9t", $time, " REGISTER %m   OUTPUT CHANGE CP=%1b _EN=%1b D=%08b Q=%08b (Q_current=%08b)", CP, _EN, D, Q, Q_current);
  end

assign #14 Q = Q_current;

function isUndef();
    isUndef = (Q === UNDEF);
endfunction

endmodule

`endif
