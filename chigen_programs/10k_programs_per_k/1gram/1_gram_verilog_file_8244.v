// Seed: 2847925577
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
  input wire id_13;
  inout wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_14;
  ;
  assign id_7  = id_8;
  assign id_11 = id_11[-1];
  assign id_10 = id_8;
  parameter id_15 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd14
) (
    id_1,
    id_2,
    _id_3
);
  inout wire _id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0] id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_4,
      id_1,
      id_1
  );
  assign id_4[1 : ~id_3] = -1 - id_2;
endmodule
