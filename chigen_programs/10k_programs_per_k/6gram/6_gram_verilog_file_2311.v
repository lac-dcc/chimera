// Seed: 3668003971
module module_0 #(
    parameter id_12 = 32'd14,
    parameter id_16 = 32'd13,
    parameter id_30 = 32'd79,
    parameter id_34 = 32'd77,
    parameter id_37 = 32'd62
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
    _id_12,
    id_13,
    id_14,
    id_15,
    _id_16,
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
    _id_30,
    id_31
);
  input wire id_31;
  inout wire _id_30;
  input wire id_29;
  inout wire id_28;
  inout wire id_27;
  input wire id_26;
  input wire id_25;
  inout wire id_24;
  inout wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire _id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire _id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  integer id_32;
  ;
  localparam id_33 = -1;
  wire _id_34, id_35, id_36;
  wire [id_12 : id_34  &  1  -  id_30] _id_37;
  wire id_38;
  logic id_39 = id_22;
  wire [-1 : id_30] id_40;
  logic [-1 'b0 : -1] id_41, id_42;
  logic id_43;
  wire id_44;
  logic [id_16  ==  id_37 : 1] id_45;
  ;
  assign id_6[1] = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd67,
    parameter id_2  = 32'd74,
    parameter id_4  = 32'd35
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire _id_4;
  inout wire id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  parameter id_11 = {1, 1'd0 ~^ 1, 1, 1};
  logic [-1  >=  id_4 : id_4] id_12;
  assign id_1[id_2] = 1;
  module_0 modCall_1 (
      id_7,
      id_12,
      id_5,
      id_7,
      id_5,
      id_1,
      id_7,
      id_5,
      id_12,
      id_12,
      id_3,
      id_11,
      id_12,
      id_10,
      id_5,
      id_11,
      id_3,
      id_12,
      id_3,
      id_7,
      id_7,
      id_6,
      id_12,
      id_3,
      id_9,
      id_9,
      id_5,
      id_3,
      id_12,
      id_11,
      id_9
  );
  defparam id_11.id_11 = 1, id_11.id_11 = 1, id_11.id_11 = 1, id_11.id_11 = id_11,
      id_11.id_11 = 1'b0 == id_11, id_11.id_11 = 1;
endmodule
