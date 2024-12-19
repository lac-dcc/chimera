// Seed: 3039961699
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input wor id_2,
    input wor id_3,
    input tri1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    input uwire id_8,
    input supply0 id_9,
    output uwire id_10,
    input wor id_11,
    input uwire id_12,
    output tri0 id_13,
    input wand id_14,
    input wor id_15,
    output supply1 id_16,
    input tri0 id_17,
    output tri1 id_18,
    output wor id_19,
    input supply1 id_20,
    input wor id_21,
    input tri1 id_22,
    input tri1 id_23,
    output tri id_24,
    output wor id_25
);
  assign id_25 = 1;
  wire id_27;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output tri id_3,
    output wire id_4,
    input wor id_5,
    input tri1 id_6,
    input tri0 id_7,
    output tri id_8,
    input tri id_9,
    input wand id_10,
    input wire id_11,
    input wire id_12,
    input wand id_13,
    input wand id_14,
    input wand id_15,
    input wire id_16,
    inout supply0 id_17,
    output tri1 id_18,
    output wire id_19
);
  wire id_21;
  supply0 id_22, id_23, id_24, id_25, id_26, id_27, id_28;
  supply0 id_29 = 1;
  xor primCall (
      id_4,
      id_28,
      id_14,
      id_7,
      id_22,
      id_10,
      id_5,
      id_0,
      id_13,
      id_23,
      id_15,
      id_26,
      id_6,
      id_27,
      id_11,
      id_17,
      id_12,
      id_2,
      id_9,
      id_16,
      id_25
  );
  always id_19 = id_24 - 1'b0;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_5,
      id_5,
      id_14,
      id_2,
      id_14,
      id_17,
      id_7,
      id_10,
      id_4,
      id_13,
      id_5,
      id_17,
      id_5,
      id_9,
      id_17,
      id_12,
      id_18,
      id_19,
      id_14,
      id_17,
      id_13,
      id_14,
      id_1,
      id_4
  );
  assign modCall_1.id_7 = 0;
  wire id_30 = 1 & 1;
endmodule
