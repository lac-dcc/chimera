// Seed: 1688270794
module module_0 (
    output tri0 id_0,
    output wire id_1,
    input wor id_2#(
        .id_17(1),
        .id_18(~-1),
        .id_19(-1),
        .id_20(1)
    ),
    input tri1 id_3,
    input wor id_4,
    output tri0 id_5,
    output tri0 id_6,
    input uwire id_7,
    input wire id_8,
    output tri1 id_9,
    output supply0 id_10,
    input wand id_11,
    output wand id_12,
    input supply1 id_13,
    output tri0 id_14,
    input wire id_15
);
endmodule
module module_1 (
    input tri0 id_0,
    output supply1 id_1,
    output tri id_2,
    input tri1 id_3,
    output wand id_4,
    output uwire id_5,
    input wand id_6,
    id_9,
    output uwire id_7
);
  wire id_10;
  assign id_7 = id_0;
  or primCall (id_2, id_6, id_10, id_0, id_9);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_3,
      id_6,
      id_3,
      id_5,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_4,
      id_3
  );
  assign modCall_1.type_7 = 0;
endmodule
