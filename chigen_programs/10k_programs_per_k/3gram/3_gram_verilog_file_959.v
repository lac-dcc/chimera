// Seed: 2611979656
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wire id_3,
    output wire id_4,
    input wor id_5,
    output wire id_6,
    output wor id_7,
    output wand id_8,
    input tri1 id_9,
    output tri1 id_10,
    output wand id_11,
    input wor id_12,
    input supply0 id_13,
    input wand id_14
);
  assign id_4 = 1;
  wire id_16;
  wire id_17, id_18;
  wire id_19, id_20;
  initial begin : LABEL_0
    id_16 = id_16;
  end
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    output supply1 id_2
);
  assign id_2 = id_1 - 1 < 1 & 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_11 = 0;
  tri0 id_4, id_5;
  id_6(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(""),
      .id_4(id_1 | id_1 === id_4 | 1),
      .id_5(1),
      .id_6(id_1)
  );
endmodule
