// Seed: 1329294746
module module_0 (
    output supply0 id_0,
    input wor id_1,
    output tri0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input wire id_5,
    output wire id_6,
    input wor module_0,
    output supply0 id_8
);
  wire id_10;
  wire id_11;
  supply1 id_12, id_13;
  id_14(
      .id_0(id_12), .id_1(id_1), .id_2("")
  );
  assign id_13 = id_4 == 1;
  assign id_8  = id_13;
endmodule
module module_1 (
    input  wand id_0,
    input  tri  id_1,
    input  wor  id_2,
    input  tri1 id_3,
    output wor  id_4,
    output wand id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_4,
      id_3,
      id_0,
      id_5,
      id_1,
      id_5
  );
  assign modCall_1.type_1 = 0;
endmodule
