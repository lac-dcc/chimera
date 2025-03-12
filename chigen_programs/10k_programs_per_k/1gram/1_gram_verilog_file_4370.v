// Seed: 379476877
module module_0 (
    input wand id_0,
    input uwire id_1,
    input supply0 id_2,
    output tri0 id_3,
    input uwire id_4,
    input supply1 id_5,
    input wire id_6,
    input wor id_7,
    input uwire id_8,
    output tri0 id_9,
    input tri1 id_10
);
  parameter id_12 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd59
) (
    input  wand  _id_0,
    output tri1  id_1,
    input  wor   id_2,
    input  wor   id_3,
    input  tri1  id_4,
    input  tri   id_5,
    input  uwire id_6,
    input  tri1  id_7
);
  assign id_1 = -1'b0;
  parameter id_9 = 1;
  logic id_10;
  wire  id_11;
  ;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_6,
      id_4,
      id_7,
      id_1,
      id_7
  );
  assign modCall_1.id_5 = 0;
  assign id_10[-1'b0 : id_0] = id_5;
endmodule
