// Seed: 2817070144
macromodule module_0 (
    output uwire id_0,
    input  wor   id_1,
    output uwire id_2,
    output uwire id_3,
    output tri   id_4
);
  wire id_6;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    output wor id_2,
    input wor id_3,
    output wire id_4,
    input supply1 id_5,
    output wand id_6,
    input tri1 id_7,
    input tri id_8 id_12,
    input uwire id_9,
    input wand id_10
);
  id_13(
      .id_0(id_9),
      .id_1(1),
      .id_2(1),
      .id_3(~id_7),
      .id_4(id_8),
      .id_5($display(1) - 1),
      .id_6(id_0),
      .id_7(id_1)
  );
  module_0 modCall_1 (
      id_12,
      id_5,
      id_6,
      id_4,
      id_12
  );
endmodule
