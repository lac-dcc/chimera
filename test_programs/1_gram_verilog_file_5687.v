// Seed: 3161651472
module module_0 (
    output wor   id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  tri1  id_3,
    input  uwire id_4,
    input  uwire id_5
);
  initial begin : LABEL_0$display
    ;
  end
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    output supply1 id_2,
    input uwire id_3
);
  wand id_5;
  always id_2 = id_5;
  bit id_6 = id_5 >= "";
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.type_1 = 0;
  assign id_1 = id_6 == 1 + 1 ==? "";
  id_7 :
  assert property (@(posedge 'h0) id_6) id_6 <= -1;
endmodule
