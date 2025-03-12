// Seed: 3449988084
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
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd50
) (
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
    _id_11,
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  input wire _id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_8,
      id_8,
      id_10,
      id_4,
      id_4,
      id_9
  );
  inout wire id_1;
  assign id_5[(id_11)] = id_13;
endmodule
