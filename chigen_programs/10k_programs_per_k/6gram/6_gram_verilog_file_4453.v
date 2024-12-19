// Seed: 2587110810
module module_0 (
    output tri   id_0,
    input  tri0  id_1,
    output wand  id_2,
    output tri0  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    input  wire  id_6,
    input  uwire id_7,
    output tri   id_8,
    output tri0  id_9,
    input  tri1  id_10,
    input  wand  id_11,
    input  tri0  id_12,
    output wire  id_13,
    input  wand  id_14,
    output wire  id_15,
    output tri0  id_16,
    input  tri0  id_17,
    input  wire  id_18,
    input  tri0  id_19,
    output tri1  id_20,
    input  tri0  id_21,
    output uwire id_22,
    output wire  id_23,
    input  uwire id_24,
    input  uwire id_25,
    output wor   id_26,
    input  tri0  id_27,
    output wor   id_28,
    input  uwire id_29
);
  wire id_31;
endmodule
module module_1 (
    input uwire id_0,
    output wor id_1,
    output uwire id_2,
    output wire id_3,
    input tri0 id_4,
    output tri id_5,
    input tri id_6,
    input wor id_7,
    input supply1 id_8,
    input uwire id_9,
    output tri1 id_10
);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_2,
      id_7,
      id_6,
      id_8,
      id_8,
      id_3,
      id_10,
      id_9,
      id_8,
      id_6,
      id_3,
      id_4,
      id_3,
      id_10,
      id_7,
      id_4,
      id_7,
      id_10,
      id_9,
      id_10,
      id_3,
      id_6,
      id_6,
      id_5,
      id_9,
      id_2,
      id_0
  );
  assign modCall_1.type_5 = 0;
  reg id_12;
  assign id_2  = 1'h0;
  assign id_2  = id_4;
  assign id_12 = 1;
  always @(id_4 or posedge 1'b0) id_12 <= 1;
endmodule
