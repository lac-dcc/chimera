// Seed: 3594382486
module module_0 (
    id_1,
    id_2
);
  output tri id_2;
  input wire id_1;
  logic id_3 = 1;
  parameter id_4 = ~1'b0;
  wire id_5;
  ;
  logic id_6;
  logic id_7;
  parameter integer id_8 = -1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd23,
    parameter id_13 = 32'd87,
    parameter id_2  = 32'd31,
    parameter id_3  = 32'd32,
    parameter id_9  = 32'd22
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    id_12,
    _id_13,
    id_14
);
  inout wire id_14;
  inout wire _id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire _id_10;
  input wire _id_9;
  inout wire id_8;
  module_0 modCall_1 (
      id_14,
      id_11
  );
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire _id_3;
  output wire _id_2;
  output wire id_1;
  logic id_15;
  ;
  union packed {
    logic [id_13 : -1 'b0] id_16;
    logic ["" : -1] id_17;
  } [id_3 : id_10] id_18;
  logic id_19 = id_18.id_16;
  assign id_15 = -1;
  parameter id_20 = !1;
  wire id_21;
  wire id_22;
  wire id_23, id_24;
  logic [7:0][-1 : -1 'd0] \id_25 ;
  assign \id_25 [id_9] = 1;
  parameter id_26 = -1;
  logic [id_2 : -1] id_27;
  ;
endmodule
