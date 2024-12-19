// Seed: 650599105
module module_0 (
    output supply1 id_0,
    input  supply0 id_1,
    input  supply1 id_2
);
  always force id_0 = id_1 < 1'b0;
  if (id_2) begin : LABEL_0
    id_4(
        1, 1, 1
    );
    wand id_5 = id_2;
    initial id_0 = id_2;
    wire id_6;
  end else begin : LABEL_0
    id_7(
        .id_0(id_0), .id_1(id_0), .id_2(1)
    );
  end
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input tri id_6,
    input tri0 id_7,
    output supply0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    output supply1 id_11
    , id_15,
    input tri1 id_12
    , id_16,
    output supply1 id_13
);
  module_0 modCall_1 (
      id_0,
      id_10,
      id_2
  );
  assign modCall_1.type_11 = 0;
  wire id_17;
  id_18(
      .id_0(1),
      .id_1(1 === id_13),
      .id_2(id_2),
      .id_3(id_5),
      .id_4(id_12),
      .id_5(),
      .id_6(id_16),
      .id_7(id_17),
      .id_8((1)),
      .id_9(""),
      .id_10(id_15),
      .id_11(id_2),
      .id_12(id_8 != 1)
  );
endmodule
