// Seed: 3990039705
module module_0 (
    output wand id_0,
    input  wire id_1,
    input  wand id_2,
    input  wand id_3
);
  wire id_5, id_6, id_7;
  logic [7:0] id_8;
  supply1 id_9 = 1;
  wire id_10;
  wire id_11 = id_8[1];
  wire id_12;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri0 id_1,
    output tri1 id_2,
    input  tri0 id_3,
    input  tri  id_4
);
  id_6(
      .id_0(id_2),
      .id_1(1 - 1),
      .id_2(1),
      .id_3(id_4),
      .id_4(1),
      .id_5(),
      .id_6(id_1),
      .id_7(id_0),
      .id_8(),
      .id_9(1),
      .id_10(1),
      .id_11(id_1)
  );
  nor primCall (id_1, id_3, id_6, id_4, id_0);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.type_13 = 0;
endmodule
