// Seed: 3682545626
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
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11;
  assign id_6 = 1;
  timeunit 1ps / 1ps;
  wire id_12;
  assign id_5 = id_2;
  wire id_13;
endmodule
module module_1 #(
    parameter id_27 = 32'd35,
    parameter id_28 = 32'd77
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
  inout wire id_26;
  input wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_26 = 1'd0;
  assign id_14 = id_5;
  defparam id_27.id_28 = 1;
  wire id_29;
  wire id_30 = ~id_25;
  module_0(
      id_15, id_16, id_20, id_17, id_22, id_7, id_17, id_2, id_11, id_17
  );
  wire id_31;
  wire id_32;
  nor (
      id_17,
      id_27,
      id_6,
      id_9,
      id_20,
      id_4,
      id_2,
      id_29,
      id_11,
      id_5,
      id_19,
      id_10,
      id_26,
      id_28,
      id_7,
      id_23,
      id_8,
      id_13,
      id_3,
      id_12,
      id_15,
      id_30
  );
endmodule
