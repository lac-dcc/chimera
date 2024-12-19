// Seed: 3284032262
module module_0 (
    input  tri   id_0,
    input  tri   id_1,
    input  wire  id_2,
    output wand  id_3,
    output tri1  id_4,
    input  tri0  id_5,
    output wire  id_6,
    input  wire  id_7,
    input  uwire id_8,
    output wor   id_9,
    output wor   id_10
);
  assign id_10 = 1;
  always begin : LABEL_0
    if (1) begin : LABEL_0
      assign id_9.id_7 = 1 | 1;
    end
  end
  assign id_10 = id_1;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output wor id_2,
    input wire id_3,
    output wand id_4,
    input tri id_5,
    input uwire id_6,
    input uwire id_7
);
  wand id_9 = id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_9,
      id_4,
      id_3,
      id_0,
      id_1,
      id_3,
      id_2,
      id_9
  );
  assign modCall_1.id_2 = 0;
endmodule
