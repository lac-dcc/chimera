// Seed: 2660752822
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  assign module_1.id_9 = 0;
  output tri1 id_1;
  assign id_1 = -1;
endmodule
module module_1 (
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
    id_11
);
  output wire id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1
  );
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_12 = id_1;
  assign id_9 = 1;
  parameter integer id_13 = 1;
  assign (supply1, highz0) id_11 = id_8;
  always @(id_13 or posedge id_10[""]) begin : LABEL_0
    disable id_14;
  end
endmodule
