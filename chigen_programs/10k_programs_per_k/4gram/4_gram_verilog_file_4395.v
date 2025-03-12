// Seed: 2574422091
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  localparam id_5 = 1;
  nand primCall (id_1, id_2, id_3);
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
  wire id_3;
endmodule
module module_3 #(
    parameter id_7 = 32'd90
) (
    input  tri   id_0,
    output uwire id_1
    , _id_7,
    input  tri0  id_2,
    input  wand  id_3,
    input  wor   id_4,
    input  tri0  id_5
);
  logic id_8;
  wire [1 : id_7] id_9;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_8
  );
  wire id_10;
endmodule
