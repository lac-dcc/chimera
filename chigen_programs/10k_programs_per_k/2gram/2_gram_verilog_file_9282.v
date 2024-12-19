// Seed: 1647821615
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    input wor id_4,
    input tri0 id_5,
    input tri id_6,
    output supply1 id_7,
    input uwire id_8,
    input supply1 id_9,
    output tri id_10,
    input supply1 id_11,
    output tri id_12,
    output supply0 id_13,
    input uwire id_14,
    output supply0 id_15,
    output wor id_16,
    input wand id_17,
    output tri0 id_18,
    output wor id_19
);
  assign id_7 = id_0;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    output wand id_2,
    input wire id_3,
    input tri id_4,
    output tri0 id_5,
    input supply1 id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_6,
      id_4,
      id_0,
      id_4,
      id_2,
      id_0,
      id_1,
      id_5,
      id_2,
      id_3,
      id_2,
      id_0
  );
  id_8(
      .id_0(id_2),
      .id_1(1),
      .id_2(1),
      .id_3(id_4),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7((id_0)),
      .id_8(1),
      .id_9(1'b0)
  );
endmodule
