// Seed: 4186133043
module module_0 (
    output wor   id_0,
    input  uwire id_1,
    output tri   id_2,
    input  wand  id_3,
    input  tri0  id_4,
    output tri   id_5
);
  logic [7:0] id_7, id_8, id_9, id_10, id_11, id_12;
  wire module_0;
  assign id_10[1] = 1;
endmodule
module module_1 (
    input  wire id_0,
    output wand id_1
);
  assign id_1 = 1'b0;
  specify
    $setup(id_3, id_4, 1'b0);
  endspecify
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_3 = 0;
  initial begin : LABEL_0
    id_4 <= 1;
  end
endmodule
