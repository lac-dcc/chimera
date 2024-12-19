// Seed: 2794220249
module module_0 (
    input wor id_0,
    output supply1 id_1,
    output tri1 id_2,
    output uwire id_3,
    output tri1 id_4,
    input tri id_5,
    output wor id_6
);
  wire id_8;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input wand id_2,
    output wire id_3,
    input wire id_4,
    input supply0 id_5,
    output supply1 id_6,
    output tri0 id_7,
    input tri0 id_8,
    input wor id_9,
    input wire id_10,
    input supply0 id_11,
    output tri1 id_12,
    output uwire id_13,
    input tri1 id_14,
    output wire id_15,
    input tri0 id_16,
    input uwire id_17,
    input wor id_18,
    output supply0 id_19,
    output tri id_20,
    output tri id_21
);
  assign id_13 = 1'b0;
  nand primCall (id_21, id_17, id_10, id_2, id_18, id_8, id_1, id_11, id_14, id_9, id_5, id_16);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_19,
      id_19,
      id_6,
      id_11,
      id_21
  );
  assign modCall_1.type_1 = 0;
endmodule
