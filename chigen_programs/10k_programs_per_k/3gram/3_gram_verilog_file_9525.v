// Seed: 2948523206
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input tri0 id_2,
    output tri1 id_3,
    input uwire id_4,
    input wor id_5,
    output tri0 id_6,
    input wor id_7,
    output wor id_8,
    output wor id_9,
    output tri0 id_10
);
endmodule
module module_1 (
    output wor id_0,
    output wor id_1,
    input supply1 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri id_5,
    output wor id_6
);
  assign id_6 = id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_5,
      id_3,
      id_1,
      id_5,
      id_0,
      id_4,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
