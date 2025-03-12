// Seed: 4117903715
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output supply0 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input uwire id_5,
    output tri1 id_6
);
endmodule
macromodule module_1 #(
    parameter id_1 = 32'd13,
    parameter id_2 = 32'd79
) (
    output wire  id_0,
    input  uwire _id_1,
    output uwire _id_2,
    input  tri0  id_3,
    input  tri1  id_4,
    input  tri0  id_5,
    input  uwire id_6
);
  logic [id_1 : id_2] id_8;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_0,
      id_3,
      id_0,
      id_5,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
