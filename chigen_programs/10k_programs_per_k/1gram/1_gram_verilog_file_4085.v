// Seed: 688130872
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input tri id_2,
    output wire id_3,
    input supply1 id_4,
    input tri id_5,
    output tri id_6,
    input supply0 id_7,
    output wire id_8,
    input wand id_9,
    output supply0 id_10,
    input wand id_11,
    input wor id_12,
    input wire id_13,
    output wire id_14,
    input tri0 id_15[1 'b0 : -1],
    input supply1 id_16,
    input supply0 id_17,
    input tri1 void id_18,
    output uwire id_19,
    output uwire id_20
    , id_22
);
endmodule
module module_1 #(
    parameter id_10 = 32'd0,
    parameter id_2  = 32'd59,
    parameter id_7  = 32'd18
) (
    output tri0  id_0,
    output logic id_1,
    input  wand  _id_2,
    output tri1  id_3,
    input  tri1  id_4,
    output tri0  id_5,
    input  tri   id_6,
    input  tri   _id_7[1 : id_7],
    input  wire  id_8
);
  initial id_1 = 1 | -1'h0;
  assign id_1 = id_8;
  logic _id_10;
  wire [id_2 : id_10] id_11, id_12;
  assign id_1 = id_10;
  logic id_13 = 1;
  assign id_5 = 1;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_5,
      id_8,
      id_4,
      id_0,
      id_6,
      id_0,
      id_4,
      id_0,
      id_6,
      id_4,
      id_8,
      id_5,
      id_8,
      id_8,
      id_6,
      id_6,
      id_5,
      id_0
  );
  assign modCall_1.id_3 = 0;
  logic id_15;
  logic id_16;
  ;
  assign id_12 = 1'b0 & -1;
endmodule
