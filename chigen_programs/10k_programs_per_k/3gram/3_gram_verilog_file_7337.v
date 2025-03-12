// Seed: 613032335
module module_0 (
    output wand id_0,
    output tri1 id_1,
    output wor id_2,
    input supply1 id_3,
    input wand id_4,
    input wor id_5,
    input supply0 id_6,
    output wand id_7,
    input tri1 id_8,
    input uwire id_9,
    input supply1 id_10,
    input tri id_11,
    input wor id_12,
    input tri0 id_13,
    output supply1 id_14,
    input wor id_15,
    input wor id_16,
    output supply1 id_17,
    input uwire id_18,
    input wor id_19,
    input tri id_20,
    output uwire id_21
);
  wire id_23;
  wire [-1 : -1] id_24;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    output tri1 id_4,
    output tri id_5,
    input wand id_6
);
  supply1 id_8 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_0,
      id_6,
      id_6,
      id_6,
      id_5,
      id_3,
      id_3,
      id_0,
      id_0,
      id_6,
      id_3,
      id_1,
      id_2,
      id_0,
      id_1,
      id_3,
      id_6,
      id_0,
      id_5
  );
  assign modCall_1.id_19 = 0;
endmodule
