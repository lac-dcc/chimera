// Seed: 1386773303
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
    id_15
);
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  assign module_1.id_10 = 0;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire [-1 : -1] id_16;
  localparam id_17 = "" == 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd29,
    parameter id_12 = 32'd0,
    parameter id_15 = 32'd59,
    parameter id_22 = 32'd18,
    parameter id_6  = 32'd38
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11
);
  inout wire id_11;
  input wire _id_10;
  output tri0 id_9;
  input wire id_8;
  inout wire id_7;
  inout wire _id_6;
  output wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  wire _id_12;
  wire id_13;
  assign id_9 = -1;
  logic [7:0] id_14;
  assign id_3[id_10] = 1'd0;
  wire [-1 : 1] _id_15;
  wire [1 : id_12] id_16;
  parameter id_17 = 1;
  logic [7:0] id_18;
  logic [id_15 : -1 'h0] id_19, id_20;
  wire  id_21;
  logic _id_22;
  module_0 modCall_1 (
      id_21,
      id_2,
      id_21,
      id_2,
      id_11,
      id_17,
      id_8,
      id_16,
      id_2,
      id_7,
      id_2,
      id_9,
      id_13,
      id_16,
      id_11
  );
  logic id_23 = id_2;
  wire id_24;
  logic [1 : id_22] id_25 = id_14#(!id_17, id_17, 1) [id_6];
endmodule
