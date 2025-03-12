// Seed: 781766237
module module_0 #(
    parameter id_9 = 32'd23
) (
    input  tri1 id_0,
    input  tri0 id_1,
    output wand id_2,
    output tri  id_3,
    input  tri  id_4
);
  tri id_6;
  assign id_6 = -1;
  wire  id_7;
  logic id_8 = -1;
  parameter id_9 = 1;
  wire [id_9 : 1] id_10;
endmodule
macromodule module_1 (
    output uwire id_0,
    output uwire id_1,
    input  wire  id_2,
    output wor   id_3,
    input  tri   id_4,
    input  tri1  id_5#(.id_10(1 * 1), .id_11(1), .id_12(1'h0)),
    input  uwire id_6,
    input  wand  id_7,
    input  wire  id_8
);
  assign id_11 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_1,
      id_5
  );
  localparam id_13 = 1;
  wire [1 : -1] id_14;
  nand primCall (id_1, id_12, id_8, id_11, id_4, id_6, id_2, id_10, id_7);
endmodule
