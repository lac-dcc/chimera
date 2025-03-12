// Seed: 2820775696
module module_0 (
    input  wand id_0,
    output tri0 id_1,
    output tri1 module_0,
    input  wire id_3,
    input  wor  id_4
);
  wire id_6;
  ;
endmodule
module module_1 #(
    parameter id_0  = 32'd22,
    parameter id_16 = 32'd54,
    parameter id_20 = 32'd35
) (
    input tri0 _id_0,
    input wand id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wor id_4,
    input wor id_5,
    input uwire id_6,
    input wor id_7,
    input tri id_8,
    input wire id_9,
    input wor id_10,
    input tri1 id_11,
    input wor id_12,
    input supply1 id_13,
    input tri1 id_14,
    input tri id_15,
    input tri _id_16,
    output supply1 id_17,
    output supply0 id_18,
    input wire id_19,
    input uwire _id_20,
    input wand id_21,
    output wire id_22
    , id_25,
    output wor id_23
);
  logic id_26;
  ;
  module_0 modCall_1 (
      id_1,
      id_17,
      id_23,
      id_11,
      id_12
  );
  assign modCall_1.id_3 = 0;
  uwire id_27 = -1'b0 < id_25;
  parameter id_28 = 1 & 1 | 1 - -1;
  nand primCall (
      id_22,
      id_10,
      id_5,
      id_7,
      id_13,
      id_11,
      id_21,
      id_8,
      id_25,
      id_1,
      id_26,
      id_15,
      id_6,
      id_9,
      id_2,
      id_14,
      id_19
  );
  wire [id_20 : id_0] id_29 = 1;
  wire id_30 = id_26[id_16];
endmodule
