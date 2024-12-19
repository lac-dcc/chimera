// Seed: 3541637004
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input wand id_2,
    input wor id_3,
    output tri1 id_4,
    output tri id_5,
    input uwire id_6,
    input supply0 id_7,
    input uwire id_8,
    output supply1 id_9
);
endmodule
module module_1 (
    output supply1 id_0,
    input uwire id_1,
    input wand id_2,
    output supply1 id_3,
    input wor id_4,
    input tri0 id_5,
    output wor id_6,
    output wor id_7,
    input supply0 id_8,
    output supply1 id_9,
    input tri1 id_10,
    input tri id_11
);
  assign id_9 = 1 & id_1;
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_9,
      id_9,
      id_10,
      id_10,
      id_10,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
