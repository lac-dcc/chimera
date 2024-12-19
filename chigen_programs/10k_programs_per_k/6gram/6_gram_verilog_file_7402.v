// Seed: 2542885870
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    output wire id_2,
    input wand id_3,
    input wor id_4,
    input tri id_5,
    output tri0 id_6,
    input tri id_7,
    output wor id_8,
    output supply1 id_9,
    input wand id_10,
    input wire id_11,
    input uwire id_12,
    input tri0 id_13,
    input tri0 id_14,
    output supply1 id_15,
    input wor id_16,
    output wire id_17,
    output wand id_18
    , id_25,
    input tri id_19,
    output tri0 id_20,
    output tri1 id_21,
    input wor id_22,
    output tri id_23
);
endmodule
module module_1 (
    output uwire id_0,
    output tri1  id_1,
    output wor   id_2,
    input  wor   id_3,
    input  tri1  id_4,
    output tri1  id_5
);
  generate
    for (id_7 = 1; id_7; id_7 = !id_7 < id_7) begin : LABEL_0
      assign id_0 = 1;
    end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_3,
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_1,
      id_3,
      id_5,
      id_2,
      id_3,
      id_1,
      id_5,
      id_3,
      id_2
  );
endmodule
