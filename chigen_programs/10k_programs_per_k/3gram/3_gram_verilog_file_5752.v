// Seed: 2368265443
module module_0 (
    output uwire id_0,
    output wand  id_1,
    input  tri1  id_2,
    input  wand  id_3,
    input  uwire id_4,
    input  tri   id_5,
    output tri1  id_6,
    input  wand  id_7,
    output tri0  id_8
);
  wire id_10;
  wire id_11;
  wire id_12;
  assign module_1.type_3 = 0;
  supply1 id_13 = 1;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    output supply1 id_2,
    output wire id_3,
    output uwire id_4,
    output supply0 id_5,
    input wire id_6,
    input wand id_7,
    output wand id_8,
    input wor id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_9,
      id_7,
      id_1,
      id_8,
      id_6,
      id_3
  );
  assign id_2 = 1;
  wire id_12;
  wire id_13;
endmodule
