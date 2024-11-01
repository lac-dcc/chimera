// Seed: 568997422
module module_0 (
    output tri id_0,
    input wand id_1,
    input uwire id_2,
    output wand id_3,
    output uwire id_4,
    output uwire id_5,
    output uwire id_6,
    input tri1 id_7,
    input wire id_8,
    input supply0 id_9,
    output wor id_10,
    input tri1 id_11,
    input wor id_12,
    output wire id_13
);
endmodule
module module_1 (
    output wor   id_0,
    output wor   id_1,
    output wire  id_2
    , id_9,
    input  wand  id_3,
    input  tri   id_4,
    output tri1  id_5,
    input  tri0  id_6,
    input  uwire id_7
);
  wire id_10;
  nor (id_1, id_9, id_10, id_4, id_7, id_3, id_6);
  module_0(
      id_1, id_7, id_4, id_1, id_5, id_5, id_1, id_4, id_7, id_6, id_1, id_4, id_3, id_1
  ); id_11(
      .id_0(1), .id_1(1), .id_2(1'b0), .id_3()
  );
endmodule
