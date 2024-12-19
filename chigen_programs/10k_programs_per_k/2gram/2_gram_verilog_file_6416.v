// Seed: 416439825
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input wire id_2,
    input tri1 id_3,
    output wor id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri id_7,
    output supply0 id_8,
    input wire id_9,
    input tri0 id_10
);
  tri1 id_12;
  assign id_12 = id_10;
endmodule
macromodule module_1 (
    input tri0 id_0,
    input tri id_1,
    input tri0 id_2,
    input wor id_3,
    input tri id_4,
    input wand id_5,
    input supply1 id_6,
    output uwire id_7,
    input wand id_8,
    input tri1 id_9,
    input supply0 id_10,
    input tri0 id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_7,
      id_8,
      id_5,
      id_7,
      id_9,
      id_9,
      id_10,
      id_7,
      id_8,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule
