// Seed: 720669167
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 1'd0;
  wire id_5;
  rtran (id_2, id_4, 1);
  assign id_1 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_1,
      id_6
  );
  assign modCall_1.id_2 = 0;
  timeunit 1ps;
  initial id_1 = (1);
endmodule
