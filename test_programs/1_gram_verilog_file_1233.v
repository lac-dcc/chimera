// Seed: 1113529204
macromodule module_0 (
    output tri0 id_0
);
endmodule
module module_1 (
    input  tri   id_0,
    output tri1  id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  tri   id_4,
    input  tri1  id_5
);
  assign id_1 = -1;
  module_0 modCall_1 (id_1);
  assign modCall_1.type_0 = 0;
  wire id_7;
  assign id_1 = 1;
  id_8(
      id_5
  );
endmodule
module module_2;
  tri1 id_1;
  uwire id_2, id_3, id_4;
  tri  id_5 = id_3 == id_3, id_6;
  wire id_7;
  assign id_2 = 1'h0;
  assign id_5 = id_1;
endmodule
module module_3 (
    input uwire id_0,
    input tri0  id_1
);
  assign id_3 = -1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
