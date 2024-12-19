// Seed: 3457351728
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    output uwire id_3,
    input wand id_4,
    input wor id_5
);
  id_7(
      .id_0(1),
      .id_1(id_5),
      .id_2(),
      .id_3(id_4),
      .id_4(id_0),
      .id_5(id_0),
      .id_6(id_4),
      .id_7(id_5 & 1),
      .id_8(1),
      .id_9(1'b0 - id_0),
      .id_10(1 == 1'b0),
      .id_11(id_3 * id_0)
  );
  wire id_8;
  assign module_1.id_2 = 0;
  wire id_9, id_10;
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    output supply1 id_6,
    input wand id_7,
    input wor id_8,
    input supply1 id_9,
    input wand id_10,
    input wire id_11,
    output wand id_12,
    input tri id_13
);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5,
      id_12,
      id_5,
      id_9
  );
endmodule
