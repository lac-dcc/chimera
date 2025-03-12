// Seed: 2124284310
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output wand id_2,
    output wire id_3,
    output supply1 id_4,
    input tri id_5,
    output supply0 id_6,
    output tri0 id_7
);
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input uwire id_2,
    input supply1 id_3,
    output wand id_4,
    output wor id_5,
    input supply0 id_6,
    input uwire id_7,
    input uwire id_8,
    input supply0 id_9
    , id_25,
    input wire id_10,
    input wand id_11,
    output supply0 id_12,
    input tri0 id_13,
    input uwire id_14,
    input tri id_15
    , id_26,
    input supply1 id_16,
    output supply0 id_17,
    output tri id_18,
    input supply1 id_19,
    input tri id_20,
    input supply1 id_21,
    input uwire id_22,
    input wand id_23
);
  always @(posedge id_1) force id_5 = 1'b0;
  nand primCall (
      id_18,
      id_25,
      id_26,
      id_14,
      id_9,
      id_13,
      id_11,
      id_19,
      id_1,
      id_2,
      id_7,
      id_10,
      id_3,
      id_20,
      id_15,
      id_21,
      id_23,
      id_6
  );
  module_0 modCall_1 (
      id_2,
      id_10,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_18
  );
  assign modCall_1.id_7 = 0;
endmodule
