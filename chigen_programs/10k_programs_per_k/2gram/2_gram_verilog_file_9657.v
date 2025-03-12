// Seed: 2763601957
module module_0 #(
    parameter id_10 = 32'd96,
    parameter id_14 = 32'd9,
    parameter id_8  = 32'd91
) (
    output wor   id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  wor   id_3#(._id_8(-1'h0), .id_9(1), ._id_10(1)),
    output tri0  id_4,
    input  uwire id_5,
    output tri   id_6
);
  wire id_11;
  logic [7:0][id_8 : id_10  -  1] id_12, id_13, _id_14, id_15, id_16, id_17, id_18, id_19;
  localparam integer id_20 = 1, id_21 = id_16[id_14], id_22 = id_18[-1];
  assign module_1.id_6 = 0;
  parameter id_23 = id_21;
endmodule
module module_1 #(
    parameter id_12 = 32'd13
) (
    input uwire id_0,
    input wire id_1,
    output wor id_2,
    input supply1 id_3,
    input supply1 id_4,
    output tri0 id_5,
    output supply0 id_6,
    input wor id_7,
    output supply0 id_8,
    input wand id_9,
    output wire id_10,
    input tri0 id_11,
    input supply1 _id_12,
    output tri id_13,
    output wire id_14
);
  wire [id_12 : -1] id_16;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_4,
      id_2,
      id_4,
      id_2
  );
endmodule
