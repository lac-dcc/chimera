// Seed: 1087366785
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    input wor id_3,
    input supply1 id_4
    , id_13,
    input wand id_5,
    input wor id_6,
    input wor id_7,
    input tri0 id_8,
    output wire id_9,
    output wire id_10,
    output wire id_11
);
  wire id_14;
  wire id_15, id_16;
  wire id_17;
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    output tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input tri id_7,
    output wand id_8,
    input supply1 id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_5,
      id_0,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.id_7 = 0;
  for (id_11 = 1; 1; id_3 = id_6) begin : LABEL_0
    assign id_2 = id_7;
  end
endmodule
