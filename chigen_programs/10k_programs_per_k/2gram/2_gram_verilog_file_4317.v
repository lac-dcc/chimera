// Seed: 2131129778
module module_0 (
    output wor id_0,
    output wor id_1,
    output uwire id_2,
    input uwire id_3,
    output supply0 id_4,
    input tri id_5,
    input tri id_6,
    input supply1 id_7,
    input uwire id_8,
    input uwire id_9,
    output tri id_10
    , id_17,
    input wand id_11,
    input wire id_12,
    output wor id_13,
    input supply0 id_14,
    input supply1 id_15
);
  wire  id_18;
  uwire id_19 = id_12;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    input wand id_2,
    output tri id_3,
    input tri1 id_4,
    output wor id_5,
    input tri id_6,
    output supply1 id_7
);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_1,
      id_3,
      id_4,
      id_1,
      id_6,
      id_6,
      id_6,
      id_0,
      id_6,
      id_6,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_14 = 0;
  wire id_9 = 1 ? id_4 : id_1 ? 1 : 1, id_10;
endmodule
