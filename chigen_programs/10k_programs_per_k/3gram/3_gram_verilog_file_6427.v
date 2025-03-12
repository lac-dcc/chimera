// Seed: 453223391
module module_0 (
    input wand  id_0,
    input uwire id_1
);
  wire [1 : -1] id_3;
endmodule
module module_1 (
    output wor  id_0,
    input  tri  id_1,
    output tri0 id_2,
    input  tri1 id_3,
    output tri0 id_4,
    input  tri  id_5,
    input  wand id_6,
    output tri  id_7,
    input  tri  id_8,
    output wire id_9
);
  parameter id_11 = 1;
  wire id_12 = id_6;
  module_0 modCall_1 (
      id_5,
      id_3
  );
  assign modCall_1.id_1 = 0;
  generate
    assign id_12 = ~id_1;
  endgenerate
endmodule
