// Seed: 3784098988
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output supply1 id_2,
    output wire id_3,
    input tri0 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input tri id_7,
    input uwire id_8,
    output tri1 id_9,
    input supply0 id_10,
    input tri0 id_11,
    input uwire id_12,
    output wor id_13,
    input wor id_14
);
  wire id_16;
  wire id_17;
endmodule
module module_1 (
    output wor id_0,
    output tri0 id_1,
    output tri1 id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5
    , id_9, id_10,
    input supply1 id_6,
    input tri id_7
);
  assign id_9 = id_6 & 1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_4,
      id_5,
      id_6,
      id_4,
      id_7,
      id_1,
      id_7,
      id_4,
      id_5,
      id_1,
      id_4
  );
  assign modCall_1.id_11 = 0;
  tri id_11 = id_9;
  supply1 id_12 = 1;
endmodule
