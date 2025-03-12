// Seed: 1623183336
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd28
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
    id_17
);
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire _id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_6,
      id_11
  );
  output wire id_2;
  inout wire id_1;
  assign id_5[id_13] = id_10 + $realtime;
endmodule
