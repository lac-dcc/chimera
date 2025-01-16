// Seed: 440232668
module module_0 ();
  uwire id_2, id_3;
endmodule
module module_1;
  id_1(
      .id_0(-1), .id_1(id_2)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output tri0  id_0,
    input  tri0  id_1,
    input  tri   id_2,
    id_7,
    input  uwire id_3,
    input  tri0  id_4,
    id_8,
    input  wand  id_5
);
  assign id_0 = !-1;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
module module_3;
  assign id_1 = -1;
  module_0 modCall_1 ();
  assign id_2 = id_2;
  final $display({id_2[1]} - 1'b0);
  assign id_1 = 1;
endmodule
