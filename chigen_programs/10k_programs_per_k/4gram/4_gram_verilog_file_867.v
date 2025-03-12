// Seed: 2119684924
module module_0 (
    output wor   id_0,
    input  tri   id_1,
    output tri   id_2,
    input  uwire id_3
);
endmodule
module module_1 (
    output wire id_0,
    input tri id_1,
    output uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    input uwire id_5,
    input wand id_6,
    input supply1 id_7
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_1 = 32'd35,
    parameter id_5 = 32'd14
) (
    output wand id_0,
    output tri1 _id_1,
    input supply1 id_2,
    output wire id_3,
    input tri1 id_4,
    input supply0 _id_5
);
  logic [id_5 : id_1] id_7;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
