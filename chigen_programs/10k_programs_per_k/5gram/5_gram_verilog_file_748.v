// Seed: 168130499
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wand id_2,
    output wor id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri id_9,
    input tri0 module_0,
    input wire id_11,
    input supply0 id_12,
    input uwire id_13,
    input wand id_14
);
  wire id_16;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    input  wor   id_3,
    output tri   id_4,
    output tri1  id_5,
    input  tri0  id_6,
    input  wor   id_7,
    input  tri1  id_8,
    input  wand  id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_1,
      id_0,
      id_7,
      id_1,
      id_4,
      id_8,
      id_3,
      id_0,
      id_3,
      id_8,
      id_6,
      id_3,
      id_8
  );
  assign modCall_1.id_3 = 0;
  timeunit 1ps;
endmodule
