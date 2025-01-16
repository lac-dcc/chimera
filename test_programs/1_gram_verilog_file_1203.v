// Seed: 1418972695
macromodule module_0 (
    input wand id_0,
    input supply0 id_1,
    input wor id_2,
    output wor id_3,
    input tri id_4,
    output uwire id_5,
    input supply0 id_6,
    input supply0 id_7,
    output wand id_8,
    output supply1 id_9,
    input tri1 id_10,
    input uwire id_11,
    input wand id_12,
    output tri1 id_13,
    output wor id_14
);
  wire id_16;
  wire id_17;
  wire id_18;
  wire id_19, id_20;
  assign id_9 = id_7;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    output wor id_4,
    input wire id_5,
    output wand id_6,
    output tri id_7,
    input supply0 id_8,
    output supply1 id_9,
    input tri id_10
);
  assign id_7 = id_2;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_9,
      id_8,
      id_6,
      id_10,
      id_8,
      id_9,
      id_6,
      id_10,
      id_8,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_14 = 0;
  assign id_6 = 1;
endmodule
