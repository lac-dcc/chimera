// Seed: 1175369093
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input tri0 id_2,
    input wand id_3,
    output uwire id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri0 id_7,
    input uwire id_8,
    input supply1 id_9,
    input tri id_10,
    output wor id_11,
    input supply1 id_12,
    input tri0 id_13,
    output tri id_14
);
  assign id_4 = id_9;
  assign module_1.id_5 = 0;
  assign id_11#(
      .id_2(1),
      .id_7(-1)
  ) = 1;
  wire id_16 = 1;
  assign id_16 = id_7;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    output wire id_2,
    input uwire id_3,
    input wor id_4,
    input uwire id_5,
    output wire id_6
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_3,
      id_6,
      id_3,
      id_1,
      id_1,
      id_5,
      id_5,
      id_3,
      id_2,
      id_4,
      id_4,
      id_2
  );
endmodule
