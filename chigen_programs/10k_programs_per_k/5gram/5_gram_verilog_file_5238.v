// Seed: 1514399291
module module_0 (
    input tri id_0,
    input wire id_1,
    input uwire id_2,
    input uwire id_3,
    input tri1 id_4,
    input wor id_5,
    output wand id_6,
    input uwire id_7,
    input uwire id_8,
    input wand id_9,
    input supply1 id_10,
    output supply1 id_11
);
  initial begin : LABEL_0
    id_6 = id_8;
  end
  tri id_13 = 1;
  id_14 :
  assert property (@(posedge id_8) id_7)
  else $display(1, 1 !=? id_7, id_2, id_14, id_0, id_7);
  assign id_14 = 1'b0;
  assign id_14 = 1 & id_8;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    output tri0  id_2
);
  assign id_2 = 1;
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2
  );
endmodule
