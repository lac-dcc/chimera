// Seed: 3358331235
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input uwire id_3[-1 : -1],
    input tri1 id_4,
    input tri id_5,
    input wand id_6,
    output tri1 id_7,
    input wor id_8,
    input wor id_9
);
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input wor id_2,
    input uwire id_3,
    output wor id_4,
    output wire id_5,
    input uwire id_6,
    input supply0 id_7,
    input supply0 id_8,
    input uwire id_9,
    input supply0 id_10
);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_9,
      id_7,
      id_2,
      id_10,
      id_4,
      id_3,
      id_10
  );
  assign modCall_1.id_6 = 0;
endmodule
