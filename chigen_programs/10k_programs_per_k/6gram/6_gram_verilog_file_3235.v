// Seed: 2514159254
module module_0 (
    input tri id_0,
    input wire id_1,
    input wire id_2,
    output wire id_3,
    input wand id_4,
    output tri0 id_5,
    output wor id_6,
    input supply1 id_7,
    output supply1 id_8
);
  assign id_5 = id_1;
  assign module_2.id_0 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  tri1  id_1,
    input  wand  id_2,
    output wor   id_3
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_3
  );
endmodule
module module_2 (
    output supply1 id_0,
    input wire id_1,
    output supply1 id_2
);
  wire id_4 = id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_2
  );
  assign id_0 = 1 ^ 1;
  id_5(
      .id_0(1), .id_1(id_4), .id_2(id_2), .id_3(1)
  );
endmodule
