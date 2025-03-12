// Seed: 2583332538
module module_0 (
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
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  output logic [7:0] id_1;
  logic id_5;
  logic id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_2,
      id_5,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6,
      id_5
  );
  assign id_1[-1] = id_5 <= 1;
  assign id_5 = id_3[id_4];
endmodule
