// Seed: 369294500
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1'h0 & id_5;
  assign id_2 = id_1;
  parameter id_7 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_1,
      id_6,
      id_1
  );
  always_latch if (!id_1) disable id_8;
endmodule
