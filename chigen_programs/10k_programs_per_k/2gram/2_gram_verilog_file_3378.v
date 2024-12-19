// Seed: 2665379627
module module_0 (
    input wand id_0,
    input tri  id_1,
    input tri  id_2
);
  module_2 modCall_1 (id_2);
  assign modCall_1.id_0 = 0;
endmodule
module module_1 (
    output tri  id_0,
    output wand id_1,
    input  tri  id_2
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input supply1 id_0
);
  always $display(id_0 ==? id_0);
endmodule
module module_3 (
    input wire  id_0,
    input uwire id_1,
    input tri0  id_2
);
  module_2 modCall_1 (id_2);
endmodule
module module_4 (
    input  tri   id_0,
    input  uwire id_1,
    input  wor   id_2,
    output wand  id_3,
    input  wor   id_4,
    output wire  id_5
);
  wire id_7;
  wire id_8;
  module_2 modCall_1 (id_2);
  assign modCall_1.id_0 = 0;
endmodule
