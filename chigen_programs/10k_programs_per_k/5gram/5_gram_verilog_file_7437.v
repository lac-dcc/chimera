// Seed: 1016487287
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input wand id_2,
    input wor id_3,
    output wor id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri0 id_7
);
  id_9(
      .id_0(id_1 == id_7),
      .id_1({1 == id_6, id_2, id_3, 1}),
      .id_2(id_1 == id_10),
      .id_3(1),
      .id_4(id_0),
      .id_5(id_3++),
      .id_6(id_2),
      .id_7(id_5)
  );
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    input wor id_2,
    output tri0 id_3,
    output wand id_4,
    output uwire id_5,
    output supply1 id_6,
    input tri id_7,
    output tri0 id_8,
    input tri id_9
);
  assign id_8 = id_7;
  nor primCall (id_1, id_2, id_9, id_0, id_7);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_9,
      id_5,
      id_0,
      id_7,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
