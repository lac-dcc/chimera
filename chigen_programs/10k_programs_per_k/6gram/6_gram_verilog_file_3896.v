// Seed: 75549843
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
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_9[1] = -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd10,
    parameter id_7 = 32'd49
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
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
  output logic [7:0] id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout logic [7:0] id_10;
  input wire id_9;
  input wire id_8;
  inout wire _id_7;
  input wire _id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_17[1^(id_7)] = -1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_2,
      id_3,
      id_1,
      id_5,
      id_3,
      id_10,
      id_9,
      id_4,
      id_5,
      id_5,
      id_8,
      id_8,
      id_12,
      id_1,
      id_13
  );
  assign id_17 = id_10[1'd0==1+:id_6];
endmodule
