// Seed: 3100538116
module module_0;
  logic [7:0] id_1, id_2;
  final @(posedge 1) $clog2(8);
  ;
  `define pp_3 0
  assign `pp_3 = 1'b0;
  wire id_4, id_5, id_6, id_7, id_8;
  assign id_4 = id_5.sum;
  wire id_9;
  ;
  wire id_10;
  assign id_8 = id_4;
  assign id_4 = id_8;
  assign id_1[1] = `pp_3;
  assign id_10 = id_7;
  assign `pp_3 = -1'b0;
  assign id_8 = id_7;
endmodule
module module_1 #(
    parameter id_8 = 32'd12
) (
    input wire id_0,
    input tri1 id_1,
    input tri1 id_2,
    input supply1 id_3,
    output tri id_4[1 'd0 : id_8],
    input wor id_5,
    output tri1 id_6,
    input uwire id_7,
    input wand _id_8,
    input tri1 id_9,
    input wand id_10,
    input wor id_11,
    inout tri1 id_12
);
  assign id_4 = -1;
  wire id_14;
  module_0 modCall_1 ();
  logic id_15;
  nor primCall (id_12, id_14, id_2, id_3, id_5, id_7, id_9);
  wire  id_16;
  logic id_17;
  assign id_16 = id_12;
endmodule
