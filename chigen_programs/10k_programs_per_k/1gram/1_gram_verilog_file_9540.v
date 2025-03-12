// Seed: 1370092578
program module_0 (
    output wor id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    output supply0 id_4,
    input wand id_5,
    input wand id_6
);
  assign module_1.id_4 = 0;
endprogram
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    input tri id_2,
    output tri1 id_3,
    input tri0 id_4,
    input wire id_5,
    input wire id_6,
    output wand id_7,
    output uwire id_8,
    input tri0 id_9,
    output supply1 id_10,
    output tri0 id_11,
    input supply0 id_12
);
  nand primCall (id_7, id_9, id_4, id_0, id_12, id_5, id_6, id_2);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_6,
      id_5,
      id_11,
      id_12,
      id_9
  );
endmodule
