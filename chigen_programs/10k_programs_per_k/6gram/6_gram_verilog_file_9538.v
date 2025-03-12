// Seed: 3552928291
module module_0 #(
    parameter id_11 = 32'd90
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
    _id_11
);
  input wire _id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd43,
    parameter id_13 = 32'd35,
    parameter id_5  = 32'd77
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
    _id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  inout wire _id_13;
  input wire id_12;
  input wire id_11;
  inout wire _id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire _id_5;
  output reg id_4;
  output wire id_3;
  input wire id_2;
  output tri id_1;
  logic [id_13 : id_10] id_16;
  assign id_13 = id_7;
  logic id_17;
  logic [id_5 : id_10] id_18;
  ;
  assign id_17[1] = id_13;
  initial $unsigned(id_13);
  ;
  assign id_1 = -1;
  logic id_19["" -  -1 : 1  ^  -1 'b0];
  ;
  wire id_20;
  wire id_21, id_22;
  module_0 modCall_1 (
      id_21,
      id_11,
      id_21,
      id_7,
      id_3,
      id_17,
      id_22,
      id_21,
      id_21,
      id_18,
      id_13
  );
  wire id_23;
  assign id_21 = id_6;
  always @(-1) id_4 <= #1 id_19 | 1;
  assign id_1 = 1 + id_12 ? id_19 == -1 : id_18 ? -1'b0 : id_12;
endmodule
