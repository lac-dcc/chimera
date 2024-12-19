// Seed: 1344916519
module module_0 (
    input wor id_0,
    input tri id_1,
    input supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    input wand id_5,
    input wire id_6,
    output wand id_7,
    output tri id_8,
    input supply0 id_9,
    output supply1 id_10,
    output wand id_11,
    input supply1 id_12,
    input supply0 id_13,
    input wor id_14,
    input wire id_15,
    input wand id_16,
    output tri id_17,
    input tri1 id_18
);
  wire id_20;
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    output wand id_2,
    output wand id_3,
    output wor id_4#(
        .id_7(1),
        .id_8(id_8)
    ),
    input tri id_5
);
  always begin : LABEL_0
    id_3 = id_5;
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_0,
      id_3,
      id_5,
      id_5,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_5,
      id_0,
      id_0,
      id_5,
      id_0,
      id_3,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
