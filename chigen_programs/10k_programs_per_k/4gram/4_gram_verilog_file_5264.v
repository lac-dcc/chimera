// Seed: 3523541359
module module_0 (
    output tri0 id_0,
    output wand id_1
);
  id_3(
      .id_0(),
      .id_1(1),
      .id_2(id_1),
      .id_3(1),
      .id_4(id_0),
      .id_5(1),
      .id_6(1'b0),
      .id_7(id_1),
      .id_8(id_1),
      .id_9(1),
      .id_10(1),
      .id_11(id_0),
      .id_12(id_1),
      .id_13(id_0),
      .id_14(1),
      .id_15()
  );
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    output wire id_4,
    input supply1 id_5,
    output wor id_6,
    input tri0 id_7
);
  or primCall (id_6, id_2, id_7, id_3);
  module_0 modCall_1 (
      id_1,
      id_6
  );
  assign modCall_1.type_0 = 0;
  supply1 id_9;
  assign id_9 = id_3;
endmodule
