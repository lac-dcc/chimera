// Seed: 4068716064
module module_0;
  always
    if (id_1) begin : LABEL_0
      id_2 <= 1;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri   id_0,
    input  tri1  id_1,
    output uwire id_2,
    output wand  id_3
);
  assign id_3 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  always_ff wait (id_1) #1 id_2 = id_1;
endmodule
