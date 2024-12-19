// Seed: 2660505072
module module_0 (
    output tri0  id_0,
    output uwire id_1,
    input  tri1  id_2,
    output wor   id_3,
    output tri0  id_4,
    input  uwire id_5,
    input  tri0  id_6,
    input  wand  id_7
);
  assign id_4 = 1;
  not primCall (id_3, id_7);
  module_2 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_5,
      id_3,
      id_6,
      id_1,
      id_6
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri0 id_1
);
  logic [7:0] id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_0 = 0;
  initial assume (id_3[1]);
endmodule
module module_2 (
    output supply1 id_0,
    output supply0 id_1,
    output supply0 id_2,
    input supply0 id_3,
    output tri0 id_4,
    input tri id_5,
    output supply0 id_6,
    input tri0 id_7
);
  wire id_9, id_10, id_11, id_12;
endmodule
