// Seed: 974236585
module module_0;
  generate
    logic id_1;
    for (id_2 = id_1; id_1++; id_1 = id_1 <= -1) begin : LABEL_0
      logic id_3;
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_1 = 32'd58
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  module_0 modCall_1 ();
  input wire _id_1;
  assign id_2[id_1] = -1;
endmodule
module module_2 #(
    parameter id_4 = 32'd26
) (
    output tri   id_0,
    output wand  id_1,
    input  uwire id_2,
    input  uwire id_3,
    output wor   _id_4,
    output wor   id_5,
    output wire  id_6,
    input  wor   id_7
);
  assign id_4 = id_3;
  assign id_0 = id_3;
  module_0 modCall_1 ();
  logic id_9;
  ;
  logic [id_4 : 1  &&  1] id_10;
endmodule
