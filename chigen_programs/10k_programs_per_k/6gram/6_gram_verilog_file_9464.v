// Seed: 1553796952
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input tri0 id_2,
    output uwire id_3,
    output tri id_4,
    output wire id_5,
    output uwire id_6,
    output supply1 id_7,
    output tri0 id_8,
    output wor id_9,
    input wand id_10,
    output tri0 id_11
);
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    input supply1 id_2,
    output uwire id_3,
    output tri0 id_4,
    output wand id_5
);
  assign id_4 = id_2;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_3,
      id_5,
      id_3,
      id_5,
      id_4,
      id_5,
      id_5,
      id_0,
      id_4
  );
  assign modCall_1.id_2 = 0;
  wire id_8;
  nand primCall (id_4, id_1, id_0, id_7);
endmodule
