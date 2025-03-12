// Seed: 563102537
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output tri1 id_2,
    output tri0 id_3,
    input supply1 id_4,
    input wire id_5,
    input supply1 id_6,
    output tri id_7,
    output supply1 id_8,
    input wand id_9,
    input supply0 id_10,
    input tri id_11,
    output tri id_12,
    input supply1 id_13,
    output supply0 id_14,
    output uwire id_15,
    input uwire id_16,
    input wand id_17,
    output uwire id_18,
    input tri id_19,
    input tri1 id_20,
    output uwire id_21,
    input tri1 id_22,
    input wor id_23
);
  assign id_14 = -1 - id_11;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input supply0 id_2,
    output wand id_3,
    input tri1 id_4,
    output wire id_5,
    input uwire id_6,
    input supply0 id_7,
    output uwire id_8,
    input uwire id_9,
    output uwire id_10,
    output wire id_11
);
  assign id_8 = id_0;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_8,
      id_5,
      id_6,
      id_7,
      id_4,
      id_3,
      id_11,
      id_0,
      id_0,
      id_1,
      id_5,
      id_7,
      id_10,
      id_5,
      id_6,
      id_0,
      id_8,
      id_0,
      id_2,
      id_11,
      id_2,
      id_1
  );
endmodule
