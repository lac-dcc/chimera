// Seed: 1070494666
macromodule module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    output supply0 id_3,
    output wor id_4,
    input wire id_5,
    output supply1 id_6,
    input wor id_7,
    output wire id_8
);
  assign id_0 = id_1;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    input wire id_2,
    input supply0 id_3,
    output supply0 id_4,
    input supply0 id_5,
    input uwire id_6,
    input wand id_7,
    inout wand id_8,
    output wire id_9,
    output wand id_10
    , id_19,
    output tri id_11,
    input tri0 id_12,
    input wor id_13,
    input supply0 id_14,
    output supply1 id_15,
    input supply0 id_16,
    input tri0 id_17
);
  always begin : LABEL_0
    id_9 = 1;
  end
  module_0 modCall_1 (
      id_4,
      id_13,
      id_6,
      id_9,
      id_4,
      id_3,
      id_4,
      id_14,
      id_15
  );
  assign modCall_1.id_4 = 0;
  always id_8 = (id_12);
endmodule
