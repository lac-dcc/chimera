// Seed: 1553550260
macromodule module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input uwire id_2,
    input supply0 id_3,
    output tri1 id_4,
    input tri id_5,
    input tri0 id_6,
    input tri1 id_7,
    output wor id_8,
    input wor id_9,
    input wor id_10,
    input wand id_11,
    input tri0 id_12,
    output tri id_13,
    input tri1 id_14,
    input wor id_15,
    input wor id_16,
    output tri0 id_17,
    output wire id_18,
    output tri0 id_19,
    input supply0 id_20
);
  assign #1 id_19 = id_1;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input tri id_2,
    input wand id_3
);
  wire id_5, id_6;
  module_0(
      id_1,
      id_2,
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_3
  );
endmodule
