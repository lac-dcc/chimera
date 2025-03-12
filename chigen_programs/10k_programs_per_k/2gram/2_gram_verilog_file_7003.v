// Seed: 799949503
module module_0 (
    input tri   id_0,
    input wire  id_1,
    input uwire id_2,
    input wand  id_3,
    input wire  id_4,
    input tri1  id_5,
    input tri0  id_6,
    input wire  id_7,
    input tri   id_8
);
endmodule
module module_1 (
    input  tri   id_0,
    input  wor   id_1,
    output wor   id_2,
    output uwire id_3,
    output tri0  id_4,
    input  wor   id_5
);
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
module module_2 (
    input tri id_0,
    output wor id_1,
    input tri id_2,
    output tri1 id_3,
    input tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    input wor id_7,
    input supply1 id_8,
    input wor id_9,
    input uwire id_10,
    input supply1 id_11,
    input wor id_12,
    input tri1 id_13
);
  assign id_1 = id_9;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_13,
      id_4
  );
endmodule
