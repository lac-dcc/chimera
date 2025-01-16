// Seed: 2850067223
program module_0 (
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
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_16;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3#(
        .id_4(-1),
        .id_5(id_3)
    ),
    id_7
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9, id_10;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_7,
      id_4,
      id_5,
      id_7,
      id_7,
      id_5,
      id_1,
      id_9,
      id_5,
      id_9,
      id_2
  );
  wire id_11;
  parameter id_12 = id_6 - 1;
  wand id_13, id_14;
  assign id_1  = id_2;
  assign id_13 = "" != -1'h0;
endmodule
