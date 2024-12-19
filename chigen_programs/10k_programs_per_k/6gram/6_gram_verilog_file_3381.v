// Seed: 4073431
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
    id_10
);
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11, id_12;
  assign id_6 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4[1] = id_5;
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_5,
      id_7,
      id_7,
      id_6,
      id_5,
      id_3,
      id_5
  );
  wire id_8;
  timeunit 1ps; id_9(
      1, 1, 1
  );
endmodule
