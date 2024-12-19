// Seed: 1744053496
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output wire id_2,
    input wand id_3,
    input tri id_4,
    input tri1 id_5,
    input wor id_6,
    input tri id_7
);
  assign id_2 = id_6;
  wire id_9;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    output tri0 id_2,
    input tri id_3,
    input supply1 id_4#(.id_16(1)),
    input supply1 id_5,
    output tri id_6,
    output supply0 id_7,
    output tri0 id_8,
    input supply0 id_9,
    input wor id_10,
    input tri0 id_11,
    input tri id_12,
    output supply1 id_13,
    output tri0 id_14
);
  wire id_17;
  nand primCall (id_2, id_3, id_0, id_5, id_10, id_17, id_16);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_5,
      id_1,
      id_5,
      id_0,
      id_12
  );
  assign modCall_1.type_0 = 0;
endmodule
