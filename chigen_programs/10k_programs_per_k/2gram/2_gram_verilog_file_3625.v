// Seed: 1442623108
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    input wire id_3,
    input uwire id_4,
    input wand id_5,
    output wire id_6
);
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    output supply1 id_6,
    output supply0 id_7,
    input tri id_8,
    input wire id_9,
    input wand id_10
);
  nand primCall (id_6, id_4, id_0, id_1, id_5, id_3, id_9);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_9,
      id_9,
      id_1,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
