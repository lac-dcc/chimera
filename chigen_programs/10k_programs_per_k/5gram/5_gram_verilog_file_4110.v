// Seed: 4152353774
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  uwire id_10 = 1;
endmodule
module module_1 #(
    parameter id_20 = 32'd34,
    parameter id_4  = 32'd33
) (
    id_1,
    id_2,
    id_3,
    _id_4,
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
    _id_20
);
  inout wire _id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  input logic [7:0] id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  inout wire _id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_16,
      id_19,
      id_18,
      id_19,
      id_19,
      id_2,
      id_3,
      id_11,
      id_19
  );
  inout wire id_2;
  output wire id_1;
  wire id_21;
  assign id_6[1] = id_14[id_20 : id_4];
endmodule
