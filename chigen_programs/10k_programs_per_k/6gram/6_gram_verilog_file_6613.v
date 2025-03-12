// Seed: 2608359965
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output tri1 id_2,
    input tri1 id_3,
    output tri0 id_4,
    output tri id_5,
    input tri id_6,
    output supply1 id_7
);
  logic [-1 : 1] id_9;
  bit id_10;
  always @(*) begin : LABEL_0
    id_10 <= -1;
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd99,
    parameter id_4  = 32'd97
) (
    input tri0 id_0,
    input uwire id_1,
    input wor id_2,
    input supply0 id_3,
    output wor _id_4,
    output wor id_5,
    input supply0 id_6,
    output wor id_7,
    output uwire id_8,
    input supply0 id_9,
    output tri0 _id_10
);
  wire id_12 = id_2;
  logic [1 : id_10] id_13;
  and primCall (id_8, id_6, id_0, id_9, id_13, id_3, id_12, id_2, id_1);
  module_0 modCall_1 (
      id_8,
      id_2,
      id_7,
      id_9,
      id_7,
      id_8,
      id_6,
      id_8
  );
  assign modCall_1.id_5 = 0;
  logic [1 'd0 : (  {  -1  ,  {  id_4  ,  1  }  }  )] id_14;
endmodule
