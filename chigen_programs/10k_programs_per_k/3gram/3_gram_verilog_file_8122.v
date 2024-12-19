// Seed: 3465998264
program module_0 (
    input wand id_0,
    output supply1 id_1,
    inout wand id_2,
    output tri1 id_3,
    output wor id_4,
    input tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    output tri id_8
);
  wire id_10;
  assign module_1.type_15 = 0;
endprogram
macromodule module_1 (
    input supply1 id_0,
    input tri id_1,
    input tri1 id_2,
    output wand id_3,
    output tri1 id_4,
    input supply0 id_5,
    output wand id_6
);
  wor id_8;
  xnor primCall (id_3, id_11, id_9, id_10, id_12, id_5, id_2, id_1, id_0, id_8, id_14, id_13);
  assign id_4 = 1'b0;
  wire id_9;
  assign id_6 = 1;
  assign id_4 = id_2 - 1 ? id_9 : id_9;
  assign id_3 = id_2;
  wire id_10;
  assign id_6 = id_10;
  assign id_8 = 1;
  wire id_11;
  integer id_12;
  wire id_13 = id_11;
  id_14(
      .id_0(!1),
      .id_1(1),
      .id_2(id_9 & 1),
      .id_3(1),
      .id_4(id_9),
      .id_5(id_3),
      .id_6(1),
      .id_7(1),
      .id_8(1)
  );
  module_0 modCall_1 (
      id_2,
      id_10,
      id_10,
      id_9,
      id_4,
      id_9,
      id_5,
      id_9,
      id_3
  );
endmodule
