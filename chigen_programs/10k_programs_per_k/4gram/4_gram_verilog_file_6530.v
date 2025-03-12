// Seed: 1577327072
module module_0 (
    input uwire id_0,
    output wor id_1,
    output wire id_2,
    input wire id_3,
    input tri0 id_4,
    input tri id_5,
    output uwire id_6,
    input tri0 id_7,
    output tri0 id_8,
    output wand id_9,
    output wire id_10,
    output uwire id_11,
    output wand id_12,
    input wand id_13,
    input tri1 id_14,
    output supply1 id_15,
    input uwire id_16,
    input wire id_17,
    input tri0 id_18,
    output uwire id_19,
    input supply0 id_20,
    input wor id_21
);
  integer id_23 = id_13;
  wire id_24;
endmodule
module module_1 (
    output tri id_0,
    output tri0 id_1,
    output wor id_2,
    input wand id_3,
    input supply1 id_4,
    input supply1 id_5,
    output wire id_6
);
  assign id_0 = id_5 ? id_1++ : -1 ? 1 : id_4 == id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_3,
      id_5,
      id_3,
      id_1,
      id_4,
      id_2,
      id_2,
      id_0,
      id_2,
      id_6,
      id_4,
      id_3,
      id_6,
      id_3,
      id_3,
      id_3,
      id_6,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
