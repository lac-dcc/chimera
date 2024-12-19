// Seed: 2039277852
module module_0;
  wire id_1;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    output wor   id_0,
    output tri1  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    output wand  id_5,
    input  tri1  id_6
);
  wire id_8;
  xnor primCall (id_0, id_2, id_3, id_4, id_6, id_8);
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always
    repeat (1) begin : LABEL_0
      id_1 <= ~id_1;
    end
  module_0 modCall_1 ();
endmodule
module module_3 ();
  module_0 modCall_1 ();
  wire id_2;
endmodule
