// Seed: 3843929443
module module_0 (
    output wor   id_0,
    input  tri0  id_1,
    output uwire id_2
);
  assign id_0 = 1;
  assign id_2 = 1 || 1 & 1'b0;
  assign id_2 = 1;
  wire id_4, id_5;
  assign module_1.id_3 = 0;
  wire id_6;
  assign id_2 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    output supply1 id_2,
    output wand id_3,
    input supply1 id_4,
    output supply0 id_5,
    output wor id_6
);
  buf primCall (id_6, id_4);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6
  );
  tri id_8 = id_4;
  final $display(1'b0, id_8, id_8 & id_4);
endmodule
