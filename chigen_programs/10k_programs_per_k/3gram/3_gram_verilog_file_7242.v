// Seed: 3430447006
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
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_14;
  always_comb @(negedge id_14) id_8 = id_12;
  assign id_5 = id_4;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output tri1 id_2,
    input tri1 id_3,
    input tri1 id_4,
    output wire id_5
);
  assign id_5 = (1);
  assign id_2 = 1'b0;
  wire id_7;
  tri  id_8;
  wire id_9;
  wire id_10, id_11, id_12, id_13, id_14;
  wand id_15 = id_8 ^ 1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_13,
      id_9,
      id_15,
      id_7,
      id_8,
      id_11,
      id_12,
      id_9,
      id_7,
      id_7
  );
endmodule
