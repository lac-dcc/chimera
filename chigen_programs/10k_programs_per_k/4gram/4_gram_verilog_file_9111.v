// Seed: 2097198770
module module_0 (
    input  uwire id_0,
    input  tri1  id_1,
    output wor   id_2,
    input  uwire id_3
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input tri0 id_3,
    input tri id_4,
    output tri1 id_5,
    input tri0 id_6,
    input uwire id_7,
    input supply1 id_8,
    output wor id_9,
    output tri1 id_10,
    input supply1 id_11,
    output wand id_12,
    input tri1 id_13,
    output supply0 id_14,
    input wire id_15,
    wire id_17
);
  assign id_14 = {1, id_13 & id_13, 1'b0 - id_0, 1, id_0} - id_7;
  xor primCall (id_5, id_17, id_0, id_11, id_4, id_8, id_3, id_13, id_7, id_15, id_6);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_0
  );
endmodule
