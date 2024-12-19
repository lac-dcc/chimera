// Seed: 1197296428
module module_0 (
    output tri1  id_0,
    output tri0  id_1,
    output uwire id_2,
    input  tri   id_3,
    input  tri1  id_4,
    output tri0  id_5,
    input  wor   id_6,
    input  wor   id_7,
    output wor   id_8
);
  timeprecision 1ps;
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    output wire id_0,
    input  tri  id_1,
    output wand id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2 (
    input  wire  id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  uwire id_3,
    output uwire id_4,
    output tri   id_5
);
  assign id_5 = id_3;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_1,
      id_0,
      id_5,
      id_3,
      id_3,
      id_5
  );
  assign modCall_1.type_10 = 0;
endmodule
