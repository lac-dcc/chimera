// Seed: 280322
module module_0 (
    output tri   id_0,
    input  wand  id_1,
    output uwire id_2,
    output wor   id_3,
    output tri1  id_4,
    output tri0  id_5,
    input  tri   id_6
);
  assign id_4 = id_1;
  parameter id_8 = -1;
endmodule
module module_1 (
    output wire id_0,
    output wand id_1,
    output supply0 id_2,
    output wire id_3,
    input uwire id_4,
    input uwire id_5
);
  wire id_7;
  wire [1 : -1] id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3,
      id_0,
      id_3,
      id_1,
      id_5
  );
  assign modCall_1.id_3 = 0;
  wire [-1 'h0 : -1] id_9;
  bit id_10;
  integer id_11, id_12;
  always @(negedge 1) id_10 = (1 + (id_7) == !id_11);
endmodule
