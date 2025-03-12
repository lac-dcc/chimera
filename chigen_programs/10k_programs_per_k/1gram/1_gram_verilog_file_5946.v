// Seed: 1375823122
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input wor id_2,
    input supply1 id_3,
    input tri0 id_4,
    input supply0 id_5,
    output uwire id_6
    , id_22,
    output supply1 id_7,
    input wire id_8,
    output tri1 id_9,
    input wand id_10,
    input uwire id_11,
    input tri0 id_12,
    output wor id_13,
    output tri1 id_14,
    output wand id_15,
    input tri0 id_16,
    input supply1 id_17,
    output supply0 id_18,
    input supply1 id_19,
    input supply0 id_20
);
endmodule
module module_1 (
    output supply1 id_0,
    output wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wire id_5,
    input tri id_6,
    input wand id_7,
    output tri id_8
);
  event id_10 = id_4 <-> 1;
  assign id_1 = id_6;
  and primCall (id_0, id_2, id_10, id_4, id_7);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_6,
      id_4,
      id_5,
      id_1,
      id_1,
      id_7,
      id_1,
      id_7,
      id_2,
      id_2,
      id_1,
      id_8,
      id_0,
      id_7,
      id_2,
      id_1,
      id_6,
      id_6
  );
  assign modCall_1.id_19 = 0;
endmodule
