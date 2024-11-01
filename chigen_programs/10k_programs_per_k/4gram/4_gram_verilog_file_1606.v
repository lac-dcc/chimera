// Seed: 248761453
module module_0 (
    output tri1 id_0,
    output wor id_1,
    input uwire id_2,
    input tri id_3,
    input tri id_4,
    input wor id_5,
    input tri0 id_6,
    input tri id_7,
    output tri id_8,
    input tri1 id_9,
    input uwire id_10,
    input wor id_11,
    input supply1 id_12,
    input tri1 id_13,
    input tri1 id_14
);
  generate
    uwire id_16, id_17, id_18 = 1;
  endgenerate
  wire id_19;
  assign id_17 = id_9;
  wire id_20;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    input uwire id_2,
    input wand id_3,
    input supply0 id_4,
    output supply1 id_5,
    inout tri1 id_6,
    input tri1 id_7,
    output tri1 id_8
);
  nand (id_1, id_7, id_2, id_6, id_4);
  module_0(
      id_0, id_1, id_4, id_3, id_3, id_3, id_6, id_6, id_0, id_2, id_4, id_7, id_7, id_6, id_3
  );
endmodule
