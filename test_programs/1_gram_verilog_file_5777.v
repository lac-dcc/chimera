// Seed: 1350040481
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    input supply1 id_4,
    input wor id_5,
    output wire id_6,
    input uwire id_7,
    output wire id_8,
    input wand id_9,
    output wire id_10
);
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input wire id_0,
    output tri0 id_1,
    input wor id_2,
    output wand id_3,
    input wire id_4,
    output wand id_5,
    input tri id_6,
    input tri0 id_7,
    output supply0 id_8,
    input supply0 id_9,
    input supply0 id_10
);
  assign id_3 = -1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_9,
      id_7,
      id_2,
      id_8,
      id_6,
      id_3,
      id_10,
      id_3
  );
  nand primCall (id_3, id_9, id_2, id_0, id_7, id_4, id_6);
endmodule
