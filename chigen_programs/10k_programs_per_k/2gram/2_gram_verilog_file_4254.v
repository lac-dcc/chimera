// Seed: 3078283376
module module_0 (
    output wor   id_0,
    input  wire  id_1,
    input  uwire id_2,
    output tri0  id_3
);
  wire  id_5;
  logic id_6;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri1  id_1,
    output wor   id_2,
    input  uwire id_3,
    input  tri1  id_4
);
  parameter id_6 = -1;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_3,
      id_0
  );
endmodule
macromodule module_2 #(
    parameter id_0 = 32'd7,
    parameter id_5 = 32'd67
) (
    input supply1 _id_0,
    input tri id_1,
    output wand id_2,
    input tri0 id_3,
    input supply0 id_4,
    input tri0 _id_5
);
  logic [-1 : id_0] id_7 = 1;
  wire [1 'b0 : id_5] id_8;
  assign id_8 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
