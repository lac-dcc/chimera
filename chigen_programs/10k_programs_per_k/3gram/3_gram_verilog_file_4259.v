// Seed: 4049506731
macromodule module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input wand id_2
);
  wire id_4;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output uwire id_4,
    input tri id_5,
    output wor id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5
  );
  assign modCall_1.type_6 = 0;
  assign #id_9 id_4 = 1;
  xor primCall (id_4, id_3, id_0, id_1, id_2, id_8);
endmodule
macromodule module_2 (
    input wand id_0,
    output uwire id_1,
    input wand id_2,
    input uwire id_3,
    input tri id_4,
    output tri1 id_5,
    input wand id_6,
    input supply1 id_7,
    input tri0 id_8,
    output tri1 id_9,
    input wor id_10,
    output wor id_11,
    input tri1 id_12
);
  tri0 id_14 = 1'b0;
  id_15(
      .id_0(1),
      .id_1(id_1),
      .id_2(id_4),
      .id_3((1)),
      .id_4(1'd0),
      .id_5(id_0),
      .id_6(1 || id_7),
      .id_7(""),
      .id_8(1),
      .id_9(1),
      .id_10(1),
      .id_11(id_8),
      .id_12(id_14),
      .id_13(1),
      .id_14(id_5)
  );
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4
  );
  assign modCall_1.type_6 = 0;
  assign id_11 = id_14;
  assign id_9 = id_2;
  wire id_16, id_17;
endmodule
