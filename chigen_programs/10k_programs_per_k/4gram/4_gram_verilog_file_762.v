// Seed: 841569939
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wor id_3,
    output tri0 id_4,
    input wire id_5,
    output wand id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output wand id_10,
    input wor id_11,
    input tri0 id_12,
    output wire id_13,
    output supply0 id_14,
    input tri id_15,
    output tri1 id_16,
    output uwire id_17,
    output supply0 id_18,
    input supply1 id_19,
    input tri1 id_20,
    output wor id_21,
    output wand id_22,
    input tri1 id_23,
    input wand id_24,
    input uwire id_25,
    input tri1 id_26
);
  assign id_14 = 1;
  wire id_28 = id_0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input supply0 id_3,
    output wor id_4,
    input wand id_5,
    output supply1 id_6,
    input uwire id_7,
    input supply1 id_8,
    output tri id_9,
    output supply1 id_10,
    input uwire id_11
);
  assign id_10 = id_2;
  and (id_0, id_8, id_7, id_5, id_3, id_2);
  module_0(
      id_5,
      id_3,
      id_8,
      id_5,
      id_6,
      id_5,
      id_4,
      id_7,
      id_11,
      id_8,
      id_0,
      id_1,
      id_5,
      id_0,
      id_10,
      id_5,
      id_6,
      id_0,
      id_0,
      id_3,
      id_2,
      id_0,
      id_4,
      id_1,
      id_7,
      id_5,
      id_11
  );
endmodule
