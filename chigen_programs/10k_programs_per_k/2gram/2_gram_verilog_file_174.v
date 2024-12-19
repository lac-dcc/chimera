// Seed: 2364458870
module module_0;
  reg id_2;
  logic [7:0] id_3;
  always_ff id_2 <= id_3[1];
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
  assign id_2 = 1;
  wire id_10;
  assign id_3 = id_2 == id_8;
  module_0 modCall_1 ();
endmodule
