// Seed: 2620470864
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output uwire id_3,
    output uwire id_4,
    output tri1 id_5,
    input wire id_6,
    input tri1 id_7,
    input supply0 id_8,
    input tri id_9,
    input uwire id_10,
    input uwire id_11,
    output wand id_12,
    output wor id_13,
    output supply1 id_14
);
  tri0 id_16 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wor id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wire id_5,
    input supply1 id_6,
    input tri1 id_7,
    input supply0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_0,
      id_0,
      id_0,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
