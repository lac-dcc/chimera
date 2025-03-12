// Seed: 2392605374
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
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic [7:0] id_20 = id_13;
  assign id_20[1] = id_20 & -1'b0;
endmodule
module module_1 #(
    parameter id_1  = 32'd24,
    parameter id_11 = 32'd50,
    parameter id_3  = 32'd48,
    parameter id_4  = 32'd44,
    parameter id_8  = 32'd94
) (
    _id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  input wire _id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire _id_4;
  inout wire _id_3;
  inout logic [7:0] id_2;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_5,
      id_7,
      id_7,
      id_7,
      id_7,
      id_6,
      id_7,
      id_6,
      id_7
  );
  inout wire _id_1;
  wire [id_1 : id_3] id_9;
  logic [7:0][id_8 : 1] id_10;
  wire _id_11;
  assign id_2[id_4 : 1'b0-1] = id_3;
  assign id_10[id_11] = 1;
endmodule
