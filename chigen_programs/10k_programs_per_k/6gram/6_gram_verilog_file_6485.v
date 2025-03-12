// Seed: 2496282625
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input wand id_2,
    input supply0 id_3,
    input supply0 id_4,
    input uwire id_5,
    input supply1 id_6,
    input wand id_7,
    input wand id_8,
    input tri id_9,
    input supply0 id_10,
    input tri0 id_11,
    output tri0 id_12,
    output wor id_13
);
  logic id_15;
  assign id_13 = (id_15);
endmodule
module module_1 (
    inout  uwire id_0,
    input  wor   id_1,
    output uwire id_2,
    input  wire  id_3,
    input  tri0  id_4,
    input  wand  id_5,
    input  tri1  id_6,
    input  uwire id_7,
    input  uwire id_8
    , id_11,
    output tri   id_9
);
  wand id_12;
  assign id_12 = 'b0;
  module_0 modCall_1 (
      id_9,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.id_4 = 0;
  assign id_2 = id_5 ? id_0 == id_3 : id_6;
  xnor primCall (id_0, id_3, id_1, id_12, id_5, id_4, id_11, id_8, id_6);
endmodule
