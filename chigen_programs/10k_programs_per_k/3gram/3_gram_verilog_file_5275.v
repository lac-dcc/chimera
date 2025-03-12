// Seed: 3435818498
module module_0 (
    input uwire id_0,
    input wand id_1,
    output tri1 id_2,
    input wand id_3,
    input uwire id_4,
    output tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    output wor id_9,
    input wor id_10,
    input uwire id_11,
    input tri0 id_12,
    output supply0 id_13,
    output tri1 id_14,
    input supply0 id_15,
    output supply1 id_16
);
  parameter id_18 = 1, id_19 = (-1), id_20 = 1, id_21 = id_8, id_22 = -1 == 1;
  integer id_23;
  logic   id_24;
  assign #1 id_16 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    output tri id_2
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
