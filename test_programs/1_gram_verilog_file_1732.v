// Seed: 2779960137
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_6;
  uwire id_7, id_8 = id_8, id_9;
  parameter id_10 = id_7;
  wire id_11, id_12, id_13, id_14, id_15, id_16;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_15,
      id_5,
      id_10,
      id_10
  );
  nand primCall (id_3, id_10, id_7, id_16, id_14, id_6, id_8, id_12, id_11, id_13, id_15, id_9);
endmodule
