// Seed: 2761550962
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output wor id_4,
    input supply1 id_5,
    input wire id_6,
    input wor id_7,
    input uwire id_8,
    output wire id_9,
    output wire id_10,
    input wire id_11,
    input wire id_12,
    input tri0 id_13,
    input wor id_14,
    input tri0 id_15,
    input supply1 id_16,
    input wor id_17,
    input wand id_18,
    input supply0 id_19,
    output supply0 id_20
);
  wire id_22;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    input wor id_2,
    output tri1 id_3,
    input tri id_4,
    input tri0 id_5,
    input wor id_6,
    input tri id_7,
    input wor id_8,
    output supply0 id_9,
    output wand id_10,
    input wor id_11,
    inout tri1 id_12
);
  assign id_9 = id_2;
  xor primCall (id_9, id_12, id_7, id_11, id_1, id_2, id_5, id_0, id_4, id_8);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_3,
      id_5,
      id_10,
      id_12,
      id_7,
      id_12,
      id_6,
      id_9,
      id_10,
      id_0,
      id_6,
      id_8,
      id_8,
      id_12,
      id_7,
      id_8,
      id_7,
      id_2,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
