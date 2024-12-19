// Seed: 2602638298
module module_0 (
    input tri id_0,
    input wor id_1,
    input wand id_2,
    output wand id_3,
    output supply1 id_4,
    input uwire id_5,
    input tri1 id_6,
    output supply1 id_7
);
  tri0 id_9 = 1'h0;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    input supply1 id_2,
    output supply1 id_3,
    input uwire id_4,
    output tri id_5
);
  id_7(
      .id_0(1 - id_5),
      .id_1(id_2.id_5),
      .id_2(id_1),
      .id_3(id_1),
      .id_4("" - id_0 * id_2),
      .id_5(1),
      .id_6(1),
      .id_7(id_4),
      .id_8(1),
      .id_9(1'b0)
  );
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_3,
      id_5,
      id_0,
      id_1,
      id_5
  );
endmodule
