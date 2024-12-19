// Seed: 3196589436
module module_0 (
    output tri1  id_0,
    output wor   id_1,
    input  wor   id_2,
    output tri1  id_3,
    output wand  id_4,
    output uwire id_5
);
endmodule
module module_1 (
    input  wire id_0,
    output wor  id_1,
    input  tri1 id_2,
    output tri1 id_3,
    output tri  id_4
);
  always begin : LABEL_0
    @(negedge 1'b0);
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.type_10 = 0;
  always_comb id_3 = 1;
  tri0 id_6;
  assign id_6 = 1;
  wire id_7, id_8, id_9;
  assign id_8 = id_9;
endmodule
