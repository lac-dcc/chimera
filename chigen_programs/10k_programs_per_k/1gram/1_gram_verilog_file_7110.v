// Seed: 2713364398
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
    id_19,
    id_20
);
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  assign id_14 = -1;
  initial
    @(*)
    `define pp_21 0
  wire id_22, id_23;
  assign #1 id_2[-1] = id_19;
endmodule
module module_1 #(
    parameter id_11 = 32'd86,
    parameter id_14 = 32'd30,
    parameter id_17 = 32'd26,
    parameter id_4  = 32'd92,
    parameter id_8  = 32'd16
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5[id_11 :-1],
    id_6,
    id_7[1 : id_8],
    _id_8,
    id_9,
    id_10,
    _id_11,
    id_12,
    id_13,
    _id_14[id_17!==id_11 :-1],
    id_15,
    id_16,
    _id_17
);
  inout wire _id_17;
  inout wire id_16;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_16,
      id_10,
      id_13,
      id_13,
      id_3,
      id_16,
      id_13,
      id_13,
      id_1,
      id_10,
      id_10,
      id_16,
      id_16,
      id_3,
      id_13,
      id_3,
      id_13,
      id_12
  );
  input wire id_15;
  output logic [7:0] _id_14;
  inout wire id_13;
  output wire id_12;
  input wire _id_11;
  input wire id_10;
  input wire id_9;
  output wire _id_8;
  input logic [7:0] id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  input wire _id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_18[id_4  *  1 : id_14  <  id_8];
  ;
endmodule
