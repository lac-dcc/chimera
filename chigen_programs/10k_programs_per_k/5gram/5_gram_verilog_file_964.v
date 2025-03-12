// Seed: 3003467666
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
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25
);
  inout wire id_25;
  inout wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_26;
endmodule
module module_1 #(
    parameter id_2 = 32'd23,
    parameter id_4 = 32'd50,
    parameter id_7 = 32'd0
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5
);
  input wire id_5;
  inout wire _id_4;
  output logic [7:0] id_3;
  inout wire _id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_5,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_6, _id_7;
  parameter integer id_8 = -1;
  always @(-1 or posedge -1) begin : LABEL_0
    deassign id_4;
  end
  assign id_3[id_2] = id_2;
  logic [id_7 : -  id_4] id_9;
  ;
endmodule
