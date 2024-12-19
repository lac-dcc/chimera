// Seed: 2835712371
module module_0 (
    output tri id_0,
    output supply1 id_1,
    output uwire id_2,
    output tri0 id_3,
    output supply1 id_4,
    input wor id_5,
    input wor id_6,
    input supply1 id_7,
    input wor id_8,
    output wor id_9
);
endmodule
module module_1 (
    input wand id_0,
    output tri1 id_1,
    input tri0 id_2,
    input uwire id_3,
    input wand id_4,
    input uwire id_5,
    input tri id_6,
    output tri1 id_7,
    input supply1 id_8,
    input tri id_9
);
  assign id_7 = id_6;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_1,
      id_1,
      id_1,
      id_6,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
