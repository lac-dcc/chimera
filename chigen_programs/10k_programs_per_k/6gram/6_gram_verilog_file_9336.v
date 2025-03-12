// Seed: 1560527760
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    output tri id_2
);
  assign id_2 = id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd40
) (
    input  uwire _id_0,
    output uwire id_1,
    input  wor   id_2,
    output wor   id_3,
    input  uwire id_4,
    input  uwire id_5,
    output uwire id_6,
    output tri   id_7,
    input  wand  id_8,
    output wire  id_9
);
  logic [id_0 : 1] id_11 = id_0;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_6
  );
  assign modCall_1.id_0 = 0;
  always @(posedge id_8) force id_7[1 :-1] = 1;
endmodule
