// Seed: 3542727638
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output supply1 id_2,
    output wand id_3,
    input tri1 id_4,
    input uwire id_5,
    input wire id_6,
    input uwire id_7
);
  assign id_3 = id_1;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    output wire  id_2,
    input  wire  id_3,
    output tri   id_4,
    output tri0  id_5,
    input  tri   id_6,
    output uwire id_7,
    output wand  id_8
);
  assign (highz1, strong0) id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_8,
      id_3,
      id_3,
      id_6,
      id_1
  );
endmodule
