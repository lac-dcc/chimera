// Seed: 1780304741
module module_0;
  wire id_1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd82,
    parameter id_3 = 32'd40
) (
    output wor id_0,
    output wor id_1,
    input supply1 _id_2,
    input tri0 _id_3,
    output uwire id_4,
    output wire id_5,
    output tri1 id_6
);
  wire [id_3 : id_2] id_8;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_0 = 32'd77
) (
    output tri1 _id_0,
    input wire id_1,
    output tri1 id_2,
    input uwire id_3,
    output wand id_4,
    output wand id_5,
    input wor id_6,
    output tri1 id_7,
    input supply1 id_8,
    input tri id_9
);
  wire id_11 = id_6;
  logic [-1 : id_0] id_12;
  module_0 modCall_1 ();
  always_latch deassign id_2;
  xnor primCall (id_2, id_3, id_6, id_8, id_9);
  assign id_7 = -1'b0 ? id_1 + -1'd0 : -1;
endmodule
