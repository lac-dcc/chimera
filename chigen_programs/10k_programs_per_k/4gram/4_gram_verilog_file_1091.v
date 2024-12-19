// Seed: 3497154628
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    output tri id_3,
    output wand id_4,
    output supply1 id_5,
    input wand id_6,
    input wire id_7,
    input supply1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input wand id_11,
    input supply1 id_12,
    input supply0 id_13,
    input wor id_14,
    input wire id_15,
    input wand id_16,
    input tri id_17,
    output wand id_18
);
  wire id_20;
  assign id_9 = 1'b0;
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    output tri1 id_2,
    input tri id_3,
    output logic id_4,
    output supply0 id_5,
    input tri id_6,
    output wor id_7,
    input wire id_8,
    output uwire id_9,
    input uwire id_10,
    output uwire id_11,
    input supply1 id_12,
    input tri1 id_13,
    input supply0 id_14
);
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14,
      id_5,
      id_1,
      id_1,
      id_8,
      id_12,
      id_14,
      id_11,
      id_12,
      id_8,
      id_6,
      id_10,
      id_3,
      id_14,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_17 = 0;
  always_comb @(1) id_4 <= 1;
endmodule
