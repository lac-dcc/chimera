// Seed: 1932534586
module module_0 (
    output wire id_0,
    input wand id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wor id_4
);
  id_6(
      .id_0(id_1),
      .id_1(1),
      .id_2((~1)),
      .id_3(id_1 & id_2),
      .id_4(id_2),
      .id_5(~id_4),
      .id_6(1),
      .id_7(id_3 == 1),
      .id_8((id_3)),
      .id_9(id_2),
      .id_10(1),
      .id_11(id_7),
      .id_12(id_4),
      .id_13(id_0),
      .id_14(id_1),
      .id_15(id_0)
  );
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    output wand id_3,
    output supply0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input tri1 id_7
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
