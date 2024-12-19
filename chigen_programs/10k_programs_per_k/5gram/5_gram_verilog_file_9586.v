// Seed: 2934301426
module module_0 (
    input  tri  id_0,
    output wor  id_1,
    input  tri  id_2,
    input  wire id_3,
    output tri  id_4,
    output wire id_5,
    output tri0 id_6,
    input  tri1 id_7,
    input  tri0 id_8
    , id_15,
    input  tri  id_9
    , id_16,
    input  wand id_10,
    output tri  id_11,
    output tri0 id_12,
    output tri  id_13
);
  assign id_5 = 1 ? 1 : id_16;
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    input supply1 id_2,
    input wand id_3,
    input tri id_4,
    output tri1 id_5,
    input wor id_6
);
  wand id_8, id_9;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_3,
      id_5,
      id_5,
      id_5,
      id_6,
      id_3,
      id_2,
      id_4,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.id_4 = 0;
  always @(id_8 or posedge 1) id_1 <= id_0;
endmodule
