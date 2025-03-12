// Seed: 4248705072
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  assign module_1.id_14 = 0;
  inout wire id_2;
  input wire id_1;
  wire id_10;
endmodule
module module_1 #(
    parameter id_12 = 32'd28,
    parameter id_14 = 32'd99
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
    _id_12,
    id_13,
    _id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  output wire id_22;
  input wire id_21;
  module_0 modCall_1 (
      id_18,
      id_19,
      id_22,
      id_4,
      id_4,
      id_22,
      id_20,
      id_9,
      id_18
  );
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire _id_14;
  output wire id_13;
  inout wire _id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  wire [id_12 : -1 'd0] id_23;
  always deassign id_10;
  assign id_1[1|id_14] = id_12;
endmodule
