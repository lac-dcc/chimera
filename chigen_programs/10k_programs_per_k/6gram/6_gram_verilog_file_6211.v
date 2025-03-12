// Seed: 4204654361
module module_0 (
    output tri   id_0,
    output uwire id_1,
    output uwire id_2,
    output wire  id_3
);
  assign id_3 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    output uwire id_1,
    input  tri0  id_2,
    input  tri   id_3,
    output wire  id_4,
    input  tri   id_5,
    input  wire  id_6,
    input  uwire id_7,
    output tri0  id_8
);
  assign id_8 = -1;
  assign id_1 = 1;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_8,
      id_4,
      id_8
  );
  assign modCall_1.id_0 = 0;
  assign id_8 = id_10 == -1 ? 1'b0 : 1 ? id_6 : -1;
endmodule
