// Seed: 2015857992
macromodule module_0 (
    input wor id_0,
    output tri1 id_1,
    output tri0 id_2,
    output supply0 id_3
    , id_8,
    input tri0 id_4,
    input wand id_5,
    input wire id_6
);
  wire id_9;
  id_10(
      .id_0(),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(1 ? 1 : 1),
      .id_5(id_8),
      .id_6(1),
      .id_7(1),
      .id_8(1),
      .id_9(id_6),
      .id_10((1)),
      .id_11(1),
      .id_12(id_0),
      .id_13(1 - 1)
  );
  assign id_3 = 1;
  always @(negedge 1);
  always @(1 or posedge id_0);
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wor id_4,
    input tri1 id_5,
    input supply1 id_6
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_1,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
