// Seed: 3731064532
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    output tri0  id_2,
    output wire  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    input  tri1  id_6,
    input  tri0  id_7,
    input  uwire id_8,
    output wor   id_9,
    output uwire id_10
);
  logic id_12;
  ;
  module_2 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_10
  );
  assign modCall_1.id_0 = 0;
  assign module_1.id_0  = 0;
endmodule
module module_1 (
    input  tri1 id_0,
    output wire id_1,
    output wor  id_2
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_1
  );
endmodule
module module_2 (
    input  tri  id_0,
    input  wire id_1,
    input  tri0 id_2,
    output tri0 id_3
);
  logic id_5;
  ;
endmodule
