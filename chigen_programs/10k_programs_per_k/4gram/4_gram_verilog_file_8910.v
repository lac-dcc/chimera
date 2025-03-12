// Seed: 768503722
module module_0 (
    output wor   id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  wand  id_3,
    output tri1  id_4,
    input  tri1  id_5,
    output uwire id_6,
    output tri0  id_7,
    input  tri   id_8,
    input  wire  id_9,
    input  tri0  id_10
);
  wire id_12;
  integer id_13;
  ;
  wire id_14;
  logic id_15, id_16;
endmodule
module module_1 #(
    parameter id_19 = 32'd57
) (
    input tri0 id_0,
    output tri1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input supply0 id_5,
    output wor id_6,
    input tri id_7,
    input tri0 id_8,
    input supply0 id_9,
    input wire id_10,
    input wor id_11,
    input tri0 id_12,
    input tri id_13,
    output tri id_14,
    input supply0 id_15,
    output uwire id_16,
    output tri id_17,
    output tri id_18,
    input tri0 _id_19,
    input wor id_20,
    input wor id_21
);
  wire [-1 : id_19] id_23;
  module_0 modCall_1 (
      id_14,
      id_10,
      id_20,
      id_2,
      id_14,
      id_2,
      id_17,
      id_16,
      id_7,
      id_13,
      id_9
  );
  assign modCall_1.id_9 = 0;
endmodule
