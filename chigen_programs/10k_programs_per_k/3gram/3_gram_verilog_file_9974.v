// Seed: 3937210527
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output tri1 id_3,
    input tri1 id_4,
    output tri id_5,
    input supply0 id_6,
    input tri0 id_7,
    output supply1 id_8,
    input wor id_9,
    input tri id_10,
    input tri1 id_11,
    input supply0 id_12,
    output wand id_13,
    input uwire id_14,
    output supply0 id_15,
    input wire id_16,
    output tri0 id_17,
    output uwire id_18,
    input supply1 id_19,
    input tri1 id_20,
    output supply0 id_21
);
  logic id_23;
  ;
endmodule
module module_1 #(
    parameter id_12 = 32'd32
) (
    output tri   id_0,
    input  tri0  id_1,
    input  tri   id_2,
    output tri0  id_3,
    output uwire id_4,
    input  tri0  id_5,
    output wire  id_6,
    input  wand  id_7,
    input  tri0  id_8,
    output tri1  id_9,
    output wand  id_10,
    input  tri0  id_11
    , id_17,
    input  wire  _id_12,
    input  wand  id_13,
    input  wire  id_14,
    input  wire  id_15
);
  logic id_18;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_14,
      id_0,
      id_1,
      id_4,
      id_8,
      id_13,
      id_3,
      id_7,
      id_7,
      id_15,
      id_11,
      id_0,
      id_1,
      id_0,
      id_2,
      id_9,
      id_10,
      id_1,
      id_13,
      id_3
  );
  assign modCall_1.id_4 = 0;
  assign id_0 = 1 * 1;
  assign id_18[1'd0 : id_12] = id_11;
  wire id_19;
  parameter id_20 = -1'h0;
endmodule
