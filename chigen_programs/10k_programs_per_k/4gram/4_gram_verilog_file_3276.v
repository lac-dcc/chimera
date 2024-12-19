// Seed: 3334076841
module module_0 (
    output tri0  id_0,
    input  wand  id_1,
    input  tri   id_2,
    input  wand  id_3,
    output tri1  id_4
    , id_10,
    output wand  id_5,
    output tri0  id_6,
    input  wire  id_7,
    input  uwire id_8
);
  assign id_4 = id_7#(.id_3(1));
  wire id_11;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    input  tri1  id_2,
    output tri0  id_3,
    input  uwire id_4,
    input  tri   id_5
    , id_10,
    input  wand  id_6,
    output wire  id_7,
    output uwire id_8
);
  xor primCall (id_0, id_10, id_4, id_1, id_5, id_6, id_11);
  uwire id_11;
  initial begin : LABEL_0
    if (id_10) begin : LABEL_0
      id_0 = id_2;
    end
  end
  assign id_10 = 1;
  assign id_0  = 1'b0 << 1'd0;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_6,
      id_8,
      id_8,
      id_7,
      id_5,
      id_2
  );
  assign modCall_1.type_13 = 0;
  assign id_3 = 1;
  assign id_3 = 1'h0 == id_1;
  assign id_11 = 1;
  integer id_12;
  final $display(id_2);
  wire id_13 = id_12;
  wire id_14;
  assign id_0 = 1 | 1;
  assign id_8 = |1;
endmodule
