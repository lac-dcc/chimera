// Seed: 2218152216
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
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_7 = -1;
  timeprecision 1ps;
endmodule
module module_1 #(
    parameter id_2 = 32'd96
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_8,
      id_1,
      id_7,
      id_1
  );
  inout logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire _id_2;
  inout wire id_1;
  assign id_6[id_2] = id_8;
endmodule
