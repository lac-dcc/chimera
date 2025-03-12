// Seed: 3799226630
macromodule module_0 (
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
    id_18
);
  input wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_20 = 32'd93,
    parameter id_26 = 32'd18,
    parameter id_6  = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
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
    _id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    _id_26
);
  input wire _id_26;
  inout wire id_25;
  output wire id_24;
  output wire id_23;
  inout wire id_22;
  input wire id_21;
  input wire _id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output logic [7:0] id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  module_0 modCall_1 (
      id_22,
      id_25,
      id_22,
      id_11,
      id_25,
      id_1,
      id_14,
      id_18,
      id_2,
      id_22,
      id_15,
      id_8,
      id_7,
      id_22,
      id_4,
      id_1,
      id_13,
      id_5
  );
  input wire id_7;
  output wire _id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_16[id_20 : ~id_26] = -1'b0;
  logic [id_6 : 1] id_27;
endmodule
