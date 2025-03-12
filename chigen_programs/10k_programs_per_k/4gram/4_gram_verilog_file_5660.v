// Seed: 2939577738
module module_0 (
    input wand id_0,
    output wand id_1,
    output supply1 id_2,
    input tri id_3,
    input tri id_4,
    input tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input tri id_8
);
  wire [1 : -1] id_10;
  wire id_11, id_12;
  wire [-1 : 1 'b0] id_13;
endmodule
module module_1 (
    output wor id_0,
    output wor id_1,
    input supply1 id_2,
    output wand id_3,
    output uwire id_4,
    input wand id_5,
    output wor id_6,
    output tri id_7,
    output wand id_8,
    inout wire id_9,
    input supply0 id_10,
    input wire id_11,
    input tri id_12
);
  logic id_14;
  nand primCall (id_4, id_11, id_9, id_10, id_12, id_5, id_2, id_14);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_6,
      id_9,
      id_5,
      id_9,
      id_11,
      id_5,
      id_11
  );
  assign modCall_1.id_2 = 0;
endmodule
