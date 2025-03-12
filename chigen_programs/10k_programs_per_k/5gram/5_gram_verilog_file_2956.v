// Seed: 3198075630
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
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33
);
  output wire id_33;
  output wire id_32;
  output wire id_31;
  inout wire id_30;
  input wire id_29;
  input wire id_28;
  output wire id_27;
  inout wire id_26;
  input wire id_25;
  output wire id_24;
  output wire id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(id_1) begin : LABEL_0
    $signed(12);
    ;
  end
endmodule
module module_1 #(
    parameter id_11 = 32'd46,
    parameter id_16 = 32'd90,
    parameter id_19 = 32'd47,
    parameter id_20 = 32'd70,
    parameter id_7  = 32'd51
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
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    id_18,
    _id_19
);
  input wire _id_19;
  output wire id_18;
  inout wire id_17;
  input wire _id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  module_0 modCall_1 (
      id_15,
      id_17,
      id_3,
      id_3,
      id_9,
      id_3,
      id_17,
      id_3,
      id_3,
      id_4,
      id_9,
      id_3,
      id_6,
      id_17,
      id_3,
      id_17,
      id_3,
      id_2,
      id_3,
      id_4,
      id_9,
      id_17,
      id_12,
      id_14,
      id_15,
      id_9,
      id_9,
      id_3,
      id_3,
      id_3,
      id_8,
      id_10,
      id_18
  );
  inout wire _id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire _id_7;
  output wire id_6;
  output logic [7:0] id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input logic [7:0] id_1;
  real _id_20;
  logic id_21;
  wire [id_7 : id_19] id_22;
  wire id_23;
  assign id_21[id_20!=id_11] = -1'd0;
endmodule
