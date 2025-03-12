// Seed: 1888712334
module module_0 (
    input tri1 id_0
);
endmodule
module module_1 (
    input  uwire id_0,
    input  tri1  id_1,
    output uwire id_2
);
  assign id_2 = id_1;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
  wire id_4;
  notif0 primCall (id_2, id_0, id_1);
  assign id_2 = -1;
endmodule
module module_2 (
    input  wor   id_0,
    input  wand  id_1,
    output tri1  id_2,
    input  wand  id_3,
    input  uwire id_4,
    input  tri   id_5,
    input  wire  id_6,
    input  wand  id_7,
    input  wor   id_8
);
  module_0 modCall_1 (id_3);
  assign modCall_1.id_0 = 0;
endmodule
