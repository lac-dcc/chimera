// Seed: 3426941693
macromodule module_0 (
    output wire id_0,
    input uwire id_1,
    input tri1 id_2,
    input supply1 id_3,
    output wand id_4,
    input tri id_5,
    output uwire id_6,
    output supply1 id_7,
    input wand id_8,
    input supply0 id_9,
    input supply1 id_10,
    output wire id_11,
    output supply1 id_12,
    output supply0 id_13,
    input wor id_14
);
  wire id_16, id_17;
  assign module_1.type_12 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input tri1 id_2,
    id_9,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply1 id_7
);
  assign id_4 = id_1;
  wire id_10;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_1,
      id_1,
      id_4,
      id_5,
      id_7,
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_4,
      id_5
  );
  assign id_4 = 1;
endmodule
