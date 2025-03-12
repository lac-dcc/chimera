// Seed: 2798431633
module module_0 (
    input  wor   id_0,
    output uwire id_1,
    input  tri   id_2,
    input  tri0  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    input  wand  id_6
    , id_9,
    output uwire id_7
);
  assign id_7 = 1;
  logic id_10;
  ;
endmodule
module module_1 (
    output uwire id_0,
    output tri1 id_1,
    input uwire id_2,
    input supply0 id_3,
    input wor id_4,
    output tri1 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output tri id_8
);
  wire id_10;
  xnor primCall (id_1, id_10, id_4, id_3, id_2, id_6);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_6,
      id_4,
      id_2,
      id_6,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
