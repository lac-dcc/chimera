// Seed: 1481046853
macromodule module_0 (
    input  uwire id_0,
    output uwire id_1,
    output tri   id_2,
    output wor   id_3,
    input  uwire id_4,
    input  wor   id_5#({1, 1}),
    input  uwire id_6,
    output wand  id_7,
    output wire  id_8,
    input  wor   id_9
);
  wire id_11;
endmodule
module module_1 #(
    parameter id_2 = 32'd61
) (
    output tri id_0,
    input uwire id_1,
    input supply1 _id_2
);
  wire [{  -1 'b0 ,  id_2  } : -1] id_4 = id_2;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_5 = 0;
  assign id_0 = 1'b0;
endmodule
