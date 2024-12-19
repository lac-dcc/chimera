// Seed: 1111644480
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
  always id_1 = 1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  module_0 modCall_1 (id_5);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_13;
  assign id_1 = id_3[1];
  module_0 modCall_1 (id_1);
  assign modCall_1.id_1 = 0;
endmodule
