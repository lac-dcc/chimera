// Seed: 1548512812
module module_0;
  reg id_1, id_2;
  always id_1 <= 1;
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    input wand id_2,
    output wor id_3,
    output wor id_4,
    output uwire id_5,
    input uwire id_6,
    input uwire id_7,
    input uwire id_8,
    output wire id_9,
    input wor id_10,
    input supply0 id_11,
    input supply1 id_12,
    output wand id_13,
    input supply1 id_14,
    input supply0 id_15,
    input supply1 id_16
);
  wire id_18;
  nor primCall (id_1, id_10, id_11, id_12, id_14, id_15, id_16, id_18, id_2, id_6, id_7, id_8);
  module_0 modCall_1 ();
  assign modCall_1.type_3 = 0;
endmodule
