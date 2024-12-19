// Seed: 1462302123
module module_0;
  always_comb begin : LABEL_0
    for (id_1 = 1; 1; id_1 = ~1'd0) id_1 <= 1;
  end
endmodule
module module_1 (
    input tri   id_0,
    input uwire id_1,
    input wor   id_2
);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    input tri id_1,
    input uwire id_2,
    input supply0 id_3,
    output supply1 id_4,
    output tri id_5,
    output wand id_6
);
  assign id_4 = id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
