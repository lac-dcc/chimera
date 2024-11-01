// Seed: 22844537
module module_0 (
    input tri1 id_0,
    output wand id_1,
    output uwire id_2,
    output wor id_3,
    input uwire id_4,
    output supply1 id_5,
    input tri id_6,
    input wor id_7,
    output tri1 id_8,
    output supply1 id_9,
    input wand id_10,
    output wor id_11,
    input supply0 id_12,
    output wand id_13,
    output wor id_14,
    output tri id_15
);
  uwire id_17 = 1;
endmodule
module module_1 (
    output tri id_0,
    output wand id_1,
    output uwire id_2,
    input wor id_3,
    input supply0 id_4
);
  id_6(
      .id_0(1),
      .sum(id_3),
      .id_1(!id_3),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(id_2),
      .id_6(1),
      .id_7(1 == id_2)
  ); module_0(
      id_3, id_0, id_2, id_1, id_4, id_2, id_4, id_4, id_2, id_1, id_4, id_1, id_3, id_1, id_0, id_0
  );
  wire id_7;
endmodule
