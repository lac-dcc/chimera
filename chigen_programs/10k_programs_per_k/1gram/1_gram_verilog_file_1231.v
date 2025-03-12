// Seed: 1611404502
module module_0 #(
    parameter id_1 = 32'd22,
    parameter id_2 = 32'd65
) (
    _id_1,
    _id_2,
    id_3,
    id_4#(
        .id_5 (id_6),
        .id_7 (-1'b0),
        .id_8 (id_9),
        .id_10(id_11),
        .id_12(id_13),
        .id_14(id_15),
        .id_16((1))
    ),
    id_17,
    id_18,
    id_19[id_2 : ~id_1],
    id_20,
    id_21[-1'b0 : 1'd0],
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  assign module_1.id_4 = 0;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire _id_2;
  output wire _id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd69
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  output reg id_4;
  inout wire _id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  initial id_4 = id_3;
  assign id_3 = id_3;
  assign id_3 = id_2;
  wire [-1 : id_3  +  -1] id_5;
  logic id_6 = 1;
  always $clog2(id_3);
  ;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_6,
      id_2,
      id_2,
      id_5,
      id_5,
      id_6,
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_5
  );
  always_latch id_4 = id_2;
endmodule
