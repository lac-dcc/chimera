// Seed: 4282003235
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input wor id_2,
    input uwire id_3,
    output wand id_4,
    input tri id_5,
    input wand id_6,
    output tri1 id_7,
    input wand id_8,
    input wor id_9,
    input supply0 id_10,
    output supply0 id_11,
    input supply1 id_12,
    input supply0 id_13,
    output wor id_14,
    output wor id_15,
    output uwire id_16,
    input wor id_17
);
  always @(posedge 1)
    if (id_1 & id_9) begin : LABEL_0
      release id_11;
    end
endmodule
module module_1 (
    output wand id_0,
    output tri1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri id_4,
    output tri id_5,
    output supply1 id_6,
    output supply0 id_7,
    input uwire id_8,
    output uwire id_9
);
  assign id_0 = id_2.id_3;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_8,
      id_3,
      id_5,
      id_8,
      id_2,
      id_1,
      id_2,
      id_3,
      id_8,
      id_0,
      id_3,
      id_3,
      id_9,
      id_7,
      id_6,
      id_3
  );
  assign modCall_1.id_13 = 0;
endmodule
