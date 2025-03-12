// Seed: 1951572998
module module_0 #(
    parameter id_4 = 32'd28,
    parameter id_5 = 32'd75,
    parameter id_6 = 32'd7,
    parameter id_8 = 32'd74
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    _id_6,
    id_7,
    _id_8
);
  input wire _id_8;
  inout logic [7:0] id_7;
  inout wire _id_6;
  inout wire _id_5;
  inout wire _id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  assign id_7[id_5] = id_2;
  assign id_7 = id_8;
  wire [id_4 : id_6] id_9 = id_3[id_4];
  assign id_9 = id_7;
endmodule
module module_1 #(
    parameter id_1  = 32'd56,
    parameter id_14 = 32'd2,
    parameter id_20 = 32'd94,
    parameter id_4  = 32'd97
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  inout wand id_6;
  input wire id_5;
  input wire _id_4;
  inout wire id_3;
  input wire id_2;
  inout wire _id_1;
  assign id_6 = id_5 ? 1 : -1;
  logic [7:0][-1 : 1]
      id_7, id_8, id_9, id_10, id_11, id_12, id_13, _id_14, id_15, id_16, id_17, id_18;
  wire [-1  == "" : id_1  &  1 'b0] id_19;
  parameter id_20 = 1;
  parameter id_21 = id_20;
  logic id_22[1 : id_20];
  module_0 modCall_1 (
      id_3,
      id_6,
      id_15,
      id_20,
      id_20,
      id_20,
      id_7,
      id_20
  );
  assign id_12[1] = id_8 == id_22;
endmodule
