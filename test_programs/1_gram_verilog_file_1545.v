// Seed: 1530492115
module module_0 (
    input tri id_0,
    input uwire id_1,
    input tri id_2,
    input wor id_3,
    input tri0 id_4,
    output tri id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    input wor id_9,
    input tri id_10,
    input tri1 id_11,
    input uwire id_12,
    input wor id_13,
    input supply1 id_14,
    output tri1 id_15,
    output tri1 id_16,
    output uwire void id_17,
    input wire id_18,
    input wor id_19
);
  assign id_15 = -1;
  assign id_16 = -1;
endmodule
module module_1 (
    output tri id_0,
    input uwire id_1,
    input wire id_2,
    output supply0 id_3,
    output wor id_4,
    output supply1 id_5,
    output tri1 id_6,
    output tri1 id_7,
    output wor id_8,
    input uwire id_9
);
  id_11(
      .id_0(id_6), .id_1(id_5), .id_2(id_7), .id_3(1)
  );
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_9,
      id_9,
      id_6,
      id_8,
      id_9,
      id_9,
      id_2,
      id_1,
      id_9,
      id_9,
      id_2,
      id_1,
      id_4,
      id_3,
      id_7,
      id_2,
      id_1
  );
  assign modCall_1.id_8 = 0;
  assign id_7 = id_9;
endmodule
