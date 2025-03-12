// Seed: 2518179953
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5[-1 :-1],
    id_6,
    id_7
);
  inout logic [7:0] id_7;
  input wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_8 = 1;
  localparam id_9 = id_8 & 1;
  wire  id_10;
  logic id_11;
endmodule
module module_1 #(
    parameter id_5 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14[(id_5) :-1]
);
  output logic [7:0] id_14;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_8,
      id_2,
      id_14,
      id_13,
      id_9
  );
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire _id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = id_9[-1];
endmodule
