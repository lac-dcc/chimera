// Seed: 1902918640
module module_0 ();
  uwire id_2, id_3;
  tri1 id_4;
  assign id_2 = 1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wor id_5 = 1 | id_4 | id_2;
endmodule
module module_1;
  wire id_2 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2;
  specify
    (id_1 *> id_2) = 1;
  endspecify
  wire id_3;
  module_3 modCall_1 ();
endmodule
module module_3 ();
  assign id_1 = 1 == (id_1);
  assign module_4.id_2 = 0;
  assign module_2.id_2 = 0;
endmodule
module module_4 (
    output tri1 id_0,
    input  tri1 id_1,
    input  tri0 id_2
);
  tri1 id_4;
  module_3 modCall_1 ();
  assign id_4 = id_2;
endmodule
