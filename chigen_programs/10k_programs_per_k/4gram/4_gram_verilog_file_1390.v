// Seed: 139934710
module module_0 (
    input  tri0 id_0,
    output tri0 id_1,
    input  tri0 id_2,
    input  wor  id_3
);
  assign id_1 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    output wor id_2
);
  assign id_2 = 1'b0, id_2 = -1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_1 = 32'd19
) (
    input  uwire id_0,
    output tri1  _id_1,
    output wire  id_2
);
  wire [-1 : id_1] id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
