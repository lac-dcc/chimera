// Seed: 1482765147
module module_0 (
    input  wire  id_0,
    output wand  id_1,
    input  tri   id_2,
    input  uwire id_3#(.id_5(-1'b0), .id_6(1))
);
  logic id_7;
  assign id_1 = 1;
  assign id_5 = -1;
  assign id_7 = id_2;
  import id_8::*;
  always begin : LABEL_0
    id_6 <= id_8;
  end
endmodule
module module_1 (
    input  tri1 id_0,
    output wor  id_1,
    input  tri  id_2,
    input  wand id_3,
    input  wire id_4,
    input  tri1 id_5,
    output wire id_6
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
