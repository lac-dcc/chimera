// Seed: 328277040
module module_0 (
    output tri0 id_0
);
  assign module_2.type_0 = 0;
  assign module_1.id_4   = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input wire id_2,
    input tri id_3,
    output wor id_4,
    input tri1 id_5,
    output wand id_6
);
  module_0 modCall_1 (id_4);
endmodule
module module_2 (
    input  tri  id_0,
    output tri0 id_1,
    input  tri  id_2
);
  wire id_4, id_5, id_6;
  module_0 modCall_1 (id_1);
endmodule
module module_3 (
    output wire id_0,
    input  tri0 id_1,
    input  wor  id_2,
    input  wand id_3,
    output tri0 id_4
);
  assign id_4 = id_3 ^ !id_2;
  module_0 modCall_1 (id_0);
  assign modCall_1.type_0 = 0;
endmodule
