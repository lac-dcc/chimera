// Seed: 593544667
module module_0 #(
    parameter id_13 = 32'd99
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
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire _id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input logic [7:0] id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire [id_13 : -1] id_20 = id_7[1];
  assign id_16 = id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd54,
    parameter id_2  = 32'd67,
    parameter id_23 = 32'd46,
    parameter id_26 = 32'd68,
    parameter id_3  = 32'd29
) (
    id_1,
    _id_2,
    _id_3,
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  inout wire id_21;
  input wire id_20;
  inout tri1 id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire _id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  input logic [7:0] id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire _id_3;
  input wire _id_2;
  output wire id_1;
  wire id_22;
  wire _id_23;
  reg id_24, id_25;
  localparam id_26 = 1;
  wire id_27;
  parameter [id_23 : -1 'b0] id_28 = 1;
  always @(posedge id_18 > 1'b0) id_24 <= 1;
  assign id_19 = -1;
  module_0 modCall_1 (
      id_22,
      id_4,
      id_15,
      id_22,
      id_21,
      id_18,
      id_8,
      id_27,
      id_11,
      id_9,
      id_22,
      id_11,
      id_26,
      id_21,
      id_6,
      id_9,
      id_20,
      id_4,
      id_17
  );
  assign id_8[id_3] = id_20 !== "" != id_27;
  localparam id_29 = id_28;
  supply1 id_30;
  assign id_30 = id_20 < id_26(1 - id_7[id_26 : id_2]);
  parameter id_31 = id_29[id_10];
  wire [id_10 : -1] id_32;
  assign id_6 = id_8;
endmodule
