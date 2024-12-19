// Seed: 2331484837
module module_0 (
    output uwire id_0,
    input  tri   id_1,
    output wand  id_2,
    input  uwire id_3,
    output wor   id_4,
    output wor   id_5,
    input  uwire id_6,
    output uwire id_7
);
  wire id_9;
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    input tri id_0,
    output supply0 id_1,
    output supply1 id_2,
    output wand id_3,
    output supply1 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input wor id_7
);
  always #1
    case (1)
      id_7#(.id_0(1)).id_7: id_2 = id_7 - 1'b0;
    endcase
  tri1 id_9 = ~id_0 - 1;
  wire id_10, id_11;
  tri  id_12 = 1;
  wire id_13;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_1,
      id_7,
      id_1,
      id_3,
      id_7,
      id_5
  );
endmodule
