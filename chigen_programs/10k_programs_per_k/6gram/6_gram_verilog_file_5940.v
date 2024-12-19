// Seed: 126161271
module module_0 (
    output tri1 id_0,
    output tri1 id_1,
    output wor id_2,
    input supply0 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output wor id_6,
    output wand id_7,
    output tri0 id_8,
    output wand id_9
);
  wand id_11;
  assign module_1.id_2 = 0;
  assign id_1 = id_5;
  wire id_12;
  wire id_13;
  assign id_11 = id_3;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    output uwire id_3,
    output uwire id_4
);
  uwire id_6 = 1;
  id_7(
      .id_0(id_0),
      .id_1(id_6),
      .id_2(1'b0 - 1),
      .id_3(id_4),
      .id_4(id_2),
      .id_5(),
      .id_6(1),
      .id_7(id_6)
  );
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_2,
      id_2,
      id_2,
      id_4,
      id_0,
      id_0,
      id_4
  );
endmodule
