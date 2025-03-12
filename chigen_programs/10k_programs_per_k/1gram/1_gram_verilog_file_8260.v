// Seed: 1716299045
module module_0;
  struct packed {
    logic id_1;
    struct packed {
      logic id_2;
      logic id_3  = -1;
      logic id_4;
    } id_5;
  } id_6 = 1'b0;
  wire id_7;
  assign id_6.id_4 = id_6.id_5;
endmodule
module module_1 #(
    parameter id_12 = 32'd28,
    parameter id_5  = 32'd82,
    parameter id_6  = 32'd21
) (
    output tri0 id_0,
    input supply0 id_1,
    input tri id_2,
    input tri id_3,
    output supply1 id_4[-1 'b0 : 1],
    output wor _id_5,
    input tri1 _id_6,
    output tri0 id_7,
    inout wor id_8,
    input supply1 id_9,
    output wire id_10,
    input wand id_11[1 'd0 : id_5],
    input wor _id_12,
    input wor id_13
);
  assign id_7  = 1;
  assign id_10 = id_8;
  logic [id_6 : id_12] id_15;
  xnor primCall (id_0, id_1, id_11, id_13, id_15, id_2, id_3, id_8, id_9);
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
