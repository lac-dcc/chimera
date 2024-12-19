// Seed: 2714168239
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wor id_3,
    input wor id_4,
    output wire id_5,
    input tri0 id_6,
    output tri1 id_7,
    input tri1 id_8,
    input tri id_9,
    output uwire id_10,
    input wand id_11,
    input uwire id_12,
    input wand id_13
);
  tri1 id_15 = id_13;
  generate
    tri0 id_16;
  endgenerate
  assign id_16 = 1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri id_2,
    output wand id_3,
    input wire id_4,
    output wand id_5,
    output tri id_6
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_2,
      id_2,
      id_3,
      id_4,
      id_1,
      id_2,
      id_4,
      id_3,
      id_2,
      id_4,
      id_0
  );
endmodule
