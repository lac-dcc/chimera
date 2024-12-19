// Seed: 3287871524
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input tri1 id_2,
    output tri id_3,
    input tri0 id_4,
    input uwire id_5,
    output supply1 id_6,
    output tri id_7,
    output tri1 id_8,
    input uwire id_9,
    input tri id_10,
    inout tri id_11,
    output wire id_12,
    output wire id_13,
    output supply0 id_14,
    input wire id_15,
    output tri1 id_16,
    input wor id_17,
    input supply1 id_18,
    output supply1 id_19,
    input tri id_20,
    input wor id_21
);
  id_23(
      1'b0
  );
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output tri id_2,
    input tri id_3,
    output wand id_4,
    input supply1 id_5,
    input wand id_6,
    output wire id_7,
    input supply1 id_8,
    output supply0 id_9,
    output supply1 id_10,
    input wand id_11,
    input supply1 id_12,
    output supply0 id_13,
    input wor id_14,
    input wire id_15,
    input wand id_16,
    output tri id_17
);
  uwire id_19, id_20;
  module_0 modCall_1 (
      id_20,
      id_1,
      id_20,
      id_4,
      id_6,
      id_6,
      id_13,
      id_9,
      id_20,
      id_16,
      id_6,
      id_19,
      id_10,
      id_19,
      id_2,
      id_0,
      id_20,
      id_6,
      id_5,
      id_7,
      id_1,
      id_5
  );
  assign modCall_1.type_2 = 0;
  assign id_19 = id_0;
  nand primCall (
      id_13, id_16, id_12, id_6, id_3, id_15, id_19, id_11, id_20, id_1, id_8, id_0, id_14
  );
endmodule
