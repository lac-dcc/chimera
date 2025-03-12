// Seed: 4108960566
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
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_8 = 1;
  wire id_9;
  wire id_10;
  ;
  wire  id_11;
  logic id_12;
  ;
  wire id_13;
  localparam id_14 = id_8;
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
  inout wire id_10;
  output wire id_9;
  inout uwire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_10,
      id_9,
      id_5,
      id_6,
      id_10
  );
  output wire id_1;
  logic id_11 = 1 << -1;
  assign id_6 = id_8;
  assign id_8 = 1 == id_3 ? id_5 : 1 ^ id_11;
endmodule
