// Seed: 790047259
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
    id_23
);
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  localparam id_24 = 1;
  wire  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ;
endmodule
module module_1 #(
    parameter id_14 = 32'd4
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
    id_13
);
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout logic [7:0] id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_8,
      id_5,
      id_2,
      id_13,
      id_11,
      id_13,
      id_11,
      id_8,
      id_5,
      id_11,
      id_2,
      id_8,
      id_8,
      id_13,
      id_2,
      id_8,
      id_8,
      id_2,
      id_13,
      id_2,
      id_13
  );
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire _id_14;
  assign id_11 = id_10[id_14+:1];
  wire id_15;
  wire id_16;
endmodule
