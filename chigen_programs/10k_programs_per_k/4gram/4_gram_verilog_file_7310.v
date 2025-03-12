// Seed: 1525394037
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
    id_16
);
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output uwire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_10 = id_1 ? id_15 : 1;
  assign id_7  = id_4;
  parameter id_17 = (-1'b0) - 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd2
) (
    id_1,
    id_2,
    _id_3,
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
    id_16
);
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output reg id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  input wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_5,
      id_4,
      id_7,
      id_12,
      id_12,
      id_4,
      id_12
  );
  inout wire _id_3;
  input wire id_2;
  output wire id_1;
  always @(*) id_13 = (id_7) & 1'd0;
  assign id_8[id_3] = ~id_3;
  assign id_6[(-1)] = 1 - -1'b0;
endmodule
