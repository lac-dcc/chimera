// Seed: 1960572921
module module_0 (
    input uwire id_0,
    input tri0  id_1
);
endmodule
module module_1 (
    output wand id_0,
    input tri1 id_1,
    output tri id_2,
    input supply1 id_3
    , id_15,
    input tri0 id_4,
    output tri1 id_5,
    input wor id_6,
    output wor id_7,
    input uwire id_8,
    output wand id_9,
    output uwire id_10,
    output wand id_11,
    output tri1 id_12,
    input tri0 id_13
);
  nor primCall (id_11, id_6, id_15, id_3, id_1, id_8, id_4, id_13);
  module_0 modCall_1 (
      id_8,
      id_6
  );
  assign modCall_1.type_4 = 0;
endmodule
module module_2;
  wire id_1;
  assign module_3.id_1 = 0;
  id_2(
      .id_0(id_1),
      .id_1(1'd0),
      .id_2(""),
      .id_3(1),
      .id_4(id_3),
      .id_5(id_1),
      .id_6(id_3 == 1),
      .id_7(id_1)
  );
endmodule
program module_3 ();
  initial id_1 <= 1;
  module_2 modCall_1 ();
endprogram
