// Seed: 2014398333
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input wor id_2,
    input tri0 id_3,
    input wand id_4,
    input tri1 id_5
);
  if (1) begin : LABEL_0
    genvar id_7;
  end
endmodule
module module_1 (
    output wor id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri1 id_3,
    output uwire id_4,
    output wor id_5,
    input supply1 id_6,
    output tri1 id_7,
    input tri id_8,
    input tri id_9,
    input tri id_10,
    output wor id_11,
    output tri0 id_12
);
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_9,
      id_9
  );
  assign modCall_1.id_2 = 0;
endmodule
