// Seed: 1966859976
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    input tri id_4,
    output wor id_5,
    input tri1 id_6,
    input supply1 id_7,
    input supply0 id_8,
    output wor id_9,
    input wire id_10,
    input wand id_11,
    input tri id_12,
    input uwire id_13,
    output uwire id_14,
    input wor id_15,
    output tri id_16,
    input wand id_17,
    input supply1 id_18,
    input wand id_19
);
  id_21(
      .id_0(1), .id_1(id_11), .id_2(1), .id_3(1 - id_10), .id_4(), .id_5(id_6)
  );
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output uwire id_1,
    output wor id_2,
    input supply1 id_3,
    output wor id_4,
    output supply1 id_5,
    input uwire id_6,
    input tri id_7,
    output supply1 id_8,
    output supply0 id_9,
    input uwire id_10
);
  id_12(
      .id_0(id_5),
      .id_1(id_9 <= 1),
      .id_2(id_3),
      .id_3(1),
      .id_4(id_1 - 1),
      .id_5(id_10 == id_0 < id_3)
  );
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_6,
      id_6,
      id_5,
      id_3,
      id_7,
      id_6,
      id_8,
      id_0,
      id_10,
      id_3,
      id_7,
      id_5,
      id_0,
      id_5,
      id_0,
      id_0,
      id_10
  );
endmodule
