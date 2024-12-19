// Seed: 3012863541
module module_0 (
    input wand id_0,
    output tri1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wor id_5,
    output wor id_6,
    output wire id_7
);
  final $display(1);
  xor primCall (id_1, id_3, id_4, id_9);
  assign module_1.id_1 = 0;
  assign id_7 = 1;
  wire id_9;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input  tri1 id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    output wand id_3,
    input  tri0 id_4
);
  wire id_6;
  xnor primCall (id_3, id_0, id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2;
  assign id_1 = id_1;
  assign module_0.type_0 = 0;
endmodule
