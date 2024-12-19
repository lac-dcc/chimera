// Seed: 1340382767
module module_0 (
    output supply1 id_0
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    output supply1 id_2,
    output wor id_3,
    input tri1 id_4,
    input tri1 id_5
);
  id_7 :
  assert property (@(1'b0 or id_7 or posedge 1) id_0) if (id_4) id_1 = id_5;
  assign id_2 = 1;
  module_0 modCall_1 (id_3);
  always_latch id_2 = 1'b0;
endmodule
module module_2 (
    input  wand id_0,
    output tri  id_1
);
  logic [7:0] id_3, id_4;
  generate
    assign id_3[1] = 1;
    wire id_5;
  endgenerate
  wire id_6;
  wire id_7;
  module_0 modCall_1 (id_1);
  wire id_8;
  assign (pull1, weak0) id_1 = (1) ? 1'b0 : 1;
endmodule
