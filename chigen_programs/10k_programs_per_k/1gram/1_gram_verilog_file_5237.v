// Seed: 1637444351
module module_0 (
    input  tri0  id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    input  wand  id_3,
    output tri0  id_4,
    input  wire  id_5,
    input  wor   id_6,
    output wor   id_7,
    output wor   id_8,
    output wand  id_9,
    input  uwire id_10
);
  wire id_12;
  wire id_13;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    input tri id_2
);
  wand id_4, id_5;
  uwire id_6, id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign id_5 = (id_7);
  assign id_6 = -id_6;
endmodule
