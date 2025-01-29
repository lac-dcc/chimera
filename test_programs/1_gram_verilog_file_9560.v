// Seed: 4226615354
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input tri id_2,
    output tri1 id_3,
    input supply1 id_4,
    output wor id_5,
    input tri1 id_6,
    input wand id_7,
    input tri id_8,
    input supply0 id_9,
    input tri0 id_10,
    input tri1 id_11,
    output uwire id_12
);
  parameter id_14 = 1;
  wire id_15;
  id_16(
      .id_0(id_0),
      .id_1(id_3),
      .id_2(id_2),
      .id_3(id_4),
      .id_4(1),
      .id_5(-1 ==? id_7),
      .id_6(id_12),
      .id_7(1),
      .id_8(id_10),
      .id_9(id_11),
      .id_10(),
      .id_11(1)
  );
endmodule
module module_1 (
    output wire id_0,
    input uwire id_1,
    input uwire id_2,
    output uwire id_3,
    input supply1 id_4,
    input tri1 id_5,
    output supply1 id_6
);
  assign id_0 = 1'b0;
  wire id_8;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_0,
      id_4,
      id_6,
      id_5,
      id_5,
      id_4,
      id_5,
      id_4,
      id_5,
      id_6
  );
  assign modCall_1.id_9 = 0;
endmodule
