// Seed: 1120929622
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    output tri1 id_2,
    input wor id_3,
    output tri id_4,
    input wire id_5,
    output uwire id_6
);
  id_8(
      .id_0(1)
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1,
    output wand id_2,
    input wor id_3
);
  id_5(
      .id_0(id_0), .id_1(1), .id_2(id_3), .id_3(~id_3), .id_4(), .id_5(id_0)
  );
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2
  );
endmodule
