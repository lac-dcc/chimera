// Seed: 4047727524
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wand id_4,
    input wor id_5,
    output tri0 id_6,
    output tri1 id_7,
    output wor id_8,
    input tri0 id_9,
    output wire id_10,
    output wand id_11,
    input tri0 id_12,
    input supply0 id_13
);
  assign id_7 = "" & id_1 & 1;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    input wor id_3,
    input supply0 id_4,
    input uwire id_5,
    input wand id_6,
    input supply0 id_7,
    output tri1 id_8,
    input supply1 id_9,
    output tri1 id_10,
    input uwire id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_1,
      id_5,
      id_11,
      id_9,
      id_10,
      id_10,
      id_10,
      id_5,
      id_10,
      id_10,
      id_6,
      id_5
  );
  assign modCall_1.type_18 = 0;
  for (id_14 = id_1; id_2; id_14 = -1) begin : LABEL_0
    assign id_10 = -1 ? 1 : 1;
  end
endmodule
