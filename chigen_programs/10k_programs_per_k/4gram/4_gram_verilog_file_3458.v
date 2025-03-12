// Seed: 2036226959
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  initial assume (id_1[1]);
  wire id_6;
  timeprecision 1ps;
endmodule
module module_1 #(
    parameter id_1 = 32'd33
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output logic [7:0] id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_4,
      id_3,
      id_2
  );
  inout logic [7:0] id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire _id_1;
  assign id_7[id_1] = 1;
  assign id_1 = id_5[-1];
endmodule
