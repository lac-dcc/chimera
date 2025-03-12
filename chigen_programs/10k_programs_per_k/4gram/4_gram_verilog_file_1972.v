// Seed: 3422123785
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input tri id_2,
    input supply1 id_3,
    input wire id_4,
    input tri1 id_5,
    output tri0 id_6,
    input wand id_7,
    input uwire id_8,
    input supply0 id_9,
    input tri1 id_10,
    output tri0 id_11
);
  assign id_11 = id_3;
  wire id_13;
  ;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri  id_1
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
  integer [1 : -1] id_3 = 1;
endmodule
