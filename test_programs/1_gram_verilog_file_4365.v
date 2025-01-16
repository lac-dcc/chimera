// Seed: 239241211
macromodule module_0 (
    input  wor   id_0,
    input  wire  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  wand  id_5,
    output uwire id_6,
    output wand  id_7,
    output tri0  id_8,
    output wand  id_9,
    input  wand  id_10,
    output tri   id_11,
    input  wand  id_12,
    input  wand  id_13
);
  wire id_15, id_16;
  initial begin : LABEL_0
    id_8 = -1;
  end
  assign id_8 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input tri1  id_1
);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.type_17 = 0;
  always id_4 <= (-1'h0);
  wire id_5;
endmodule
