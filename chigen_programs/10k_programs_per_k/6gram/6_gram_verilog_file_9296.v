// Seed: 2941459093
module module_0 (
    input uwire id_0,
    input wor id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri id_4,
    input wor id_5,
    output tri0 id_6,
    input supply1 id_7
    , id_17,
    input wand id_8
    , id_18,
    input uwire id_9,
    output tri1 id_10,
    input supply1 id_11
    , id_19,
    output wand id_12,
    output wor id_13,
    output supply0 id_14,
    output wand id_15
);
  assign (highz1, weak0) id_19[-1] = id_3 == 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    inout tri id_2
);
  uwire id_4;
  assign id_4 = -1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
