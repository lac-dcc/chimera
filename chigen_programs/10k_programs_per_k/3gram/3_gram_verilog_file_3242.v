// Seed: 1596638822
module module_0 (
    output tri1 id_0,
    output supply0 id_1,
    output wand id_2,
    input wor id_3,
    output wire id_4,
    input tri0 id_5,
    input wire id_6,
    output tri0 id_7,
    input wire id_8
);
endmodule
module module_1 (
    input  wand  id_0
    , id_11,
    output wire  id_1,
    input  tri0  id_2,
    input  tri   id_3,
    output uwire id_4,
    output tri0  id_5,
    input  wor   id_6,
    output uwire id_7,
    input  tri1  id_8,
    input  tri   id_9
);
  always #1 begin : LABEL_0
    #1;
  end
  module_0 modCall_1 (
      id_4,
      id_7,
      id_1,
      id_9,
      id_7,
      id_2,
      id_8,
      id_4,
      id_3
  );
  assign modCall_1.type_1 = 0;
endmodule
