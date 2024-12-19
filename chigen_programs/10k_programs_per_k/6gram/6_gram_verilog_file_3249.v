// Seed: 2416957243
module module_0 (
    input tri id_0,
    output supply1 id_1,
    output wire id_2,
    output uwire id_3,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    input wor id_7,
    input supply0 id_8,
    input wire id_9,
    input tri1 id_10,
    input supply1 id_11,
    input tri1 id_12,
    output tri id_13,
    output wand id_14,
    output supply0 id_15,
    input wand id_16,
    input wor id_17,
    input tri id_18,
    input uwire id_19,
    input uwire id_20
    , id_23,
    output tri id_21
);
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    inout wire id_2,
    input supply1 id_3,
    input wire id_4,
    input wire id_5,
    input wire id_6,
    output wor id_7,
    input tri0 id_8,
    output wire id_9,
    input tri1 id_10,
    output tri id_11,
    output tri0 id_12,
    output tri id_13,
    input supply1 id_14,
    output tri id_15,
    inout uwire id_16
);
  wire id_18;
  nand primCall (id_15, id_10, id_0, id_4, id_1, id_5, id_14, id_2, id_16, id_3, id_18, id_6);
  module_0 modCall_1 (
      id_4,
      id_16,
      id_9,
      id_2,
      id_2,
      id_3,
      id_4,
      id_10,
      id_6,
      id_10,
      id_5,
      id_4,
      id_14,
      id_12,
      id_7,
      id_11,
      id_3,
      id_10,
      id_8,
      id_4,
      id_6,
      id_15
  );
  assign modCall_1.type_24 = 0;
endmodule
