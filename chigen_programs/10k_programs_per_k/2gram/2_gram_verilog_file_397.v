// Seed: 1663641723
module module_0 (
    output uwire id_0,
    output tri0  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    output tri0  id_5,
    output tri   id_6,
    output wire  id_7,
    input  wire  id_8,
    output tri0  id_9,
    output uwire id_10,
    input  wire  id_11,
    input  uwire id_12
);
  parameter id_14 = 1;
endmodule
module module_1 (
    input  tri   id_0,
    output tri   id_1,
    output uwire id_2
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
  assign id_2 = id_0;
endmodule
