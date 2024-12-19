// Seed: 57624574
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wand id_4,
    output wand id_5,
    input tri0 id_6
);
  wand id_8;
  assign module_1.id_2 = 0;
  id_9(
      .id_0(id_3),
      .id_1({(1), 1}),
      .id_2(id_4),
      .id_3(id_8 & id_0),
      .id_4(1),
      .id_5(id_6),
      .id_6(id_4),
      .id_7(1),
      .id_8(id_6),
      .id_9(id_8)
  );
  wire id_10;
endmodule
module module_1 (
    input  wor  id_0,
    input  tri  id_1,
    output wire id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1
  );
endmodule
