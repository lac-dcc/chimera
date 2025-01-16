// Seed: 1860674594
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input uwire id_2,
    output supply0 id_3,
    output wor id_4,
    output supply0 id_5,
    input tri id_6,
    output wand id_7,
    input supply1 id_8,
    input uwire id_9,
    input wand id_10,
    input tri0 id_11,
    input tri0 id_12,
    input supply0 id_13,
    output wor id_14
);
  assign id_14 = id_9#(
      .id_12(-1),
      .id_10(-1)
  );
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input wor id_2,
    input wand id_3,
    input wor id_4,
    output supply0 id_5,
    output supply0 id_6
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_0,
      id_5,
      id_0,
      id_4,
      id_1,
      id_2,
      id_4,
      id_3,
      id_2,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_0 = 1;
  wire id_8, id_9, id_10;
  wire id_11;
endmodule
