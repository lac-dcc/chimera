// Seed: 2824747061
module module_0 (
    output wand  id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    output uwire id_3,
    output tri1  id_4,
    input  wor   id_5,
    output tri0  id_6
);
  assign id_3 = id_5;
endmodule
module module_1 (
    output tri1  id_0,
    output tri1  id_1,
    output tri1  id_2,
    output wire  id_3,
    output uwire id_4,
    input  wor   id_5
);
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_0,
      id_5,
      id_4
  );
  assign modCall_1.id_5 = 0;
  wire [-1 : 1 'h0 !=  1] id_7;
endmodule
