// Seed: 764391048
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    output tri id_2,
    input tri0 id_3,
    input wand id_4
);
endmodule
module module_1 (
    output supply0 id_0,
    output wand id_1,
    inout uwire id_2,
    input tri id_3,
    input tri id_4,
    input tri1 id_5,
    input wire id_6,
    input tri id_7,
    input supply1 id_8,
    output supply1 id_9,
    input wor id_10,
    output tri0 id_11,
    input wor id_12,
    output wor id_13,
    input tri id_14,
    input supply1 id_15,
    input tri id_16,
    input supply1 id_17,
    input supply0 id_18,
    input tri1 id_19
);
  parameter id_21 = 1 + 1;
  xnor primCall (
      id_0,
      id_2,
      id_4,
      id_8,
      id_12,
      id_17,
      id_16,
      id_6,
      id_5,
      id_10,
      id_7,
      id_21,
      id_14,
      id_18,
      id_15
  );
  module_0 modCall_1 (
      id_19,
      id_15,
      id_0,
      id_8,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
