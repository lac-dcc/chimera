// Seed: 1224718420
module module_0 (
    input wire id_0,
    output uwire id_1,
    output uwire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply0 id_6,
    output wor id_7,
    output tri id_8
);
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri id_0,
    input uwire id_1,
    input tri0 id_2,
    output supply1 id_3
    , id_12,
    input tri0 id_4,
    input tri1 id_5,
    input wand id_6,
    input uwire id_7,
    input supply0 id_8,
    output wand id_9,
    output wire id_10
);
  assign id_3 = 1 & id_6;
  nand primCall (id_10, id_2, id_7, id_4, id_8);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_9,
      id_5,
      id_6,
      id_9,
      id_5,
      id_9,
      id_10
  );
endmodule
