// Seed: 749580049
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    input uwire id_3,
    output tri0 id_4,
    input wor id_5,
    output wand id_6,
    output supply0 id_7,
    output wand id_8,
    input tri id_9,
    output tri1 id_10
);
  wire id_12;
  id_13(
      .id_0(1),
      .id_1(1'b0),
      .id_2(1),
      .id_3(id_5),
      .id_4(1),
      .id_5(id_2),
      .id_6((1) == id_2),
      .id_7(id_5)
  );
endmodule
module module_1 (
    input  wire  id_0,
    output wand  id_1,
    output tri0  id_2,
    output uwire id_3
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.type_15 = 0;
endmodule
