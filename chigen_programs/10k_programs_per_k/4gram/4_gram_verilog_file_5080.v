// Seed: 2916143504
module module_0 (
    input tri id_0,
    input tri id_1,
    input supply1 id_2,
    input uwire id_3,
    input uwire id_4,
    output uwire id_5,
    input wor id_6,
    output wor id_7,
    input supply0 id_8,
    input wire id_9,
    output wire id_10,
    input tri1 id_11,
    output supply1 id_12,
    input tri1 id_13,
    output tri id_14,
    output wand id_15,
    input supply0 id_16,
    input wand id_17,
    output uwire id_18,
    input uwire id_19,
    input tri id_20,
    output wand id_21,
    input wire id_22,
    output wor id_23,
    input supply0 id_24,
    input supply1 id_25,
    output wand id_26
);
  assign id_15 = -id_13;
endmodule
module module_1 #(
    parameter id_0  = 32'd93,
    parameter id_10 = 32'd74,
    parameter id_15 = 32'd26,
    parameter id_4  = 32'd93
) (
    output wor   _id_0,
    inout  uwire id_1,
    output wor   id_2
    , id_13,
    output uwire id_3,
    input  uwire _id_4,
    output tri0  id_5,
    output wire  id_6,
    input  uwire id_7
    , id_14,
    input  tri0  id_8,
    output logic id_9,
    input  tri1  _id_10,
    input  wor   id_11
);
  assign id_6 = id_11 !=? id_4;
  parameter id_15 = 1;
  assign id_14[id_4] = 1;
  logic [id_10 : id_0] id_16;
  wire id_17, id_18;
  wire id_19;
  wire id_20;
  wire [id_15  -  -1  *  -1 : -1  ===  id_10] id_21;
  logic id_22, id_23;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_1,
      id_1,
      id_11,
      id_6,
      id_8,
      id_6,
      id_8,
      id_7,
      id_6,
      id_1,
      id_2,
      id_8,
      id_6,
      id_1,
      id_11,
      id_7,
      id_5,
      id_7,
      id_11,
      id_5,
      id_8,
      id_5,
      id_1,
      id_8,
      id_1
  );
  assign modCall_1.id_19 = 0;
  wire id_24;
  always @(1 or posedge id_14) id_9 = -1 <-> 1;
  assign id_22[1] = -1;
endmodule
