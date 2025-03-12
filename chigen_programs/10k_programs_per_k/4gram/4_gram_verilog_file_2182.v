// Seed: 1451829787
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input logic [7:0] id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_10;
  assign id_9 = id_8[1 :-1];
endmodule
module module_1 #(
    parameter id_7 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  inout logic [7:0] id_9;
  output wire id_8;
  input wire _id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_9[id_7] = id_1[-1];
  logic id_10 = id_4;
  wire  id_11;
  ;
  wire id_12;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_10,
      id_12,
      id_12,
      id_10,
      id_11,
      id_1,
      id_11
  );
endmodule
