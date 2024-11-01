// Seed: 3291406482
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wand id_4,
    input tri id_5,
    output wand id_6,
    input supply0 id_7,
    output wire id_8,
    output supply0 id_9,
    input tri1 id_10,
    output wire id_11,
    output tri1 id_12,
    input wire id_13,
    output wand id_14,
    input tri1 id_15,
    input wor id_16,
    output tri id_17
);
  wire id_19, id_20;
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    input tri id_2,
    output uwire id_3,
    input supply0 id_4,
    input wor id_5,
    input uwire id_6,
    input uwire id_7,
    output tri id_8,
    output supply1 id_9,
    input tri id_10
);
  id_12(
      .id_0(id_1),
      .id_1(1),
      .id_2(1'd0),
      .id_3(1),
      .id_4(id_4),
      .id_5(id_7 + 1'd0),
      .id_6(id_2 - id_3)
  ); module_0(
      id_10,
      id_4,
      id_4,
      id_8,
      id_6,
      id_5,
      id_3,
      id_7,
      id_1,
      id_8,
      id_0,
      id_1,
      id_1,
      id_7,
      id_3,
      id_0,
      id_5,
      id_8
  );
  always force id_3 = 1;
  xnor (id_8, id_5, id_0, id_6, id_7, id_12, id_2, id_10, id_4);
endmodule
