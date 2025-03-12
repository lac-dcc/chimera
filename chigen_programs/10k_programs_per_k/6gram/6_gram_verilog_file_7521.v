// Seed: 85066695
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  assign module_1.id_6 = 0;
  output wire id_1;
  timeprecision 1ps;
  wire id_9;
  wire id_10;
endmodule
module module_1 #(
    parameter id_6 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  inout wire _id_6;
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_1,
      id_5
  );
  logic [7:0] id_7;
  assign id_4 = id_7[id_6];
  assign id_3[1] = id_6;
endmodule
