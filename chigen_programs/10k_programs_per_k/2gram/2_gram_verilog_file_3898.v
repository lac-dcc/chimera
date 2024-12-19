// Seed: 579980752
module module_0 (
    input wand id_0,
    output tri0 id_1,
    output tri0 id_2,
    input tri1 id_3,
    input tri1 id_4,
    output wor id_5,
    input wand id_6,
    output supply0 id_7,
    input wand id_8
);
  wire id_10;
  wire id_11;
  wand id_12 = 1;
  assign id_2 = id_12;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    output tri1  id_2,
    output tri   id_3,
    input  wor   id_4,
    input  tri1  id_5
);
  initial begin : LABEL_0
    id_0 = 1'b0;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_4,
      id_3,
      id_1
  );
  assign modCall_1.type_14 = 0;
  uwire id_7 = id_1;
endmodule
