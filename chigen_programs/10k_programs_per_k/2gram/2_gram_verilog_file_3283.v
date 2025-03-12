// Seed: 4162419463
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    input tri1 id_2,
    input wand id_3,
    output tri0 id_4,
    output uwire id_5,
    input wire id_6,
    input tri0 id_7,
    input wor id_8,
    input wand id_9,
    input tri id_10,
    input tri1 id_11
);
  assign id_1 = id_7;
endmodule
module module_1 (
    input  wor   id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    output uwire id_3,
    input  tri1  id_4
);
  assign id_3 = -1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_0,
      id_4,
      id_1,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_5 = 0;
  assign id_3 = 1;
  logic id_6;
endmodule
