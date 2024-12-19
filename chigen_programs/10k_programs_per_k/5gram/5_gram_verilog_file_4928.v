// Seed: 1023214152
module module_0 (
    output tri   id_0,
    input  wand  id_1,
    output wor   id_2,
    output wor   id_3,
    input  tri   id_4,
    input  tri0  id_5,
    input  tri   id_6,
    output wire  id_7,
    input  tri   id_8
    , id_15,
    input  wand  id_9,
    output wand  id_10,
    output uwire id_11,
    input  tri   id_12,
    output uwire id_13
);
  supply1 id_16;
  assign id_11 = {id_16, 1};
  wire id_17;
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    output tri0 id_2
    , id_7,
    output wor id_3,
    output wor id_4,
    input supply1 id_5
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_2,
      id_5,
      id_1,
      id_1,
      id_0,
      id_5,
      id_5,
      id_3,
      id_2,
      id_1,
      id_0
  );
  assign id_2 = 1;
  id_8(
      .sum("" ^ 1'b0 - id_1), .id_0(!id_5), .id_1(1)
  );
  wire id_9;
endmodule
