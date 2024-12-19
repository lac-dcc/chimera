// Seed: 3712952974
module module_0;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_4;
  assign id_4 = 1;
  always_ff begin : LABEL_0
    fork
      id_3 = 1;
      id_1 <= (1);
    join
    id_3 <= id_2;
  end
  wire id_5;
  module_0 modCall_1 ();
  wire id_6;
endmodule
module module_2 (
    output tri   id_0,
    input  wand  id_1,
    input  uwire id_2,
    input  wand  id_3
);
  assign id_0 = 1;
  and primCall (id_0, id_1, id_2, id_3);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
