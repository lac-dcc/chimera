// Seed: 1640711761
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    input tri id_3,
    output tri0 id_4,
    input wor id_5,
    output supply0 id_6,
    output tri0 id_7,
    input tri1 id_8,
    output supply0 id_9,
    output tri0 id_10,
    input wand id_11,
    output wire id_12,
    output wire id_13
    , id_15
);
  wire id_16;
  wire id_17;
  tri0 id_18 = id_0 ? 1 : id_15;
endmodule
module module_1 (
    output wor id_0,
    output supply0 id_1,
    output supply0 id_2,
    output supply1 id_3,
    input wor id_4,
    output tri0 id_5,
    input uwire id_6,
    input wand id_7,
    output wire id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_6,
      id_8,
      id_7,
      id_1,
      id_1,
      id_7,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.type_21 = 0;
  wire id_11;
endmodule
