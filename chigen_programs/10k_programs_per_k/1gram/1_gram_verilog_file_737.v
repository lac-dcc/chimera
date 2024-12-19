// Seed: 3509198612
module module_0 (
    input supply1 id_0
    , id_9,
    input tri0 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    output tri0 id_6,
    input wand id_7
);
  wand id_10, id_11;
  assign id_11 = id_9 & 1;
  assign id_9  = id_11;
  if (id_7) assign id_11 = 1;
  assign id_11 = 1;
  assign id_11 = id_9;
endmodule
module module_1 (
    output tri   id_0,
    output uwire id_1,
    input  uwire id_2,
    input  wand  id_3,
    input  wor   id_4,
    output tri0  id_5,
    output tri   id_6,
    input  tri0  id_7,
    input  tri0  id_8,
    input  tri   id_9,
    input  tri1  id_10,
    input  uwire id_11
);
  genvar id_13;
  wire id_14;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_6,
      id_9,
      id_4,
      id_0,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
