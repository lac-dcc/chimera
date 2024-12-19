// Seed: 2317193239
module module_0 (
    input  uwire id_0,
    output wire  id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  tri0  id_4
);
  generate
    if (id_4) begin : LABEL_0
      assign id_1 = id_3 ? 1 : 1;
    end
  endgenerate
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    input  wire  id_2,
    output uwire id_3,
    input  wire  id_4,
    output uwire id_5,
    input  uwire id_6,
    input  uwire id_7,
    output wand  id_8
);
  wand id_10 = 1'b0 - !1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_4
  );
  assign modCall_1.type_0 = 0;
endmodule
