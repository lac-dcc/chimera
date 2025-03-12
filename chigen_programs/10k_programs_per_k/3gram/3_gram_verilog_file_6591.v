// Seed: 988830281
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_5;
  always_latch @(id_2 or posedge 1) $unsigned(34);
  ;
  assign id_5 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3
  );
  output wire id_1;
  assign id_3 = id_7;
endmodule
