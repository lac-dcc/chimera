// Seed: 852338759
module module_0 ();
  wand id_1;
  wire id_2;
  assign id_1 = 1;
  wire id_3;
  tri  id_4;
  wire id_5;
  assign module_2.id_1 = 0;
  assign id_1 = 1;
  assign id_4 = 1;
  wire id_6, id_7;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri   id_0,
    input  uwire id_1,
    input  wor   id_2,
    output wand  id_3,
    output wor   id_4,
    input  wire  id_5,
    output tri0  id_6
);
  always begin : LABEL_0
    id_0 = 1'h0;
  end
  module_0 modCall_1 ();
endmodule
