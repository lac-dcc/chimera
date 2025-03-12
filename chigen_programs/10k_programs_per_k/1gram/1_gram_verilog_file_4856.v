// Seed: 4050580055
module module_0 #(
    parameter id_12 = 32'd60,
    parameter id_3  = 32'd94,
    parameter id_4  = 32'd3,
    parameter id_5  = 32'd6
) (
    id_1,
    id_2,
    _id_3[id_12 : id_5!=id_3],
    _id_4,
    _id_5,
    id_6,
    id_7#(
        .id_8  ((id_9)),
        .id_10 (id_11),
        ._id_12(& -1'h0),
        .id_13 (-1)
    ),
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire _id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire _id_5;
  output wire _id_4;
  input logic [7:0] _id_3;
  input wire id_2;
  input wire id_1;
  wire id_19, id_20, id_21[-1 : id_4], id_22;
  assign id_16 = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd37,
    parameter id_2  = 32'd26,
    parameter id_3  = 32'd78,
    parameter id_8  = 32'd60
) (
    id_1,
    _id_2,
    _id_3,
    id_4
);
  inout supply1 id_4;
  input wire _id_3;
  input wire _id_2;
  output wire id_1;
  wire id_5, id_6, id_7, _id_8;
  uwire [id_8  -  id_2 : id_3] id_9, id_10;
  parameter [id_2 : -1] id_11 = 1;
  assign id_9 = -1;
  assign id_4 = id_7;
  wire [id_11 : 1] id_12;
  module_0 modCall_1 (
      id_12,
      id_10,
      id_11,
      id_11,
      id_11,
      id_12,
      id_6,
      id_10,
      id_12,
      id_4,
      id_9,
      id_11
  );
  assign id_4 = 1;
  or primCall (id_1, id_5, id_9, id_7, id_4, id_12, id_10, id_11, id_6);
  assign id_8 = id_9;
endmodule
