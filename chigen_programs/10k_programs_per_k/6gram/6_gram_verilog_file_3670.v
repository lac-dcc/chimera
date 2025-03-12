// Seed: 1935238502
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input supply1 module_0,
    input tri1 id_5,
    output supply1 id_6
);
endmodule
module module_1 #(
    parameter id_2 = 32'd61
) (
    input  tri1  id_0,
    output tri   id_1,
    input  uwire _id_2,
    input  wor   id_3,
    output tri   id_4,
    output wire  id_5
);
  reg [1 : 1  -  id_2] id_7;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_0,
      id_0,
      id_3,
      id_5
  );
  assign modCall_1.id_3 = 0;
  always @(id_7 or posedge -1) id_7 = -1;
endmodule
