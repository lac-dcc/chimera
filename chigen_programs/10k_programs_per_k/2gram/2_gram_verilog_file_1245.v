// Seed: 3412153983
module module_0 (
    output tri0  id_0,
    input  tri   id_1,
    input  uwire id_2,
    output tri0  id_3,
    input  wire  id_4,
    input  uwire id_5,
    input  tri0  id_6,
    output tri1  id_7,
    input  wire  id_8,
    input  tri   id_9,
    output tri0  id_10,
    input  wand  id_11,
    output tri0  id_12,
    input  tri1  id_13,
    input  wand  id_14,
    output tri0  id_15,
    output wire  id_16,
    input  wand  id_17,
    input  tri0  id_18,
    input  uwire id_19,
    input  wire  id_20,
    input  uwire id_21,
    input  uwire id_22,
    output wor   id_23,
    input  tri0  id_24,
    output wor   id_25,
    input  uwire id_26
);
  parameter id_28 = 1;
  assign id_15 = -1;
  assign id_3  = -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd53,
    parameter id_8 = 32'd92
) (
    output supply0 id_0,
    output wire id_1,
    input uwire id_2,
    input tri1 id_3,
    output wire id_4,
    output tri1 id_5,
    input tri0 _id_6,
    input wor id_7,
    input tri0 _id_8,
    input wand id_9,
    input supply0 id_10,
    input uwire id_11,
    input wire id_12,
    input wire id_13
);
  wire [id_8  ||  1 : id_6] id_15;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_7,
      id_5,
      id_11,
      id_12,
      id_9,
      id_4,
      id_10,
      id_7,
      id_1,
      id_10,
      id_4,
      id_7,
      id_7,
      id_5,
      id_5,
      id_7,
      id_11,
      id_13,
      id_9,
      id_11,
      id_12,
      id_1,
      id_11,
      id_1,
      id_12
  );
  assign modCall_1.id_15 = 0;
endmodule
