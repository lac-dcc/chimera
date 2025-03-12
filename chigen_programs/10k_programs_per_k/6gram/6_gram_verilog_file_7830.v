// Seed: 663968182
module module_0 #(
    parameter id_11 = 32'd7,
    parameter id_12 = 32'd45,
    parameter id_20 = 32'd56,
    parameter id_23 = 32'd79,
    parameter id_32 = 32'd18
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
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    _id_20,
    id_21,
    id_22,
    _id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    _id_32,
    id_33,
    id_34,
    id_35,
    id_36
);
  input wire id_36;
  inout wire id_35;
  output wire id_34;
  output wire id_33;
  output wire _id_32;
  input wire id_31;
  input wire id_30;
  inout wire id_29;
  input wire id_28;
  inout wire id_27;
  output wire id_26;
  inout wire id_25;
  inout wire id_24;
  output wire _id_23;
  input wire id_22;
  output wire id_21;
  output wire _id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire _id_12;
  output wire _id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_37;
  struct {
    logic [-1  -  id_11 : id_23] id_38;
    logic [-1 : 'b0] id_39;
  } [id_12 : id_32  #  (  1  ,  id_20  ,  id_11  )] id_40 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd17
) (
    output wire  id_0,
    output uwire id_1
);
  localparam id_3 = 1;
  wire [id_3 : 1] id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_32 = 0;
  always @(posedge id_3) release id_0;
endmodule
