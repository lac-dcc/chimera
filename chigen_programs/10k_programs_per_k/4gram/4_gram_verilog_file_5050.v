// Seed: 168421422
module module_0 (
    input wor id_0,
    output tri id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri id_4,
    output wand id_5
);
endmodule
module module_1 #(
    parameter id_6 = 32'd16
) (
    input  tri0 id_0,
    output tri  id_1,
    input  wire id_2,
    input  tri  id_3,
    output wire id_4,
    input  tri0 id_5,
    output tri  _id_6,
    input  wor  id_7,
    input  tri1 id_8,
    input  tri0 id_9,
    input  tri  id_10,
    input  wand id_11
);
  logic [7:0] id_13;
  assign id_4 = -1'b0;
  assign id_13[-1 : 1] = -1;
  module_0 modCall_1 (
      id_10,
      id_1,
      id_8,
      id_8,
      id_5,
      id_4
  );
  assign modCall_1.id_0 = 0;
  parameter id_14 = 1;
  xor primCall (id_4, id_11, id_7, id_3, id_13, id_9, id_10, id_8, id_5, id_2, id_0);
  wire id_15 = id_5;
  logic [1 : id_6] id_16;
endmodule
