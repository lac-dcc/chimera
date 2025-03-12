// Seed: 3594965285
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input wand id_3,
    output tri1 id_4,
    input wor id_5,
    input uwire id_6,
    input supply1 id_7,
    output uwire id_8,
    output wor id_9,
    output supply0 id_10
    , id_17,
    input wand id_11,
    output wor id_12,
    output tri id_13,
    input uwire id_14,
    input supply0 id_15
);
  assign id_17 = id_17;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1
    , id_6,
    output tri id_2,
    input wor id_3,
    input tri1 id_4
);
  assign #id_7 id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_0,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_7 = 0;
  always
  fork
    assume (1);
  join_none
endmodule
