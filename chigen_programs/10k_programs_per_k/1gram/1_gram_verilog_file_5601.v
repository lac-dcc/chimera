// Seed: 324625796
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7[1 :-1],
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input logic [7:0] id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16, id_17;
  wire id_18, id_19, id_20, id_21;
  parameter id_22 = 1;
  assign id_19 = id_16;
  wire id_23;
endmodule
module module_1 #(
    parameter id_10 = 32'd5
) (
    id_1,
    id_2,
    id_3[-1 :-1],
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire _id_10;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6,
      id_7,
      id_9,
      id_9,
      id_3,
      id_5,
      id_4,
      id_12,
      id_12,
      id_13,
      id_4,
      id_15,
      id_13
  );
  input wire id_9;
  inout wire id_8;
  output tri1 id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  wire [id_10 : 1] id_16[1 : -1 'h0];
  assign id_4 = id_16;
  assign id_7 = -1;
  wire [-1 : 1] id_17;
endmodule
