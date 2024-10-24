// Seed: 2863464753
`timescale 1ps / 1ps
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output id_13;
  inout id_12;
  output id_11;
  inout id_10;
  input id_9;
  input id_8;
  input id_7;
  inout id_6;
  output id_5;
  output id_4;
  inout id_3;
  inout id_2;
  output id_1;
  assign id_11 = 1'b0;
  logic id_13;
  logic id_14 = 1'b0;
  logic id_15;
  always @(posedge id_7 or posedge 0) begin
    id_14 = id_12;
    if (id_10) begin
      if (id_13) begin
        if (1)
          if (id_15 || id_10 || {id_9, 1 - id_6}) id_1 = 1;
          else id_1 <= id_8;
      end
    end
  end
endmodule
