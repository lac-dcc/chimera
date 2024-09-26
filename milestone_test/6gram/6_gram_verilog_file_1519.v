// Seed: 2145961955
`timescale 1 ps / 1ps
module module_0 (
    output id_0,
    input id_1,
    input id_2,
    input id_3,
    input id_4,
    input id_5,
    input reg id_6,
    input id_7,
    output reg id_8
);
  reg id_9;
  always @(negedge id_7) begin
    id_9 <= 1;
    id_8 <= id_1;
    if (id_2) id_8 <= #1 id_5;
    else if (1) id_8 <= id_6;
    else if (id_9)
      if (id_1 && 1) id_8 <= #1 id_3;
      else if (id_6) begin
        id_8 = 1;
      end else begin
        id_0 <= 1'b0;
      end
  end
  logic id_10;
  assign id_9 = id_9;
  assign id_8 = id_4;
  logic id_11;
  timeprecision 1ps;
endmodule
