// Seed: 229517001
module module_0 #(
    parameter id_17 = 32'd78,
    parameter id_18 = 32'd97
) (
    input tri id_0,
    output supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply0 module_0,
    output wand id_7,
    output uwire id_8,
    input tri0 id_9,
    input supply1 id_10,
    output wand id_11,
    output wor id_12,
    output supply0 id_13,
    input wor id_14,
    output tri id_15
);
  assign id_4 = id_10;
  defparam id_17.id_18 = 1;
endmodule
module module_1 (
    output wor id_0,
    output supply1 id_1,
    output supply1 id_2,
    output wor id_3,
    input uwire id_4,
    output tri1 id_5,
    input uwire id_6,
    output tri id_7,
    input tri id_8,
    input wor id_9,
    input tri id_10,
    input tri1 id_11,
    output tri1 id_12,
    output wor id_13,
    input supply1 id_14,
    output wor id_15,
    output tri1 id_16,
    input supply1 id_17,
    input supply0 id_18,
    output uwire id_19,
    input tri id_20,
    input supply0 id_21,
    input supply1 id_22
);
  wire id_24;
  module_0 modCall_1 (
      id_22,
      id_2,
      id_13,
      id_6,
      id_16,
      id_8,
      id_18,
      id_15,
      id_1,
      id_9,
      id_22,
      id_12,
      id_15,
      id_19,
      id_6,
      id_15
  );
  assign modCall_1.id_5 = 0;
  assign id_7 = 1 ? id_4 : 1;
endmodule
