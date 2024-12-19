// Seed: 3067148005
module module_0 (
    input  wor   id_0,
    output tri0  id_1
    , id_7,
    output wand  id_2,
    output wire  id_3,
    input  uwire id_4,
    input  uwire id_5
);
  supply0 id_8;
  wand id_9;
  initial begin : LABEL_0
    id_9 = 1;
  end
  id_10 :
  assert property (@(posedge id_7) id_8)
  else begin : LABEL_0
    id_10 = id_4;
  end
  wire id_11, id_12;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    input  tri   id_2,
    output uwire id_3,
    input  tri0  id_4,
    output wor   id_5,
    output tri0  id_6,
    input  uwire id_7,
    input  tri0  id_8,
    input  wire  id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_5,
      id_9,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
