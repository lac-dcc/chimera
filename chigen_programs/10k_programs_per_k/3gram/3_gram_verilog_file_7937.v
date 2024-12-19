// Seed: 3811517111
module module_0 ();
  wire id_1;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri1 id_0,
    input tri1 id_1,
    input uwire id_2,
    output uwire id_3,
    output tri1 id_4,
    input tri id_5,
    input wor id_6,
    input tri1 id_7,
    input wor id_8,
    input tri0 id_9,
    input tri id_10,
    input tri id_11,
    input supply0 id_12,
    output wor id_13,
    input tri0 id_14,
    input supply1 id_15,
    input supply0 id_16,
    input wire id_17,
    output supply1 id_18,
    output uwire id_19,
    output tri id_20,
    input tri id_21,
    input wor id_22,
    input tri0 id_23,
    output tri id_24,
    input tri1 id_25
);
endmodule
macromodule module_3 (
    input wire id_0,
    input uwire id_1,
    output tri0 id_2,
    input tri0 id_3,
    output wand id_4,
    input tri0 id_5,
    output uwire id_6,
    input supply1 id_7,
    input wand id_8,
    input uwire id_9
);
  assign id_2 = id_5;
  module_2 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_6,
      id_6,
      id_0,
      id_7,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_2,
      id_9,
      id_3,
      id_8,
      id_3,
      id_4,
      id_2,
      id_4,
      id_0,
      id_1,
      id_0,
      id_6,
      id_9
  );
  assign modCall_1.id_8 = 0;
endmodule
