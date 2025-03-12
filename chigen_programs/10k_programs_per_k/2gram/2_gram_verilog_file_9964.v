// Seed: 288723160
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
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_3 ? id_8 : id_7;
endmodule
module module_1 #(
    parameter id_1  = 32'd87,
    parameter id_10 = 32'd12,
    parameter id_18 = 32'd48,
    parameter id_19 = 32'd72,
    parameter id_2  = 32'd59,
    parameter id_24 = 32'd9,
    parameter id_26 = 32'd36,
    parameter id_7  = 32'd10
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  input logic [7:0] id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire _id_10;
  output wire id_9;
  inout wire id_8;
  input wire _id_7;
  output logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire _id_2;
  inout wire _id_1;
  assign {id_7, 1, id_14, id_14[-1 : ""]} = id_1;
  wire id_16;
  wire  [  id_7  :  id_1  ]  id_17  ,  _id_18  ,  _id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  _id_24  ,  id_25  ,  _id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ;
  tri1 [id_7 : -1] id_35;
  struct {
    logic id_36;
    logic [id_24  |  1 : -1] id_37;
    integer [-1 : id_2] id_38;
    logic [-1  -  -1 : -1] id_39;
    logic id_40;
    logic id_41;
  } [1 : id_26] id_42;
  ;
  module_0 modCall_1 (
      id_4,
      id_25,
      id_33,
      id_29,
      id_17,
      id_37,
      id_39,
      id_30,
      id_31,
      id_22,
      id_8,
      id_38,
      id_28,
      id_31,
      id_36,
      id_42,
      id_36
  );
  assign id_6[id_1+id_19] = -1;
  wire [id_18 : id_10  <->  id_24] id_43;
  wire id_44;
  assign id_35 = id_19 - id_18;
  wire id_45;
  assign id_44 = id_8;
  wire id_46;
  ;
endmodule
