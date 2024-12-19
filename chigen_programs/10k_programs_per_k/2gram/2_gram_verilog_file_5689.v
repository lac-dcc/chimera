// Seed: 356857249
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5,
    output supply0 id_6,
    input supply0 id_7,
    input tri id_8,
    input tri1 id_9,
    output tri1 id_10,
    input supply1 id_11,
    input uwire id_12,
    input tri1 id_13,
    output supply1 id_14,
    input tri1 id_15,
    input wor id_16,
    input wor id_17,
    input wor id_18,
    output wire id_19
);
  assign id_6 = id_8;
  wire id_21;
  wire id_22;
  tri0 id_23 = id_3;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    input wor id_3,
    input wor id_4,
    input supply1 id_5,
    input wire id_6,
    output tri1 id_7,
    output tri id_8,
    input supply1 id_9,
    input uwire id_10,
    input wor id_11,
    output tri1 id_12,
    input wand id_13,
    input uwire id_14
);
  assign id_7 = id_11;
  xnor primCall (id_7, id_5, id_10, id_13, id_14, id_11, id_0, id_3, id_6, id_2, id_1, id_9, id_4);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_4,
      id_9,
      id_4,
      id_7,
      id_4,
      id_1,
      id_5,
      id_12,
      id_10,
      id_10,
      id_6,
      id_8,
      id_1,
      id_4,
      id_3,
      id_4,
      id_7
  );
  assign modCall_1.id_9 = 0;
endmodule
