// Seed: 3660626344
module module_0 (
    output tri1 id_0,
    input wor id_1,
    output wire id_2,
    output supply1 id_3,
    input wor id_4,
    input wire id_5,
    input supply0 id_6,
    input uwire id_7,
    output tri id_8,
    input wand id_9,
    output wire id_10,
    output supply1 id_11,
    input tri1 id_12,
    output tri0 id_13,
    input supply0 id_14,
    input tri id_15,
    input supply1 id_16,
    output wire id_17,
    output tri id_18,
    output tri1 id_19,
    output wor id_20,
    output uwire id_21,
    output tri0 id_22,
    output tri id_23,
    input wand id_24
);
  supply1 id_26 = 1'b0 & {id_6, id_7};
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input uwire id_2,
    output wor id_3,
    input uwire id_4,
    output wire id_5,
    output tri1 id_6,
    input tri1 id_7,
    input wire id_8,
    output supply0 id_9,
    output supply1 id_10,
    input tri id_11,
    output tri id_12,
    inout supply1 id_13,
    input tri0 id_14,
    input wor id_15,
    input tri1 id_16
);
  uwire id_18;
  module_0 modCall_1 (
      id_3,
      id_16,
      id_18,
      id_3,
      id_2,
      id_13,
      id_4,
      id_7,
      id_6,
      id_18,
      id_5,
      id_5,
      id_15,
      id_12,
      id_4,
      id_11,
      id_1,
      id_18,
      id_6,
      id_12,
      id_6,
      id_10,
      id_6,
      id_12,
      id_11
  );
  assign modCall_1.id_3 = 0;
  assign id_13 = id_0 < 1;
  nand primCall (id_6, id_14, id_18, id_4, id_8, id_15, id_13, id_0, id_1);
  assign id_18 = id_2;
endmodule
