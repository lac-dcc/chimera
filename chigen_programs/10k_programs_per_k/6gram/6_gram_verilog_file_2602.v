// Seed: 3440778801
module module_0 (
    input wand id_0,
    input supply0 id_1,
    output supply1 id_2,
    input supply1 id_3,
    input tri id_4,
    output wor id_5,
    output supply1 id_6,
    input supply0 id_7,
    input wor id_8,
    output wire id_9,
    input wand id_10,
    input tri id_11,
    inout uwire id_12,
    input uwire id_13,
    output wor id_14,
    output tri1 id_15,
    input tri id_16,
    output wand id_17
);
  id_19(
      .id_0(id_12),
      .id_1(),
      .id_2(id_14),
      .id_3(id_10),
      .id_4(1),
      .id_5(id_10 == 1),
      .id_6(1),
      .id_7(1),
      .id_8(id_4)
  );
endmodule
module module_1 (
    output logic   id_0,
    input  supply1 id_1,
    output supply0 id_2
);
  always @(posedge 1'b0 & id_1 / 1) if (id_1) id_0 <= id_1 & 1 && 1;
  tri0 id_4 = id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_2,
      id_1,
      id_1,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_2
  );
  assign modCall_1.type_1 = 0;
endmodule
