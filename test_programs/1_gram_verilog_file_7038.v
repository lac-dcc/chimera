// Seed: 1811007091
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = -1'b0;
  assign {-1, ~1, id_1, !id_4} = id_1;
  assign id_2 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_8,
      id_9,
      id_9
  );
  assign modCall_1.id_1 = 0;
  assign id_8 = 1;
  wire id_11, id_12;
  parameter id_13 = id_10;
  genvar id_14;
endmodule
