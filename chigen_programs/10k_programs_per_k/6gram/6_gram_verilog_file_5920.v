// Seed: 1342908587
module module_0 (
    input  wor  id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    input  wire id_3,
    output wor  id_4,
    input  tri  id_5,
    input  wand id_6,
    input  tri  id_7,
    output tri0 id_8,
    input  wand id_9
);
  always @(-1) begin : LABEL_0
    wait (1'h0);
  end
  always @(id_6 or negedge -1) force id_8 = id_6;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input wand id_2,
    output wire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_3,
      id_2
  );
  timeunit 1ps;
  buf primCall (id_0, id_1);
endmodule
