// Seed: 2114889573
module module_0 (
    input wand id_0,
    input uwire id_1,
    input wand id_2,
    output wand id_3,
    input tri1 id_4,
    input tri1 id_5,
    input wor id_6,
    input supply1 id_7,
    input tri id_8,
    output supply0 id_9,
    input wor id_10,
    output tri1 id_11,
    input uwire id_12,
    output tri1 id_13,
    output tri id_14,
    input uwire id_15,
    input tri id_16,
    input supply1 id_17,
    input wand id_18,
    input tri1 id_19,
    output supply1 id_20,
    input supply1 id_21,
    input wire id_22,
    output wand id_23,
    input supply1 id_24,
    input tri id_25,
    output supply1 id_26,
    input uwire id_27,
    input uwire id_28,
    input supply0 id_29,
    output tri1 id_30,
    output wor id_31
);
  wire id_33;
endmodule
macromodule module_1 (
    output wand id_0,
    input wand id_1,
    input uwire id_2,
    output tri1 id_3,
    output supply1 id_4,
    output logic id_5,
    input uwire id_6,
    inout wire id_7,
    output wire id_8,
    output wand id_9,
    output tri0 id_10
);
  always begin : LABEL_0
    id_5 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_7,
      id_1,
      id_6,
      id_6,
      id_1,
      id_10,
      id_1,
      id_8,
      id_6,
      id_3,
      id_4,
      id_6,
      id_7,
      id_7,
      id_2,
      id_1,
      id_10,
      id_2,
      id_1,
      id_3,
      id_6,
      id_6,
      id_0,
      id_2,
      id_2,
      id_2,
      id_3,
      id_0
  );
  assign modCall_1.id_26 = 0;
endmodule
