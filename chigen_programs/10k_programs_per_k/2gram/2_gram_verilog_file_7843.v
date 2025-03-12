// Seed: 3640673223
module module_0 (
    input wand id_0,
    input tri  id_1
);
  assign module_2._id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    input  tri1  id_2,
    output tri1  id_3,
    input  wor   id_4
);
  assign id_3 = id_4;
  module_0 modCall_1 (
      id_4,
      id_2
  );
  assign modCall_1.id_0 = 0;
  always disable id_6;
endmodule
module module_2 #(
    parameter id_0 = 32'd35,
    parameter id_1 = 32'd21
) (
    output wand  _id_0,
    output wire  _id_1,
    output wor   id_2,
    input  uwire id_3
);
  logic [id_0 : -1] id_5[id_1 : 1];
  ;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  assign id_1 = id_5;
endmodule
