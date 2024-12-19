// Seed: 3218589264
module module_0 (
    output supply0 id_0,
    input  supply1 id_1
);
  assign id_0 = 1;
endmodule
module module_1 (
    output tri id_0,
    output supply1 id_1,
    input supply0 id_2,
    input uwire id_3,
    input uwire id_4,
    input wand id_5,
    output supply0 id_6,
    output wire id_7,
    output tri id_8,
    output supply0 module_1
);
  always_comb @(1) begin : LABEL_0
    if (1'b0) assign id_0 = 1 - 1;
  end
  wire id_11;
  module_0 modCall_1 (
      id_6,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_12 = id_11;
endmodule
