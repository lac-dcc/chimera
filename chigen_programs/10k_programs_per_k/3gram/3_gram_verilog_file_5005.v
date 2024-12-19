// Seed: 3794943133
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input  wire id_2,
    input  tri0 id_3,
    output tri  id_4
);
  wire id_6;
  always_latch @(id_2);
  wire id_7;
  module_2 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_0,
      id_3
  );
endmodule
module module_1 (
    output wire id_0,
    input  wire id_1,
    output wire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input  tri0  id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    output uwire id_3,
    input  wire  id_4
);
  id_6(
      .id_0(1 !== id_4 == 'd0), .id_1(id_4)
  );
  assign module_0.type_1 = 0;
endmodule
