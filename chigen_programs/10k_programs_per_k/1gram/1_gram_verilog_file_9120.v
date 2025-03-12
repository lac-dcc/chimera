// Seed: 1637452692
module module_0 (
    input  tri0  id_0,
    input  tri   id_1,
    output tri   id_2,
    output uwire id_3
);
  wire id_5;
endmodule
module module_1 #(
    parameter id_13 = 32'd88,
    parameter id_14 = 32'd84,
    parameter id_15 = 32'd3,
    parameter id_6  = 32'd51,
    parameter id_9  = 32'd54
) (
    output tri id_0,
    input wire id_1,
    input uwire id_2,
    input wand id_3,
    output wire id_4[-1 : id_13  ?  1 : id_13],
    input tri id_5[id_15 : ~  id_14],
    input tri1 _id_6,
    input tri0 id_7,
    input wire id_8,
    input tri _id_9,
    output tri0 id_10,
    input tri id_11,
    input uwire id_12,
    input tri1 _id_13,
    input wor _id_14,
    input wor _id_15,
    output tri void id_16
);
  wire id_18, id_19, id_20;
  always_ff
  `define pp_21 0
  nand primCall (
      id_16,
      id_8,
      id_11,
      id_1,
      id_5,
      id_2,
      id_20,
      id_18,
      id_23,
      id_24,
      id_22,
      id_19,
      id_12,
      id_3,
      id_7,
      id_25
  );
  wire id_22;
  wire id_23, id_24, id_25;
  wire [id_9 : id_6] id_26;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_16
  );
endmodule
