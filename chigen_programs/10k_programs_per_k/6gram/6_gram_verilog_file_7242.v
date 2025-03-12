// Seed: 1901848474
module module_0 #(
    parameter id_2 = 32'd16
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output logic [7:0] id_6;
  input logic [7:0] id_5;
  inout wire id_4;
  inout wire id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  parameter id_7 = 1;
  assign id_1[1]  = id_5[id_2];
  assign id_6[-1] = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd48,
    parameter id_5  = 32'd11
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire _id_10;
  input wire id_9;
  input logic [7:0] id_8;
  input wire id_7;
  output logic [7:0] id_6;
  inout wire _id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_10 = id_10;
  xor primCall (id_13, id_9, id_8, id_7, id_12, id_4, id_10, id_1);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_13,
      id_13,
      id_8,
      id_6
  );
  wire id_15;
  assign id_6[-1] = id_7 && -1 == id_1 && id_13 && ~id_13 ? ~id_8[id_5] : id_5 < -1;
  logic [id_10 : -1 'b0] id_16 = -1'd0;
endmodule
