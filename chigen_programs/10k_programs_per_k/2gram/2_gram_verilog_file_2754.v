// Seed: 140043342
module module_0 (
    input  tri0  id_0,
    input  wand  id_1,
    output tri1  id_2,
    input  wand  id_3,
    input  tri   id_4,
    input  wire  id_5,
    output uwire id_6,
    input  wor   id_7
);
  assign id_2 = id_7;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output wor id_1,
    output wire id_2,
    output tri1 id_3,
    input wor id_4,
    input uwire id_5,
    input supply1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wor id_9,
    output tri id_10
);
  supply1 id_12;
  assign id_3  = 1;
  assign id_12 = {id_6{1}};
  assign id_10 = 1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_2,
      id_5,
      id_6,
      id_5,
      id_3,
      id_7
  );
endmodule
