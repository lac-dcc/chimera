// Seed: 1443458634
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
    id_13
);
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output logic [7:0] id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output tri1 id_1;
  assign id_1 = id_2 ==? 1'b0;
endmodule
module module_1 #(
    parameter id_3 = 32'd58
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_4;
  assign id_2[id_3] = -1;
endmodule
