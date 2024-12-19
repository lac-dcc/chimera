// Seed: 3645032358
module module_0 (
    output wire id_0,
    output wand id_1,
    output tri id_2,
    output wand id_3,
    output supply1 id_4,
    input wand id_5,
    input tri id_6,
    output tri1 id_7
);
  always disable id_9;
  wire id_10;
endmodule
module module_1 (
    output tri id_0,
    output tri id_1,
    output supply0 id_2,
    input uwire id_3,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    output supply1 id_7,
    output wire id_8,
    output wire id_9,
    input tri1 id_10,
    input supply1 id_11,
    output tri1 id_12,
    input tri id_13,
    input wand id_14,
    output supply0 id_15,
    output wand id_16,
    input wor id_17,
    input uwire id_18,
    input uwire id_19,
    output tri id_20,
    input wand id_21,
    input wire id_22,
    output wor id_23
);
  id_25(
      id_20 == id_22, id_4, id_11
  );
  nor primCall (
      id_0, id_22, id_25, id_10, id_19, id_18, id_6, id_3, id_14, id_13, id_5, id_11, id_4, id_21
  );
  module_0 modCall_1 (
      id_20,
      id_9,
      id_12,
      id_8,
      id_2,
      id_18,
      id_3,
      id_0
  );
  assign modCall_1.type_2 = 0;
endmodule
