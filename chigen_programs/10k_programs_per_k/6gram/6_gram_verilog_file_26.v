// Seed: 3616121914
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
  input wire id_9;
  assign module_1.id_2 = 0;
  input wire id_8;
  output wire id_7;
  inout wand id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = -1'b0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output reg id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  always @(posedge 1'b0) id_2 = #1 -1;
endmodule
