// Seed: 2165385221
module module_0 (
    output wand id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    input  tri0 id_3,
    output wire id_4,
    input  wand id_5
);
  reg  id_7;
  wire id_8;
  always @(posedge id_2) id_7 = #1 id_5 == 1;
  timeunit 1ps;
  initial id_7 <= 1;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output tri id_2,
    input tri1 id_3,
    output tri id_4,
    output wire id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
