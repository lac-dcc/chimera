// Seed: 658101441
module module_0 (
    input tri id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri1 id_3,
    input tri1 id_4,
    input supply1 id_5,
    input uwire id_6,
    input tri1 id_7
);
  assign id_2 = id_0;
  logic id_9;
endmodule
module module_1 (
    input  tri   id_0,
    output wand  id_1,
    input  uwire id_2,
    output uwire id_3#(-1 ? 1 : 1),
    output wor   id_4,
    input  wor   id_5,
    inout  wire  id_6
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_5,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
