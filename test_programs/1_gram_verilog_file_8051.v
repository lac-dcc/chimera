// Seed: 1284189083
module module_0;
  wire id_2;
  wire id_3;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    id_9,
    output tri1 id_2,
    input wor id_3,
    output wire id_4,
    input tri0 id_5,
    output wand id_6,
    output tri0 id_7
);
  parameter id_10 = -1'b0;
  wire id_11;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input wire id_0,
    input wand id_1,
    output tri id_2,
    input supply0 id_3
);
  buf primCall (id_2, id_3);
  module_0 modCall_1 ();
  always begin : LABEL_0
    do $display(id_3, 1); while (1'b0);
    id_2 = id_0 & id_1;
  end
  tri1 id_5, id_6 = -1, id_7;
endmodule
