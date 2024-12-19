// Seed: 397250676
module module_0 (
    input wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wor id_4,
    input uwire id_5,
    output wor id_6,
    output tri1 id_7,
    output supply0 id_8,
    input tri1 id_9,
    output tri1 id_10,
    input wor id_11,
    input supply1 id_12,
    input wor id_13
);
  assign module_1.type_2 = 0;
  id_15(
      .id_0(1), .id_1({1, 1})
  );
endmodule
macromodule module_1 (
    output wand id_0,
    input  wire id_1,
    output wire id_2,
    output tri1 id_3,
    input  tri0 id_4,
    input  tri  id_5,
    input  tri0 id_6,
    output wand id_7
);
  assign id_7 = id_4;
  supply0 id_9;
  assign id_2 = id_9;
  wire id_10;
  assign id_2 = id_5;
  generate
    wor id_11 = id_9;
  endgenerate
  assign id_11 = 1;
  module_0 modCall_1 (
      id_11,
      id_2,
      id_1,
      id_9,
      id_6,
      id_1,
      id_7,
      id_7,
      id_2,
      id_5,
      id_2,
      id_9,
      id_5,
      id_11
  );
  tri0 id_12 = id_9;
endmodule
