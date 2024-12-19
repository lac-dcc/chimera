// Seed: 173966302
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
    id_12
);
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_13 = id_9 - 1;
  assign id_9 = id_11;
  assign id_5 = 1;
  wire id_14;
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
    id_10,
    id_11#(.id_12(1'h0)),
    id_13,
    id_14,
    id_15
);
  input wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always id_5 <= 1;
  assign id_13 = id_5;
  wire id_16;
  assign id_13 = id_3;
  wire id_17;
  wire id_18;
  module_0 modCall_1 (
      id_16,
      id_17,
      id_18,
      id_2,
      id_2,
      id_17,
      id_18,
      id_11,
      id_2,
      id_18,
      id_2,
      id_16
  );
endmodule
