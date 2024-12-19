// Seed: 2776352855
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    output uwire id_2,
    input tri1 id_3,
    output wor id_4,
    input supply0 id_5,
    input tri id_6
);
  wire id_8;
  assign id_4 = {id_3{1}};
endmodule
module module_1 (
    output wand  id_0,
    input  wire  id_1,
    output uwire id_2,
    input  tri0  id_3,
    inout  wand  id_4,
    input  tri1  id_5,
    output tri1  id_6,
    input  tri0  id_7,
    input  wand  id_8,
    output wand  id_9,
    output tri1  id_10
);
  assign id_9 = id_1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_7,
      id_9,
      id_1,
      id_8
  );
  assign modCall_1.type_0 = 0;
  assign id_4 = ~id_3;
endmodule
