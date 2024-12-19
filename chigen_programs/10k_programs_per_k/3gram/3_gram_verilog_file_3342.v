// Seed: 1967345064
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri1 id_5,
    output uwire id_6,
    output supply1 id_7,
    output supply0 id_8,
    output uwire id_9,
    input tri id_10,
    input wor id_11,
    output wand id_12,
    input supply0 id_13,
    output wor id_14,
    output wand id_15,
    output supply1 id_16,
    output tri1 id_17,
    input tri0 id_18,
    output supply0 id_19,
    input wire id_20,
    input tri1 id_21,
    input wand id_22,
    input uwire id_23,
    output wor id_24
);
  assign module_1.type_0 = 0;
  wire id_26;
  tri0 id_27 = 1;
endmodule
module module_1 (
    input wire id_0,
    output supply1 id_1,
    input tri1 id_2,
    output wand id_3
);
  not primCall (id_3, id_0);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_0,
      id_1,
      id_2,
      id_3,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_0,
      id_2,
      id_0,
      id_0,
      id_3
  );
endmodule
