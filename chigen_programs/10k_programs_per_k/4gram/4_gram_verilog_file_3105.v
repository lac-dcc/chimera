// Seed: 3671911163
module module_0 #(
    parameter id_8 = 32'd79
) (
    output uwire id_0,
    output wor id_1,
    input wor id_2,
    input tri id_3,
    input tri id_4,
    output supply0 id_5,
    input uwire id_6
);
  logic _id_8;
  ;
  uwire id_9 = 1;
  logic [-1 : id_8] id_10;
endmodule
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    output tri0  id_3,
    input  wire  id_4,
    output uwire id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_2,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
