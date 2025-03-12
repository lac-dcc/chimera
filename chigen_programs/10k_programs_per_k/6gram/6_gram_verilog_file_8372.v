// Seed: 1470950213
module module_0 (
    output wire id_0,
    input wor id_1,
    output tri0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output tri1 id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri0 id_8,
    output tri id_9,
    input tri id_10,
    input supply0 id_11,
    input uwire id_12,
    input tri id_13,
    input uwire id_14,
    output wor id_15,
    input tri1 id_16,
    input uwire id_17,
    input supply1 id_18,
    output supply0 id_19
);
  assign id_19 = -1;
  wor id_21, id_22;
  assign id_21 = 1'b0;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    output wire id_2,
    output tri0 id_3,
    output uwire id_4,
    output uwire id_5,
    input supply0 id_6,
    input wire id_7,
    input wand id_8,
    output supply1 id_9
);
  assign id_4 = id_7 ? 1 : -1'b0;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_1,
      id_6,
      id_3,
      id_2,
      id_1,
      id_1,
      id_9,
      id_1,
      id_0,
      id_6,
      id_1,
      id_6,
      id_4,
      id_8,
      id_6,
      id_8,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
