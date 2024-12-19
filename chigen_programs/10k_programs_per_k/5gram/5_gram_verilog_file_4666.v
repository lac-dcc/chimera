// Seed: 2534088334
module module_0 (
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
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9 = id_6;
  assign module_1.id_7 = 0;
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
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4 = $display;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_7,
      id_1,
      id_6,
      id_1,
      id_7,
      id_1
  );
  assign id_7 = 1;
  always @(posedge id_7) id_5 = id_3;
endmodule
