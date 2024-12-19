// Seed: 933356276
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wor id_2,
    input wire id_3,
    output supply0 id_4,
    output tri0 id_5,
    input supply0 id_6,
    output supply1 id_7,
    input supply1 id_8
);
  integer id_10 (
      .id_0 ((1)),
      .id_1 (id_5),
      .id_2 (id_6),
      .id_3 (1),
      .id_4 (-id_6),
      .id_5 (id_3),
      .id_6 (),
      .id_7 (id_5),
      .id_8 (id_3),
      .id_9 (id_6),
      .id_10(id_3)
  );
  assign id_5 = ~id_3;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1
    , id_11,
    output wor id_2,
    output uwire id_3
    , id_12,
    input supply0 id_4,
    output logic id_5
    , id_13,
    input tri id_6,
    input tri id_7,
    input wand id_8,
    output wand id_9
);
  reg id_14, id_15;
  assign id_15 = id_13;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_4,
      id_9,
      id_2,
      id_7,
      id_2,
      id_1
  );
  assign modCall_1.id_6 = 0;
  always_comb @(*) begin : LABEL_0
    id_5 <= id_14;
  end
  id_16(
      .id_0(id_9), .id_1(1), .id_2(1), .id_3(id_15), .id_4(1), .id_5(1), .id_6((1))
  );
endmodule
