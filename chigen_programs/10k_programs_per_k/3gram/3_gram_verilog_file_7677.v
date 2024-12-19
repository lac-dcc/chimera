// Seed: 2460725224
macromodule module_0 (
    input wand  id_0,
    input tri1  id_1,
    input wor   id_2,
    input uwire id_3
);
  wire id_5;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input tri1 id_0
    , id_12,
    output supply0 id_1,
    input wire id_2,
    input wand id_3,
    input supply1 id_4,
    input tri1 id_5,
    input wor id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri1 id_9,
    output tri0 id_10
);
  xor primCall (id_1, id_12, id_6, id_0, id_9, id_2, id_4, id_7, id_3);
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5
  );
  assign id_1 = id_7;
endmodule
