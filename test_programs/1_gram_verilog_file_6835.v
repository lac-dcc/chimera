// Seed: 4212954801
module module_0 (
    input  uwire id_0,
    input  tri   id_1,
    output wire  id_2,
    input  uwire id_3,
    input  wire  id_4,
    output uwire id_5,
    input  uwire id_6,
    output uwire id_7
);
  rtran (1, -1'd0);
  module_2 modCall_1 (
      id_2,
      id_5
  );
  assign modCall_1.id_3 = 0;
  integer id_9;
  wire id_10;
endmodule
module module_1 (
    input  tri   id_0,
    input  wand  id_1,
    output tri1  id_2,
    output logic id_3,
    input  wand  id_4
);
  always id_3 <= 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_4,
      id_0,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.type_12 = 0;
endmodule
module module_2 (
    output supply0 id_0,
    output tri id_1
);
  assign id_1 = id_3 << -1;
  localparam id_4 = id_4;
endmodule
