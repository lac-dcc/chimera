// Seed: 619632475
module module_0 (
    output tri id_0,
    output wor id_1,
    output tri id_2,
    output supply0 id_3,
    output uwire id_4,
    input wand id_5,
    input supply0 id_6
);
  assign id_4 = 1;
  assign id_0 = id_6;
  wire id_8, id_9, id_10, id_11;
  wire id_12;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri1  id_1,
    output tri0  id_2,
    input  uwire id_3,
    input  wire  id_4
);
  assign id_2 = 1'b0;
  wire id_6;
  id_7(
      .id_0(id_0 == id_1),
      .id_1(id_2),
      .id_2(1),
      .id_3(),
      .id_4(1),
      .id_5(id_1),
      .id_6(1),
      .id_7(~id_2)
  );
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_4
  );
endmodule
