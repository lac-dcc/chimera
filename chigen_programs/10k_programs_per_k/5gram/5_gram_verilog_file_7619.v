// Seed: 2121613891
module module_0 (
    output supply0 id_0,
    input wor id_1,
    output tri0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output supply0 id_6,
    output tri0 id_7
);
  wire id_9, id_10;
  tri id_11 = id_4;
endmodule
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input wor id_6,
    output uwire id_7,
    input wand id_8,
    input supply0 id_9,
    input tri id_10,
    input tri id_11,
    output wor module_1,
    input wand id_13,
    input supply1 id_14
);
  assign id_2 = id_8 | id_0;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_5,
      id_7,
      id_9,
      id_9,
      id_7,
      id_5
  );
  assign modCall_1.type_16 = 0;
  timeunit 1ps / 1ps;
endmodule
