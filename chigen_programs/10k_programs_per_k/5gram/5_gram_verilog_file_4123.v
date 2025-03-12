// Seed: 2423403553
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
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire [-1 : -1] id_17;
endmodule
module module_1 #(
    parameter id_14 = 32'd10,
    parameter id_15 = 32'd5
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
    id_13,
    _id_14,
    _id_15
);
  input wire _id_15;
  input wire _id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_5,
      id_5,
      id_12,
      id_8,
      id_7,
      id_5,
      id_12,
      id_5,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5,
      id_1
  );
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  bit [id_15 : -1 'b0] id_16;
  wire id_17;
  ;
  always @(id_13 or posedge (id_14)) id_16 <= id_9 > id_14;
  logic [1 'd0 : id_14] id_18;
  ;
endmodule
