// Seed: 542487035
module module_0 (
    output supply1 id_0,
    input wor id_1,
    input wire id_2,
    input tri1 id_3,
    input tri1 id_4,
    output supply0 id_5,
    input tri1 id_6,
    input wor id_7,
    input wor id_8,
    input uwire id_9,
    input supply0 id_10,
    output tri0 id_11,
    output tri0 id_12
);
  timeprecision 1ps;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wor id_5,
    input tri id_6,
    input tri0 id_7,
    input wire id_8,
    input supply0 id_9,
    input tri0 id_10,
    input wire id_11,
    input supply1 id_12,
    output tri1 id_13,
    output tri id_14,
    output wand id_15,
    output wor id_16,
    input tri1 id_17,
    output wand id_18,
    output tri id_19
);
  wor id_21 = id_1;
  module_0 modCall_1 (
      id_21,
      id_1,
      id_7,
      id_8,
      id_3,
      id_18,
      id_6,
      id_12,
      id_3,
      id_2,
      id_12,
      id_15,
      id_13
  );
  assign modCall_1.id_1 = 0;
endmodule
