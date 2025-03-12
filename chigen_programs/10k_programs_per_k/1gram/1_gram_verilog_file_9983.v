// Seed: 3337414754
module module_0 (
    input  supply1 id_0,
    output supply1 id_1
);
  localparam id_3 = 1;
  assign id_1 = id_0 < (id_3);
  logic id_4;
  ;
  genvar id_5, id_6;
endmodule
module module_1 #(
    parameter id_4 = 32'd8,
    parameter id_5 = 32'd22
) (
    input  wire  id_0,
    output uwire id_1,
    output wire  id_2,
    input  wire  id_3,
    input  wand  _id_4,
    input  uwire _id_5,
    input  tri1  id_6,
    output wor   id_7,
    input  wor   id_8,
    input  wand  id_9
);
  wire [id_5 : id_4] id_11;
  nand primCall (id_7, id_13, id_12, id_6, id_8, id_3, id_9, id_0, id_11);
  logic id_12;
  wire  id_13 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_7
  );
endmodule
