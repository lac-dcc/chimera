// Seed: 756682947
module module_0 (
    output supply1 id_0,
    input wire id_1,
    output tri1 id_2,
    output tri0 id_3,
    output supply0 id_4
);
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    output tri id_0,
    input tri id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri0 id_4,
    output wor id_5,
    input tri1 id_6,
    input uwire id_7,
    input supply0 id_8,
    input wire id_9,
    output uwire id_10,
    input wand id_11,
    input wire id_12,
    output wor id_13,
    inout uwire id_14,
    input wire id_15,
    input tri1 id_16
);
  assign id_10 = id_3;
  nand primCall (id_4, id_11, id_9, id_3, id_2, id_7, id_16, id_12, id_6, id_8, id_14);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_13,
      id_5,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
