// Seed: 144262112
module module_0 (
    output tri id_0,
    output tri0 id_1,
    input tri1 id_2,
    input uwire id_3,
    input uwire id_4,
    input wire id_5,
    output supply1 id_6,
    input supply1 id_7,
    output tri id_8,
    input tri0 id_9,
    input tri0 id_10,
    input supply1 id_11
    , id_17,
    input supply0 id_12,
    input supply1 id_13,
    output tri0 id_14,
    output wire id_15
);
  logic id_18;
endmodule
module module_1 #(
    parameter id_1 = 32'd97,
    parameter id_9 = 32'd71
) (
    input supply1 id_0,
    output wand _id_1,
    output wor id_2,
    input supply1 id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri1 id_7,
    output supply0 id_8,
    input wire _id_9,
    input tri0 id_10,
    output tri1 id_11
);
  logic id_13;
  ;
  wire id_14;
  logic [id_1 : id_9] id_15;
  nand primCall (id_11, id_10, id_4, id_15, id_7, id_13, id_5);
  module_0 modCall_1 (
      id_2,
      id_11,
      id_7,
      id_4,
      id_7,
      id_7,
      id_8,
      id_5,
      id_11,
      id_7,
      id_10,
      id_0,
      id_5,
      id_7,
      id_8,
      id_11
  );
  assign modCall_1.id_0 = 0;
endmodule
