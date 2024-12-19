// Seed: 3577199221
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input  uwire id_2,
    input  wor   id_3,
    output wor   id_4
);
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input wire id_2,
    input tri1 id_3,
    output tri id_4,
    input wand id_5,
    input supply0 id_6,
    input wand id_7,
    input wire id_8
);
  assign id_4 = {!id_7, id_1} ? 1 : 1'h0;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_8,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
