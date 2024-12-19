// Seed: 237685304
module module_0 (
    output wand  id_0,
    output tri   id_1,
    input  tri0  id_2,
    output uwire id_3,
    input  tri0  id_4,
    output wor   id_5,
    output tri0  id_6,
    output uwire id_7,
    input  tri0  id_8,
    output wire  id_9
);
  wire id_11 = !id_8;
  wire id_12;
endmodule
module module_1 (
    input wor id_0,
    inout wand id_1,
    input supply1 id_2,
    input wor id_3,
    input supply1 id_4,
    input tri0 id_5
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_9 = 0;
  id_7(
      .id_0(1), .id_1(id_1)
  );
endmodule
