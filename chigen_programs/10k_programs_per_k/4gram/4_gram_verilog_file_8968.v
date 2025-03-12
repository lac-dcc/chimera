// Seed: 290467375
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri  id_2
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input  wor  id_1,
    input  tri  id_2,
    input  tri0 id_3,
    input  tri  id_4,
    output wand id_5,
    input  tri  id_6,
    input  tri0 id_7
);
  wire [-1 : -1 'b0] id_9, id_10, id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1
  );
endmodule
module module_2 (
    output uwire id_0,
    output tri0  id_1,
    input  tri1  id_2,
    output tri1  id_3
    , id_5
);
  wire id_6 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
  id_7 :
  assert property (@(posedge {1'b0 * ~id_7{1}}) 1)
  else $signed(9);
  ;
endmodule
