// Seed: 2705889105
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    output tri id_3,
    output wand id_4,
    input tri0 id_5,
    output uwire id_6,
    input wor id_7,
    output uwire id_8,
    input tri1 id_9,
    input tri id_10,
    input supply0 id_11,
    input supply1 id_12
);
  wire id_14;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  wire  id_4
);
  logic [7:0] id_6;
  wand id_7 = id_6[1] ^ 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_4,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.type_5 = 0;
endmodule
