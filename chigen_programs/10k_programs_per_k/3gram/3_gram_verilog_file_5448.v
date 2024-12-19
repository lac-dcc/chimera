// Seed: 2362411537
module module_0;
  wand id_2, id_3;
  always #1 begin : LABEL_0
    id_3 = id_3 * ~1 - 1;
  end
endmodule
module module_1 (
    output tri1  id_0,
    input  uwire id_1
);
  assign id_0 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2[1] = id_1;
  tri0 id_4;
  wire id_5;
  wire id_6;
  assign id_3 = 1;
  assign id_4 = 1;
  wire id_7, id_8;
  assign id_7 = id_5;
  wire id_9;
  module_0 modCall_1 ();
  wire id_10;
endmodule
