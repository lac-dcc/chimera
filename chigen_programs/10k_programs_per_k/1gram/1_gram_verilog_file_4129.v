// Seed: 3500941727
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output wand id_2,
    output supply1 id_3,
    input supply0 id_4,
    output wor id_5,
    input wire id_6,
    output supply1 id_7,
    input tri id_8,
    input wor id_9,
    output tri1 id_10
);
  tri id_12, id_13;
  final #1 id_10 = id_6;
  wire id_14, id_15;
  assign id_5  = id_8;
  assign id_12 = id_8 & 1 + 1;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input uwire id_2,
    output uwire id_3,
    input uwire id_4
);
  id_6(
      .id_0(id_1),
      .id_1(1 ? 1 : id_3),
      .id_2(id_2),
      .id_3(),
      .id_4(id_2),
      .id_5(id_2),
      .id_6(({""{id_1}}) - 1'b0),
      .id_7(id_4 && 1),
      .id_8(1 - id_0)
  );
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_3,
      id_2,
      id_3,
      id_4,
      id_3,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
