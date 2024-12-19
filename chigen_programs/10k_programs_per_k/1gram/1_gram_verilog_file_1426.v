// Seed: 415379496
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input tri0 id_2,
    output wand id_3,
    output tri0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    output tri1 id_7,
    output wand id_8,
    input tri id_9,
    input wire id_10
);
  id_12(
      id_2
  );
  wire id_13, id_14;
  wire id_15;
  assign id_13 = id_14;
  assign module_1.type_5 = 0;
  wire id_16, id_17;
  assign id_7 = id_10;
  wire id_18;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    output wand  id_2,
    input  tri0  id_3,
    output wor   id_4,
    output tri0  id_5,
    output uwire id_6,
    input  tri1  id_7,
    input  tri   id_8,
    input  tri0  id_9,
    input  wire  id_10
);
  xnor primCall (id_2, id_0, id_7, id_8);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_2,
      id_4,
      id_1,
      id_10,
      id_6,
      id_4,
      id_10,
      id_10
  );
endmodule
