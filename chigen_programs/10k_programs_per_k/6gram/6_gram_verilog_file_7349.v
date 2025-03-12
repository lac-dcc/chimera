// Seed: 3496250926
module module_0 #(
    parameter id_2 = 32'd26
) (
    output uwire id_0,
    input  uwire id_1,
    output tri   _id_2
);
  assign id_0 = -1'b0;
  logic [1 'b0 : id_2] id_4;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd44,
    parameter id_4  = 32'd10,
    parameter id_6  = 32'd51
) (
    input  uwire id_0,
    output tri   id_1,
    output uwire id_2,
    input  tri   id_3,
    input  tri1  _id_4,
    input  wor   id_5,
    input  wire  _id_6,
    output wire  id_7,
    input  wire  id_8,
    output tri1  id_9
);
  assign id_2 = -1 & 1;
  assign id_7 = id_4;
  genvar id_11, id_12;
  localparam [-1 : -1] id_13 = -1;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_13
  );
  assign modCall_1.id_2 = 0;
  logic id_14;
  ;
  assign id_11 = id_11;
  assign id_1  = 1;
  struct packed {logic ["" : id_6] id_15;} [id_4 : id_13] id_16;
  logic id_17;
  assign id_11 = id_4 ? id_16 : -1 ? id_13 : id_16.id_15;
endmodule
