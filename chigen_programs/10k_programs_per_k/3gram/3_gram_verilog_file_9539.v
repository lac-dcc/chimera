// Seed: 3600697481
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    input wor id_3,
    output wand id_4,
    input tri0 id_5
);
  assign id_4 = 1;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wand id_4
);
  generate
    if (1) wire id_6 = id_0;
    else begin : LABEL_0
      integer id_7 (
          .id_0 (id_1),
          .id_1 (id_6),
          .id_2 (id_1),
          .id_3 (id_3),
          .id_4 (1),
          .id_5 (),
          .id_6 (1),
          .id_7 (1),
          .id_8 (id_3),
          .id_9 (1 & id_1 - id_2),
          .id_10(),
          .id_11(id_3),
          .id_12(id_6)
      );
    end
  endgenerate
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
  tri1 id_9 = 1;
endmodule
