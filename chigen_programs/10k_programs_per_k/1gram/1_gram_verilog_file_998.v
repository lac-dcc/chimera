// Seed: 2010557113
module module_0 (
    input  tri0 id_0,
    output wor  id_1,
    output wire id_2,
    output wand id_3
);
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wire id_5,
    output tri id_6
);
  assign id_0 = 1;
  reg id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0
  );
  assign modCall_1.id_0 = 0;
  always_ff @(posedge 1 or posedge id_2) id_8 <= 1;
  wire id_9;
  assign id_8 = 1 == {1{id_8}};
  and primCall (id_0, id_1, id_5, id_2, id_3, id_8);
endmodule
