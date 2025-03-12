// Seed: 4071569293
module module_0 #(
    parameter id_22 = 32'd52,
    parameter id_32 = 32'd96
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
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_18 = -1;
  logic [7:0]
      id_19,
      id_20,
      id_21,
      _id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      _id_32,
      id_33,
      id_34,
      id_35,
      id_36;
  logic [(  id_32  ) : $realtime] id_37 = id_31[~id_22];
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output logic [7:0] id_6;
  input wire id_5;
  input logic [7:0] id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3,
      id_5,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_2
  );
  inout wire id_2;
  input wire id_1;
  assign id_6[1'd0] = id_4 ? -1 : id_4[-1];
endmodule
