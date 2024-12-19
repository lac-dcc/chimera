// Seed: 4066478828
module module_0 (
    input wire id_0
);
  supply0 id_2;
  wor id_3;
  wire id_4;
  always begin : LABEL_0
    id_2 = 1;
  end
  always_comb begin : LABEL_0
    id_3 = (id_0);
    id_3 = 1;
  end
endmodule
macromodule module_1 (
    input tri0 id_0,
    output supply0 id_1,
    output wand id_2,
    input wire id_3,
    input wire id_4,
    input tri0 id_5,
    output tri1 id_6,
    output tri1 id_7,
    input wor id_8,
    input tri0 id_9,
    output supply1 id_10,
    output tri id_11,
    input tri0 id_12,
    input wor id_13,
    input supply0 id_14
);
  tri0 id_16 = id_14;
  assign id_2 = id_3;
  assign id_2 = id_0;
  generate
    assign id_7 = id_8 - id_14;
  endgenerate
  module_0 modCall_1 (id_16);
  assign modCall_1.id_2 = 0;
endmodule
