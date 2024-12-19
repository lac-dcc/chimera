// Seed: 3584797996
module module_0 (
    output tri0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    input supply1 id_5,
    input supply0 id_6
);
  supply1 id_8 = 1'd0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    output wand id_2,
    input supply0 id_3,
    input tri1 id_4,
    output wor id_5,
    input tri id_6,
    output wire id_7,
    output tri1 id_8,
    input wand id_9
);
  tri0 id_11 = ~1 - id_4;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_9,
      id_1,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
