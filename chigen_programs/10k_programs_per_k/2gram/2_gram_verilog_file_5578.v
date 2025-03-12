// Seed: 1339834538
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(.id_6(id_7)),
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
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  assign id_2[1] = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd50
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6
);
  input wire id_6;
  input wire _id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire  id_7;
  logic id_8;
  assign id_4[id_5] = id_3;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_8,
      id_3,
      id_7,
      id_3,
      id_7,
      id_7,
      id_3,
      id_7,
      id_3,
      id_3,
      id_8,
      id_8,
      id_3
  );
endmodule
