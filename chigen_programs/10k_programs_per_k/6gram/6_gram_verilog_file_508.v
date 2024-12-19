// Seed: 2374270255
module module_0 (
    output wand id_0,
    input wor id_1,
    input wor id_2,
    output supply0 id_3,
    output tri0 id_4,
    input supply0 id_5,
    output wand id_6,
    input tri0 id_7,
    output tri0 id_8,
    input wand id_9,
    input tri1 id_10,
    output tri1 id_11,
    output wor id_12,
    output wand id_13,
    input supply0 id_14,
    input tri id_15,
    output tri0 id_16,
    input supply0 id_17,
    output supply1 id_18
);
  id_20(
      .id_0(id_2),
      .id_1(),
      .id_2(id_14),
      .id_3(id_5),
      .id_4(1),
      .id_5(id_0 - 1),
      .id_6(1),
      .id_7(id_12),
      .id_8(id_17),
      .id_9(),
      .id_10(id_8)
  );
  assign id_18 = id_2;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    output tri0 id_2,
    input uwire id_3,
    output uwire id_4,
    input supply0 id_5,
    input wire id_6,
    output tri0 id_7,
    input wor id_8,
    output wand id_9,
    output uwire id_10,
    input supply1 id_11
);
  always @(posedge id_8 == 1 + {id_5{id_3 - 1}}) #1;
  module_0 modCall_1 (
      id_10,
      id_0,
      id_8,
      id_10,
      id_2,
      id_5,
      id_4,
      id_3,
      id_10,
      id_0,
      id_0,
      id_10,
      id_2,
      id_7,
      id_3,
      id_0,
      id_10,
      id_8,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
