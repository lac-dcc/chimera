// Seed: 1300707503
module module_0 (
    output tri id_0,
    input wand id_1,
    input tri id_2,
    output wand id_3,
    input tri0 id_4,
    output supply1 id_5,
    output wor id_6,
    output wor id_7,
    input uwire id_8,
    input supply0 id_9,
    input wor id_10,
    output wand id_11,
    input supply0 id_12,
    output supply1 id_13,
    input wand id_14,
    input wand id_15,
    input supply0 id_16
);
  initial begin : LABEL_0
    if (1'b0) assume (-1'b0);
  end
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    input supply0 id_2
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule
