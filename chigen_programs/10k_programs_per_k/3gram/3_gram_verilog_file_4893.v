// Seed: 3473774415
module module_0 #(
    parameter id_13 = 32'd28
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  ;
  logic [7:0] id_12;
  logic _id_13;
  ;
  wire id_14;
  wire id_15;
  assign id_9 = (id_7);
  logic id_16;
  ;
  wire id_17;
endmodule
module module_1 #(
    parameter id_15 = 32'd85,
    parameter id_23 = 32'd97,
    parameter id_25 = 32'd0,
    parameter id_26 = 32'd97,
    parameter id_27 = 32'd8
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
    id_14,
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  input wire id_22;
  output tri0 id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  output logic [7:0] id_16;
  input wire _id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output supply1 id_11;
  output wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_9[id_15-:1'b0] = id_20;
  uwire _id_23 = -1;
  tri   id_24 = 1;
  assign id_21 = id_22 == ('b0 - id_20);
  logic _id_25;
  assign id_11 = -1 ^ (id_14 ? 1'h0 : 1'b0 + -1'b0);
  parameter id_26 = -1'b0;
  assign id_16[id_25 :-1] = 1;
  localparam id_27 = id_26;
  module_0 modCall_1 (
      id_21,
      id_4,
      id_7,
      id_14,
      id_18,
      id_1,
      id_24,
      id_22,
      id_24,
      id_17
  );
  logic [-1 'b0 : id_23] id_28;
  ;
  defparam id_26.id_27 = -1'b0;
  parameter id_29 = "";
endmodule
