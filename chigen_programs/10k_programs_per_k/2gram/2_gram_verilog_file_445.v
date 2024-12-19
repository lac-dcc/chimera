// Seed: 3546247178
module module_0 (
    input  uwire id_0,
    output tri0  id_1,
    output wor   id_2,
    input  uwire id_3,
    input  wire  id_4,
    output tri   id_5,
    output wand  id_6,
    input  tri0  id_7,
    input  tri   id_8,
    input  wor   id_9
);
  supply1 id_11;
  always begin : LABEL_0
    id_11 = id_11 == id_8;
  end
  wire id_12;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input wand id_2,
    input tri id_3,
    input wor id_4,
    input tri1 id_5,
    output supply0 id_6,
    input tri0 id_7
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_0,
      id_3,
      id_6,
      id_6,
      id_5,
      id_3,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
