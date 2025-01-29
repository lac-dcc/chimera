// Seed: 405541963
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_7;
  assign id_6 = id_1[-1];
  assign id_9 = id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  wire id_5;
  always_comb id_3 = id_3[-1];
  module_0 modCall_1 (
      id_3,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_1,
      id_5,
      id_4
  );
endmodule
