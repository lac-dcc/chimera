// Seed: 2638614114
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wand id_2
);
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input  uwire   id_0,
    output uwire   id_1,
    output uwire   id_2,
    input  supply0 id_3
);
  tri  id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0
  );
  id_7(
      .id_0(id_5),
      .id_1(1),
      .id_2(1),
      .id_3(id_2),
      .id_4(id_3 ^ {id_1, id_3, (id_0)}),
      .id_5(id_6),
      .id_6(id_5),
      .id_7(1'b0),
      .id_8(1),
      .id_9(id_5),
      .id_10(id_0),
      .id_11(id_2),
      .id_12(id_5 + -1 == -1)
  );
endmodule
