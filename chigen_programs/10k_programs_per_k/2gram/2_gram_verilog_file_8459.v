// Seed: 3728495814
module module_0 (
    output wor id_0,
    output supply0 id_1,
    input wor id_2,
    input wor id_3,
    output supply0 id_4,
    output tri1 id_5,
    output supply0 id_6,
    input uwire id_7,
    input tri0 id_8,
    output uwire id_9,
    input wor id_10
);
  wire id_12;
  assign module_1.id_6 = 0;
  logic [1  +  1 : -1] id_13;
  ;
  wire id_14;
  assign id_9 = -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd94
) (
    input  tri0  id_0,
    output uwire id_1,
    output tri0  id_2,
    output tri0  id_3
);
  logic id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0
  );
  _id_6(
      -1, 1'b0, id_5[1&id_6]
  );
  nor primCall (id_2, id_5, id_0);
endmodule
