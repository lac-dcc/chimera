// Seed: 623113184
module module_0 (
    input tri id_0,
    output wire id_1,
    input wand id_2,
    input wire id_3,
    output wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    input tri0 id_7,
    input supply0 id_8,
    output supply1 id_9,
    output uwire id_10,
    input tri0 id_11,
    output tri0 id_12,
    input wire id_13,
    output wire id_14,
    input tri1 id_15
);
  assign id_12 = 1;
  wire id_17;
  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output tri1 id_4,
    input tri id_5,
    input tri0 id_6,
    input supply0 id_7,
    output wire id_8,
    input supply1 id_9,
    output wand id_10
);
  logic [1 : 1] id_12, id_13, id_14, id_15, id_16;
  nand primCall (id_8, id_9, id_3, id_2, id_5, id_13, id_6, id_7, id_14, id_16);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5,
      id_0,
      id_3,
      id_5,
      id_5,
      id_5,
      id_8,
      id_8,
      id_6,
      id_10,
      id_5,
      id_4,
      id_1
  );
endmodule
