// Seed: 3615044081
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  timeprecision 1ps;
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
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_6
  );
  output wire id_5;
  output wire id_4;
  inout reg id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  logic id_7;
  always id_3 <= #id_2 id_6;
endmodule
