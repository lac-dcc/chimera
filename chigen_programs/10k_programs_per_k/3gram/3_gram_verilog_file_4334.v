// Seed: 2426820320
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire [-1 : -1] id_12;
endmodule
module module_1 #(
    parameter id_13 = 32'd32,
    parameter id_19 = 32'd55
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
    _id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  input wire id_22;
  output wire id_21;
  inout logic [7:0] id_20;
  inout wire _id_19;
  inout reg id_18;
  output logic [7:0] id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire _id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  module_0 modCall_1 (
      id_23,
      id_15,
      id_7,
      id_8,
      id_3,
      id_3,
      id_20,
      id_14,
      id_16,
      id_11,
      id_4
  );
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_24 :
  assert property (@(id_8) id_19)
  else id_18 = id_20[id_19 :-1];
  assign id_17[1==1'b0-:id_13] = -1;
  wire id_25;
  assign id_21 = id_4;
endmodule
