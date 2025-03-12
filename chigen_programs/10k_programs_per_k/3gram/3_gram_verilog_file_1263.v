// Seed: 1654326435
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
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_16;
  always release id_11;
endmodule
module module_1 #(
    parameter id_13 = 32'd24,
    parameter id_7  = 32'd15,
    parameter id_9  = 32'd70
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout logic [7:0] id_17;
  inout wire id_16;
  output wire id_15;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_4,
      id_8,
      id_3,
      id_8,
      id_4,
      id_3,
      id_2,
      id_16,
      id_11,
      id_16,
      id_8,
      id_10,
      id_12
  );
  output wire id_14;
  output wire _id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire _id_9;
  inout wire id_8;
  inout wire _id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic [id_13 : id_7] id_18;
  ;
  assign id_5 = id_17[-1 : id_9];
endmodule
