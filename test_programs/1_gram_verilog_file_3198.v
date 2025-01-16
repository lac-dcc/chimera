// Seed: 325178178
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
    id_22
);
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_23, id_24;
  assign id_14 = -1;
  wire id_25 = id_13;
endmodule
module module_1 #(
    parameter id_13 = 32'd39,
    parameter id_17 = 32'd12
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
    id_10#(
        .id_11(id_12[_id_13]),
        .id_14(1),
        .id_15(id_16[_id_17 : 1'b0])
    ),
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  input wire _id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  output wire _id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_25, id_26;
  wand id_27;
  assign id_19 = id_8 - -1 | 1;
  module_0 modCall_1 (
      id_25,
      id_11,
      id_23,
      id_11,
      id_24,
      id_1,
      id_18,
      id_23,
      id_23,
      id_25,
      id_19,
      id_8,
      id_22,
      id_19,
      id_11,
      id_1,
      id_11,
      id_22,
      id_11,
      id_21,
      id_24,
      id_21
  );
  parameter id_28 = 1'd0;
  always id_27 = 1;
endmodule
