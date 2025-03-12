// Seed: 517254247
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
    id_16
);
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_10 = id_1;
  wire id_17;
endmodule
module module_1 #(
    parameter id_1 = 32'd69
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output logic [7:0] id_2;
  inout wire _id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_2[id_1] = id_3;
  xor primCall (id_2, id_4, id_3);
  wire id_5;
endmodule
