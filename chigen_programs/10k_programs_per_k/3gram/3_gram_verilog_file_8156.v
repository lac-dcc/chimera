// Seed: 2643077650
program module_0 (
    input wand id_0,
    input uwire id_1,
    output wand id_2,
    input uwire id_3,
    input tri id_4,
    output tri1 id_5,
    input wand id_6,
    output supply1 id_7,
    output tri1 id_8,
    input tri0 id_9
);
  assign id_2 = id_9;
  assign module_1.type_7 = 0;
endprogram
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    output tri   id_2,
    input  wire  id_3,
    output uwire id_4,
    output tri1  id_5
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_3,
      id_4,
      id_2,
      id_1
  );
endmodule
