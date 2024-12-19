// Seed: 2004996093
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input tri id_2
    , id_14,
    input wire id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri0 id_6,
    output supply0 id_7,
    output wand id_8
    , id_15,
    input supply0 id_9,
    output uwire id_10,
    input uwire id_11,
    input uwire id_12
);
  assign id_0 = id_5;
endmodule
module module_1 (
    output uwire id_0,
    output wire  id_1,
    input  uwire id_2,
    input  wand  id_3,
    output wor   id_4,
    input  uwire id_5,
    output tri   id_6
);
  assign id_4 = id_3;
  initial begin : LABEL_0$display
    ;
  end
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_5,
      id_1,
      id_0,
      id_5,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.type_1 = 0;
endmodule
