// Seed: 2499319957
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input wire id_2,
    input uwire id_3,
    output wire id_4,
    input wor id_5,
    input supply1 id_6,
    output wor id_7,
    output supply0 id_8,
    input wand id_9,
    input wire id_10,
    output tri0 id_11,
    input wand id_12
);
  wire id_14, id_15;
  assign module_1.type_1 = 0;
  tri1 id_16 = id_12;
endmodule
module module_1 (
    input  wand  id_0,
    output tri   id_1,
    output tri0  id_2,
    output uwire id_3,
    input  tri0  id_4,
    input  wor   id_5,
    input  tri0  id_6,
    input  uwire id_7,
    input  tri0  id_8
);
  assign id_2 = 1;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_4,
      id_8,
      id_1,
      id_5,
      id_6,
      id_1,
      id_1,
      id_8,
      id_7,
      id_2,
      id_5
  );
  assign id_1 = 1;
endmodule
