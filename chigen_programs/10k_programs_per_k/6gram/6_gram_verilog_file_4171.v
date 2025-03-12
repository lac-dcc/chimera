// Seed: 465305524
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    output tri0 id_3,
    output supply1 id_4
);
endmodule
module module_1 (
    input  tri1  id_0,
    output tri0  id_1,
    output uwire id_2,
    output tri0  id_3
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_4 = 32'd52,
    parameter id_8 = 32'd3,
    parameter id_9 = 32'd68
) (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input supply0 id_3,
    output wor _id_4,
    output tri0 id_5,
    output tri1 id_6,
    output tri1 id_7,
    input supply1 _id_8,
    output tri0 _id_9,
    output supply1 id_10,
    output wire id_11
);
  wire [id_8 : -1  == ""] id_13;
  xnor primCall (id_5, id_14, id_2, id_0, id_13, id_3, id_1);
  logic [1 : id_9  ==  id_4] id_14;
  ;
  module_0 modCall_1 (
      id_11,
      id_3,
      id_1,
      id_7,
      id_5
  );
endmodule
