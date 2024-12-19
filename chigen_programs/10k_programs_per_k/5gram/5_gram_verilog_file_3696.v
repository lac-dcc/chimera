// Seed: 1462154555
module module_0 (
    input tri1 id_0,
    output wire id_1,
    input wor id_2,
    output tri id_3,
    output tri0 id_4,
    output wor id_5,
    output tri id_6,
    input tri id_7,
    output tri1 id_8,
    input wor id_9,
    input supply0 id_10,
    output wand id_11,
    output wor id_12,
    input tri1 id_13,
    input tri1 id_14,
    input wand id_15,
    output tri0 id_16
);
  wire id_18;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    input wor id_2,
    output wor id_3,
    input wand id_4,
    output uwire id_5,
    inout supply1 id_6,
    output tri0 id_7,
    output wor id_8,
    input tri0 id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_7,
      id_5,
      id_6,
      id_7,
      id_1,
      id_8,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_9,
      id_4,
      id_8
  );
  assign modCall_1.id_1 = 0;
  assign id_3 = id_4;
  id_11(
      .id_0(id_9), .id_1(id_7), .id_2(id_3), .id_3(1), .id_4(1'b0)
  );
endmodule
