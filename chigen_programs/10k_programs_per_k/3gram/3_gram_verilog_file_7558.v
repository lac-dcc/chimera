// Seed: 3116203235
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output reg id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  parameter id_5 = 1;
  assign id_1 = id_3;
  always_ff @(posedge id_3 ^ 1) id_4 = id_2 / (id_3);
  logic [1 : -1 'h0] id_6 = -1;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout reg id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_5
  );
  initial begin : LABEL_0
    id_5 <= -1'b0;
  end
  wire id_11;
  supply1 id_12;
  assign id_5  = id_5#(.id_6(1), .id_2(1'h0)) & 1;
  assign id_12 = id_4;
  parameter id_13 = 1;
  logic id_14 = id_8;
  assign id_12 = 'b0;
  wire id_15;
endmodule
