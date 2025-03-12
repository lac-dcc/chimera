// Seed: 787930702
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
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  localparam id_11 = -1;
endmodule
module module_1 #(
    parameter id_13 = 32'd23,
    parameter id_16 = 32'd90,
    parameter id_19 = 32'd92,
    parameter id_7  = 32'd47
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    id_18,
    _id_19,
    id_20,
    id_21
);
  input wire id_21;
  output wire id_20;
  input wire _id_19;
  input wire id_18;
  inout wire id_17;
  input wire _id_16;
  output logic [7:0] id_15;
  inout wire id_14;
  inout wire _id_13;
  module_0 modCall_1 (
      id_17,
      id_12,
      id_20,
      id_14,
      id_10,
      id_17,
      id_12,
      id_14,
      id_2,
      id_6
  );
  inout wire id_12;
  output tri id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire _id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  wire [id_19 : id_13] id_22;
  assign id_17 = ~id_3[id_7];
  assign id_11 = 1;
  wire id_23;
  ;
  assign id_15[id_16] = id_22;
  parameter id_24 = 1;
endmodule
