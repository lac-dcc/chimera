// Seed: 3533276828
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wor id_4,
    output wire id_5,
    input tri1 id_6,
    output tri id_7,
    input supply0 id_8,
    input tri1 id_9,
    output wand id_10,
    input tri0 id_11,
    input wand id_12
);
  wire id_14;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    input uwire id_2,
    input supply1 id_3,
    input wor id_4,
    input tri id_5,
    input wor id_6,
    input tri id_7,
    output tri1 id_8,
    input tri1 id_9,
    input wor id_10,
    input supply1 id_11,
    output wor id_12,
    input tri1 id_13,
    input wor id_14
);
  assign id_0 = id_10;
  assign id_8 = id_3;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_4,
      id_9,
      id_0,
      id_7,
      id_8,
      id_1,
      id_5,
      id_0,
      id_7,
      id_7
  );
  assign modCall_1.id_10 = 0;
  id_16(
      .id_0(id_10),
      .id_1(1'h0),
      .id_2(1),
      .id_3("" - id_4 + id_1),
      .id_4(1),
      .id_5(id_1 & 1'b0 & 1),
      .product(id_14)
  );
endmodule
