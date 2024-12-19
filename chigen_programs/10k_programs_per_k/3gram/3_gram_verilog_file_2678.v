// Seed: 3929299625
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input wire id_7,
    input tri0 id_8,
    input tri id_9
    , id_25,
    input tri id_10,
    input uwire id_11,
    input uwire id_12,
    output wire id_13,
    input supply1 id_14,
    input supply1 id_15,
    input supply0 id_16,
    input supply0 id_17,
    output wire id_18,
    input wor id_19,
    input wand id_20,
    input supply0 id_21,
    input wand id_22,
    input tri id_23
);
  tri1 id_26 = id_15;
  wire id_27;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    input supply0 id_2,
    input wor id_3,
    input uwire id_4,
    input uwire id_5,
    input wand id_6,
    output tri0 id_7,
    input tri id_8,
    input tri id_9,
    input wand id_10,
    input wand id_11,
    output supply1 id_12
);
  assign id_7 = id_11;
  nand primCall (id_1, id_0, id_9, id_11, id_5, id_4, id_2, id_8, id_3, id_6);
  module_0 modCall_1 (
      id_11,
      id_7,
      id_1,
      id_5,
      id_11,
      id_12,
      id_9,
      id_10,
      id_10,
      id_8,
      id_5,
      id_0,
      id_6,
      id_7,
      id_8,
      id_0,
      id_9,
      id_8,
      id_7,
      id_2,
      id_6,
      id_11,
      id_0,
      id_10
  );
endmodule
