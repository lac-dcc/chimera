// Seed: 67986132
module module_0 (
    input  tri1  id_0,
    input  tri1  id_1,
    output wor   id_2,
    input  uwire id_3,
    input  tri1  id_4,
    output tri   id_5
);
  assign id_5 = id_1;
endmodule
module module_1 #(
    parameter id_7 = 32'd25
) (
    input  tri0 id_0,
    output wire id_1,
    input  wand id_2,
    input  wire id_3,
    input  tri0 id_4,
    output wand id_5
);
  assign id_5 = id_3;
  localparam id_7 = -1;
  for (id_8 = 1; id_4; id_1 += -1) begin : LABEL_0
    defparam id_7.id_7 = -1'h0;
    assign id_5 = id_7;
    assign id_5 = -1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
