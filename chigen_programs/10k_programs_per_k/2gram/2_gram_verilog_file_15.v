// Seed: 2921808842
module module_0 #(
    parameter id_29 = 32'd98
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
    id_13#(
        .id_14(id_15),
        .id_16(1),
        .id_17(-1),
        .id_18(1),
        .id_19(1),
        .id_20(-1),
        .id_21(1),
        .id_22(-1),
        .id_23(-1)
    ),
    id_24,
    id_25,
    id_26,
    id_27,
    id_28
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [-1 : 1] _id_29;
  ;
  wire [-1  +  id_29 : 1 'h0] id_30 = id_28;
endmodule
module module_1 #(
    parameter id_11 = 32'd33
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
    id_12
);
  inout wire id_12;
  inout wire _id_11;
  output wire id_10;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_10,
      id_7,
      id_7,
      id_2,
      id_12,
      id_6,
      id_12,
      id_12,
      id_12,
      id_8,
      id_6,
      id_4,
      id_4,
      id_9,
      id_12,
      id_7
  );
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  import id_13::*;
  assign id_4 = id_4;
  wire [id_11 : (  1 'b0 )] id_14;
  localparam id_15 = 1;
  logic id_16;
  assign id_7 = id_13;
endmodule
