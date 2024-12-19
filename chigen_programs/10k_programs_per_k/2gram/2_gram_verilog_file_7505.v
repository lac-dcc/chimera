// Seed: 1223421573
module module_0 (
    output wire id_0,
    output wand id_1,
    output tri0 id_2,
    input wand id_3,
    input wand id_4,
    output tri1 id_5,
    input wor id_6,
    output supply0 id_7,
    input wand id_8
);
  assign id_2 = id_8;
  tri1 id_10 = 1;
  wor  id_11 = id_6;
  assign id_1 = id_10;
  assign id_0 = 1'b0;
  assign (supply1, highz0) id_0 = id_3;
endmodule
module module_1 (
    output tri1 id_0,
    input  tri1 id_1,
    output tri  id_2,
    input  wire id_3,
    input  wor  id_4
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.type_1 = 0;
endmodule
