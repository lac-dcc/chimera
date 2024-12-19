// Seed: 1253492465
module module_0 (
    input  tri0  id_0,
    output uwire id_1,
    input  wand  id_2#(.id_6(1), .id_7(1 == id_7), .id_8(1)),
    input  wand  id_3,
    input  tri   id_4
);
  tri0 id_9 = 1;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wor  id_1
);
  assign id_3 = {id_1{id_0}};
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    input  tri0  id_0,
    output uwire id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0
  );
endmodule
