// Seed: 3474056702
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    output uwire id_2,
    input  wire  id_3,
    output tri   id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  tri0  id_7,
    output tri   id_8
);
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    output supply0 id_2,
    output supply0 id_3,
    input wor id_4,
    input supply0 id_5,
    input tri0 id_6,
    output wire id_7
);
  logic id_9;
  and primCall (id_3, id_6, id_5, id_1, id_4, id_9);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_1,
      id_3,
      id_5,
      id_6,
      id_1,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
