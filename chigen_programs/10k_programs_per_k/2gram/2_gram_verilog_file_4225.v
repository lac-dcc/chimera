// Seed: 2342927457
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wor id_3,
    input wand id_4,
    input supply1 id_5,
    input wor id_6,
    input supply1 id_7,
    input wor id_8,
    output wor id_9,
    output tri0 id_10,
    input uwire id_11,
    input tri id_12,
    input wor id_13,
    input wor id_14,
    output uwire id_15,
    output wire id_16,
    input tri id_17
);
  wire id_19;
endmodule
module module_1 (
    output supply0 id_0,
    output tri1 id_1,
    input wire id_2,
    output uwire id_3,
    output tri1 id_4,
    input wire id_5,
    output tri0 id_6,
    input uwire id_7,
    input wor id_8,
    input tri0 id_9,
    output wand id_10,
    output supply0 id_11,
    input uwire id_12,
    output wire id_13
);
  wire id_15, id_16, id_17, id_18, id_19 = 1'b0 - id_16, id_20, id_21, id_22, id_23, id_24;
  nand primCall (
      id_4,
      id_7,
      id_20,
      id_16,
      id_21,
      id_22,
      id_5,
      id_2,
      id_23,
      id_24,
      id_9,
      id_8,
      id_12,
      id_15,
      id_17,
      id_19,
      id_18
  );
  module_0 modCall_1 (
      id_0,
      id_12,
      id_7,
      id_5,
      id_12,
      id_8,
      id_5,
      id_5,
      id_8,
      id_1,
      id_6,
      id_9,
      id_8,
      id_2,
      id_9,
      id_4,
      id_13,
      id_7
  );
  assign modCall_1.id_3 = 0;
endmodule
