// Seed: 2880834219
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
    id_17
);
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_18;
endmodule
module module_1 #(
    parameter id_25 = 32'd75
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
    _id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32
);
  input logic [7:0] id_32;
  inout wire id_31;
  output wire id_30;
  output wire id_29;
  output wire id_28;
  inout wire id_27;
  input wire id_26;
  inout wire _id_25;
  output wire id_24;
  input wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  module_0 modCall_1 (
      id_6,
      id_18,
      id_5,
      id_16,
      id_2,
      id_1,
      id_27,
      id_22,
      id_4,
      id_1,
      id_27,
      id_22,
      id_4,
      id_29,
      id_17,
      id_9,
      id_24
  );
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  and primCall (
      id_24,
      id_15,
      id_22,
      id_27,
      id_31,
      id_26,
      id_20,
      id_6,
      id_4,
      id_5,
      id_21,
      id_2,
      id_18,
      id_16,
      id_23,
      id_9,
      id_1
  );
  input wire id_6;
  inout tri id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5 = id_25 == id_32[id_25];
endmodule
