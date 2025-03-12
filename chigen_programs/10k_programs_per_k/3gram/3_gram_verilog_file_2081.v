// Seed: 3852987552
module module_0 (
    input  tri  id_0,
    output tri1 id_1
);
  wire id_3;
  ;
  assign id_1 = 1;
  parameter integer id_4 = 1;
  assign id_3 = -1;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input wire id_3
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_3 = 32'd44
) (
    input  wand id_0,
    input  wand id_1,
    output tri1 id_2,
    input  tri  _id_3,
    input  tri0 id_4
);
  wire id_6;
  logic [-1 : id_3] id_7;
  ;
  nand primCall (id_2, id_1, id_4);
  module_0 modCall_1 (
      id_4,
      id_2
  );
endmodule
