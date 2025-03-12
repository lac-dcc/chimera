// Seed: 1963918226
macromodule module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input tri id_5,
    output tri1 id_6,
    input tri1 id_7,
    input wor id_8,
    input wor id_9
    , id_14,
    input supply0 id_10,
    output wor id_11
    , id_15,
    output wor id_12
);
  assign id_1 = -1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    inout wand id_1,
    input tri1 id_2,
    input tri id_3,
    input wor id_4,
    input tri1 id_5,
    input supply1 id_6
);
  assign id_0 = -1;
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_6,
      id_2,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_1,
      id_0
  );
endmodule
