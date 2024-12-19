// Seed: 1508876224
module module_0 (
    input  wor   id_0,
    output wor   id_1,
    output uwire id_2,
    output tri1  id_3,
    input  tri1  id_4
);
  wire id_6;
  assign module_2.id_1 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri   id_1,
    input  wire  id_2,
    input  uwire id_3,
    input  wire  id_4,
    inout  uwire id_5,
    input  uwire id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_1,
      id_5
  );
  assign id_5 = id_2;
endmodule
module module_2 (
    input supply1 id_0,
    output wire id_1
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_0
  );
endmodule
