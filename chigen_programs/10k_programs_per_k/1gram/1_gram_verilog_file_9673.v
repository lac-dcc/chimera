// Seed: 1523371860
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input wor id_4,
    input wire id_5,
    input wand id_6,
    output wand id_7,
    output wire id_8,
    output wand id_9
);
  assign id_9 = id_3;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    input uwire id_1,
    output tri1 id_2,
    output supply1 id_3,
    input wand id_4,
    input wor id_5
);
  id_7(
      .id_0(1), .id_1(id_0 + 1)
  );
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_1,
      id_5,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2
  );
endmodule
