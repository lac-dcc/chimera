// Seed: 3023332893
module module_0 (
    input tri0 id_0,
    output wire id_1,
    output supply0 id_2,
    input wand id_3,
    output tri0 id_4,
    output uwire id_5,
    input tri0 id_6,
    input wor id_7,
    input tri id_8,
    input uwire id_9
);
  logic id_11;
  logic id_12, id_13, id_14, id_15, id_16;
  parameter id_17 = 1;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wor  id_1,
    inout  tri  id_2,
    input  tri  id_3,
    output tri1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_1
  );
  assign modCall_1.id_8 = 0;
  localparam id_7 = 1;
endmodule
