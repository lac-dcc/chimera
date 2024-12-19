// Seed: 725225845
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input wor id_4,
    output wor id_5,
    input supply0 id_6,
    input wor id_7,
    input tri1 id_8,
    output tri id_9,
    input tri1 id_10,
    output tri1 id_11,
    input supply1 id_12,
    output uwire id_13,
    output tri1 id_14,
    output supply1 id_15,
    output tri1 id_16,
    output wor id_17
);
  wire id_19;
  assign module_1.type_20 = 0;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    input wand id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wand id_5,
    input uwire id_6,
    input wand id_7,
    output logic id_8,
    input uwire id_9,
    input uwire id_10,
    output wor id_11,
    input tri id_12,
    input wor id_13
);
  always id_8 <= 1'b0;
  xor primCall (id_11, id_7, id_6, id_2, id_9, id_12, id_4, id_10);
  module_0 modCall_1 (
      id_3,
      id_10,
      id_6,
      id_9,
      id_5,
      id_11,
      id_6,
      id_13,
      id_4,
      id_11,
      id_10,
      id_11,
      id_4,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
endmodule
