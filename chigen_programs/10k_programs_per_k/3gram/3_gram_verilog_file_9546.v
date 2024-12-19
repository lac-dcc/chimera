// Seed: 2180016651
module module_0 (
    output tri   id_0,
    output uwire id_1,
    output wor   id_2,
    input  wor   id_3,
    output uwire id_4,
    output wire  id_5,
    output tri   id_6,
    input  tri   id_7,
    input  tri0  id_8
);
  wor  id_10;
  tri1 id_11 = 1'b0 * id_10;
  generate
    assign id_0 = id_8;
  endgenerate
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    input wand id_3,
    input wire id_4,
    output wor id_5,
    input tri0 id_6,
    output supply1 id_7,
    input tri0 id_8,
    input wor id_9,
    input supply1 id_10,
    input tri id_11,
    input supply1 id_12,
    output supply0 id_13,
    input wor id_14,
    input wire id_15,
    input supply0 id_16,
    output wor id_17,
    input wand id_18,
    input tri1 id_19,
    output uwire id_20,
    output tri id_21,
    input tri0 id_22,
    input tri id_23,
    output wire id_24
);
  wire id_26;
  nand primCall (
      id_17,
      id_15,
      id_23,
      id_14,
      id_19,
      id_10,
      id_16,
      id_1,
      id_11,
      id_8,
      id_4,
      id_22,
      id_3,
      id_12,
      id_0,
      id_18,
      id_9,
      id_2,
      id_6
  );
  module_0 modCall_1 (
      id_5,
      id_17,
      id_5,
      id_9,
      id_5,
      id_13,
      id_20,
      id_8,
      id_15
  );
  assign modCall_1.id_3 = 0;
endmodule
