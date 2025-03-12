// Seed: 270559243
module module_0 (
    input wor id_0,
    input wand id_1,
    input wand id_2,
    input tri0 id_3,
    output uwire id_4,
    output wor id_5,
    input uwire id_6,
    input wor id_7,
    input supply0 id_8,
    output tri1 id_9,
    output wor id_10,
    input supply0 id_11,
    input supply1 id_12,
    output wire id_13,
    output supply1 id_14
    , id_31, id_32,
    output supply0 id_15,
    output tri1 id_16,
    input supply1 id_17,
    input wor id_18,
    input wor id_19,
    input wire id_20,
    input tri id_21,
    output wor id_22,
    output wor id_23,
    input tri1 id_24,
    input tri1 id_25,
    output wand id_26,
    input uwire id_27,
    input tri1 id_28,
    input wor id_29
);
  assign id_16 = 1'b0 ? id_21 : -1;
  assign id_15 = id_11;
endmodule
module module_1 #(
    parameter id_10 = 32'd87,
    parameter id_4  = 32'd88
) (
    input  tri0  id_0,
    input  wand  id_1,
    output wand  id_2,
    input  tri   id_3,
    input  wire  _id_4,
    output wand  id_5,
    input  wor   id_6,
    input  wand  id_7,
    input  tri   id_8,
    output uwire id_9,
    output wor   _id_10
);
  wand  [ -1 : -1 'h0] id_12;
  logic [id_10 : id_4] id_13;
  assign id_2 = 1;
  xnor primCall (id_5, id_1, id_6, id_8, id_3, id_7);
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_7,
      id_9,
      id_2,
      id_8,
      id_8,
      id_0,
      id_5,
      id_2,
      id_8,
      id_6,
      id_2,
      id_5,
      id_9,
      id_2,
      id_7,
      id_3,
      id_1,
      id_0,
      id_1,
      id_9,
      id_2,
      id_6,
      id_6,
      id_5,
      id_0,
      id_7,
      id_0
  );
  assign modCall_1.id_18 = 0;
  logic id_14;
  assign id_12 = -1;
  wire id_15;
  logic [1  <= "" : 1  -  -1] id_16;
endmodule
