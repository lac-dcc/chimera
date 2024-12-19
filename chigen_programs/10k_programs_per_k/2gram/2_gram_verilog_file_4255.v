// Seed: 2175448680
module module_0 (
    output wire  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  wire  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    input  tri   id_6,
    input  tri1  id_7,
    output tri   id_8,
    input  tri   id_9,
    input  wire  id_10,
    output uwire id_11,
    input  wor   id_12,
    output wor   id_13,
    input  tri   id_14,
    input  uwire id_15
);
  always
    if (1) begin : LABEL_0
      id_0 = 1;
      $display(id_15, 1);
    end
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    output wire id_0,
    output tri  id_1,
    input  wand id_2
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign id_0 = 1;
  wire id_4;
endmodule
