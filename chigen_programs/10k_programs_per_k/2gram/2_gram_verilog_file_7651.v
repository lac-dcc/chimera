// Seed: 1539732946
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  output wire id_26;
  input wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout logic [7:0] id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output supply1 id_4;
  assign module_1.id_9 = 0;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = id_20 * -1;
  assign id_9[-1] = id_13;
  parameter id_27 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout logic [7:0] id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_7,
      id_3,
      id_7,
      id_1,
      id_7,
      id_1,
      id_8,
      id_7,
      id_5,
      id_3,
      id_6,
      id_1,
      id_3,
      id_7,
      id_3,
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_3,
      id_6,
      id_3,
      id_5
  );
  inout wire _id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_9 = id_1 || id_5 - id_8[id_4];
endmodule
