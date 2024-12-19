// Seed: 2669737456
module module_0 #(
    parameter id_28 = 32'd71
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
  input wire id_26;
  inout wire id_25;
  inout wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_27;
  defparam id_28 = 1'h0;
  assign id_8 = 1;
  integer id_29 (
      1,
      id_13,
      1
  );
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
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_14;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_6,
      id_13,
      id_8,
      id_8,
      id_6,
      id_14,
      id_4,
      id_3,
      id_13,
      id_3,
      id_4,
      id_14,
      id_1,
      id_4,
      id_6,
      id_14,
      id_14,
      id_10,
      id_1,
      id_13,
      id_6,
      id_6,
      id_4,
      id_4
  );
  if (id_5) wire id_15, id_16;
  assign id_6 = 1'b0;
  nor primCall (id_12, id_4, id_13, id_14, id_5, id_7, id_9, id_6, id_1, id_11, id_10, id_2);
endmodule
