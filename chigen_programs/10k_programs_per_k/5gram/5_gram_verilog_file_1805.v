// Seed: 1473083467
module module_0 (
    output tri0  id_0,
    input  tri   id_1,
    input  wor   id_2,
    input  tri   id_3,
    input  tri   id_4,
    input  uwire id_5,
    output tri1  id_6
);
  module_2 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_1 (
    output wor   id_0,
    output wor   id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  tri0  id_4,
    output wor   id_5
);
  assign id_0 = -1'd0;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_2,
      id_3,
      id_2,
      id_3,
      id_5
  );
  assign modCall_1.id_2 = 0;
  wire [-1 : -1] id_7;
endmodule
module module_0 (
    output wand id_0,
    input wand id_1,
    input supply0 id_2,
    input wand module_2
);
  parameter id_5 = 1 == 1;
  assign id_0 = id_3;
endmodule
