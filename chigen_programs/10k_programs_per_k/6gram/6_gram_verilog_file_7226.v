// Seed: 1604991581
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
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34
);
  input wire id_34;
  input wire id_33;
  input wire id_32;
  input wire id_31;
  output wire id_30;
  input wire id_29;
  input wire id_28;
  input wire id_27;
  inout wire id_26;
  inout wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  output wire id_21;
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  assign module_1.id_6 = 0;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_35, id_36, id_37, id_38;
  wire id_39;
  assign id_36 = id_23;
  always @(*) begin : LABEL_0
    $unsigned(44);
    ;
  end
endmodule
module module_1 #(
    parameter id_17 = 32'd33,
    parameter id_6  = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
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
    _id_17
);
  input wire _id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire _id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_18;
  localparam id_19 = "";
  wire id_20;
  logic [7:0][id_6 : -1  ==  1] id_21;
  wire id_22;
  wire id_23;
  module_0 modCall_1 (
      id_22,
      id_14,
      id_15,
      id_8,
      id_23,
      id_23,
      id_5,
      id_2,
      id_1,
      id_18,
      id_13,
      id_13,
      id_9,
      id_9,
      id_23,
      id_19,
      id_13,
      id_10,
      id_10,
      id_8,
      id_8,
      id_23,
      id_22,
      id_23,
      id_10,
      id_23,
      id_9,
      id_10,
      id_8,
      id_7,
      id_9,
      id_20,
      id_20,
      id_12
  );
  assign id_21[id_17==1] = 1;
endmodule
