// Seed: 2650407042
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
  output wire id_25;
  input wire id_24;
  input wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_25 = id_24;
endmodule
module module_1 #(
    parameter id_7 = 32'd24
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8
);
  input wire id_8;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_3,
      id_6,
      id_1,
      id_2,
      id_2,
      id_3,
      id_6,
      id_1,
      id_3,
      id_8,
      id_1,
      id_2,
      id_2,
      id_2,
      id_6,
      id_3,
      id_1,
      id_2,
      id_6,
      id_3,
      id_5,
      id_3
  );
  input wire _id_7;
  inout wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_9 = 1;
  assign id_3 = id_1 ? id_4[id_7] : !(-1'b0);
  always @(*) begin : LABEL_0
    deassign id_2;
  end
endmodule
