// Seed: 1625835340
module module_0 (
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
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = 1;
  always @(negedge ~id_7) $display;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri0  id_1,
    output wand  id_2,
    output tri0  id_3,
    output uwire id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_7 = 0;
  always @(posedge id_0 - 1 or(1 && 1)) #1;
endmodule
