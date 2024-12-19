// Seed: 1686370977
module module_0 (
    input  wor   id_0,
    output tri   id_1,
    input  tri1  id_2,
    output tri1  id_3,
    input  uwire id_4,
    input  tri   id_5
);
  assign id_3 = 1;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output supply1 id_1,
    input wire id_2,
    input uwire id_3,
    input wire id_4,
    input tri id_5,
    input supply1 id_6,
    output uwire id_7,
    output wire id_8,
    input wor id_9,
    output tri0 id_10
);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_7,
      id_9,
      id_2
  );
  pullup (id_4);
endmodule
