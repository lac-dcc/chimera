// Seed: 2876114491
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input wand id_2,
    input supply1 id_3,
    input wor id_4,
    input tri id_5,
    output tri0 id_6,
    input wand id_7,
    input wire id_8,
    output supply0 id_9,
    input tri0 id_10,
    output wire id_11,
    input supply1 id_12
    , id_23, id_24,
    input tri1 id_13,
    output supply0 id_14,
    output tri id_15,
    output wand id_16,
    input tri id_17,
    input wor id_18,
    output uwire id_19,
    input tri0 id_20,
    output tri id_21
);
  tri id_25 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wand id_4,
    output wor id_5,
    input uwire id_6
    , id_22,
    output tri1 id_7,
    output wand id_8,
    input wand id_9,
    input uwire id_10,
    output wire id_11,
    output wand id_12,
    input tri0 id_13,
    output wand id_14,
    input tri1 id_15,
    output tri1 id_16,
    input uwire id_17,
    input wire id_18,
    output logic id_19,
    output uwire id_20
);
  initial begin : LABEL_0
    id_19 <= 1;
    id_8 = 1'b0;
    id_22 <= id_1 - id_17;
  end
  xnor primCall (
      id_16, id_6, id_3, id_9, id_17, id_4, id_15, id_10, id_2, id_1, id_13, id_22, id_18
  );
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_4,
      id_9,
      id_13,
      id_0,
      id_3,
      id_17,
      id_11,
      id_9,
      id_8,
      id_2,
      id_9,
      id_8,
      id_16,
      id_7,
      id_10,
      id_1,
      id_8,
      id_4,
      id_16
  );
  assign modCall_1.id_10 = 0;
endmodule
