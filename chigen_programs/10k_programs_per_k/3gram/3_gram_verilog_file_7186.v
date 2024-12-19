// Seed: 859526850
module module_0 (
    input wand id_0,
    output uwire id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri id_4,
    input supply1 id_5,
    input tri id_6,
    output supply0 id_7,
    input tri0 id_8,
    output supply0 id_9,
    output wor id_10,
    input tri0 id_11
);
  wire id_13, id_14;
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input wand id_2,
    output wire id_3,
    input wor id_4,
    input tri0 id_5,
    output supply1 id_6,
    inout tri1 id_7
);
  assign id_6 = id_7;
  nand primCall (id_7, id_5, id_0, id_4, id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_7,
      id_3,
      id_3,
      id_7
  );
  assign modCall_1.id_3 = 0;
endmodule
