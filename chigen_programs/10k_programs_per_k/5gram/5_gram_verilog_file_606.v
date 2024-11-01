// Seed: 3589861281
module module_0 (
    input tri id_0,
    input wor id_1,
    input tri1 id_2,
    output uwire id_3,
    output wand id_4,
    output wire id_5,
    input tri0 id_6,
    output tri0 id_7,
    output supply0 id_8
    , id_15,
    output tri0 id_9,
    input tri0 id_10,
    input wand id_11,
    input tri1 id_12,
    input wand id_13
);
  tri0 id_16 = 1;
  wire id_17;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    input uwire id_2,
    input wire id_3,
    output wor id_4,
    input uwire id_5,
    input wor id_6
    , id_16,
    output wor id_7,
    input uwire id_8,
    output uwire id_9,
    input uwire id_10,
    input supply0 id_11,
    input tri id_12,
    output tri id_13,
    output supply0 id_14
);
  module_0(
      id_6, id_10, id_2, id_4, id_13, id_7, id_11, id_4, id_14, id_14, id_12, id_8, id_6, id_10
  );
  wire id_17;
  supply1 id_18;
  id_19(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(id_8),
      .id_6(!id_18),
      .id_7(id_9),
      .id_8(1),
      .id_9(1)
  );
  assign id_9 = id_2;
endmodule
