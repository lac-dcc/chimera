// Seed: 3537000358
module module_0 (
    input  uwire id_0,
    output uwire id_1
);
  generate
    if (1'h0)
      if (1 == 1) wor id_3;
      else begin : LABEL_0
        assign id_3 = id_0;
      end
    else assign id_3 = id_0;
  endgenerate
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    output wand id_2
);
  assign id_2 = id_1;
  supply1 id_4;
  assign id_4 = id_1;
  wire id_5;
  always @(*) $display;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  assign id_4 = id_1 == "";
endmodule
