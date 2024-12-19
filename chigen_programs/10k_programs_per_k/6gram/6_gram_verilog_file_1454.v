// Seed: 2873646313
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  assign module_1.id_2 = 0;
  wire id_6;
  wire id_7;
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
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_1
  );
  wire id_8;
  always @(negedge id_1) force id_7 = id_2;
endmodule
