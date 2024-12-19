// Seed: 1308434605
module module_0 (
    output tri id_0,
    input uwire id_1,
    input tri id_2,
    output wand id_3,
    output wand id_4,
    input supply0 id_5,
    output wand id_6,
    output uwire id_7,
    input tri id_8,
    input tri0 id_9,
    input tri0 id_10,
    input tri0 id_11,
    output tri id_12,
    input tri0 id_13,
    input tri id_14,
    output tri0 id_15,
    input supply0 id_16,
    input uwire sample,
    input supply1 module_0,
    output tri id_19,
    output wor id_20,
    input wire id_21,
    input uwire id_22,
    input wire id_23
);
  wire id_25;
endmodule
module module_1 (
    output wand id_0,
    output wand id_1,
    input wire id_2,
    output wor id_3
    , id_18,
    input supply0 id_4,
    input wand id_5,
    input tri1 id_6,
    input tri0 id_7,
    output wand id_8
    , id_19,
    output tri1 id_9
    , id_20,
    input tri1 id_10,
    output wor id_11,
    input supply0 id_12,
    output supply0 id_13,
    output supply0 id_14,
    input wor id_15,
    output wire id_16
);
  wire id_21;
  nand primCall (id_3, id_6, id_15, id_4, id_18, id_10, id_2, id_22, id_5, id_21, id_20, id_12);
  wire id_22;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_2,
      id_8,
      id_9,
      id_2,
      id_0,
      id_11,
      id_7,
      id_10,
      id_4,
      id_15,
      id_9,
      id_5,
      id_4,
      id_16,
      id_2,
      id_10,
      id_12,
      id_9,
      id_3,
      id_7,
      id_15,
      id_7
  );
  assign modCall_1.id_0 = 0;
endmodule
