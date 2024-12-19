// Seed: 2332391913
module module_0 (
    output wand  id_0,
    input  wire  id_1,
    output tri0  id_2,
    output wand  id_3,
    output tri0  id_4,
    output uwire id_5,
    input  tri   id_6,
    output wor   id_7
);
  wire id_9;
  assign id_3 = 1'b0;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    input tri1 id_2,
    output wand id_3,
    output supply1 id_4,
    output tri1 id_5,
    input wor id_6,
    output tri0 id_7,
    output tri1 id_8,
    output tri0 id_9,
    output wor id_10
);
  assign id_4 = 1 + id_0;
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_0,
      id_8,
      id_5,
      id_9,
      id_5,
      id_2,
      id_7
  );
  assign id_3 = id_0 ? id_1 : 1'b0;
  xor primCall (id_7, id_2, id_0, id_6, id_1, id_12);
endmodule
