// Seed: 4250270323
module module_0 (
    output tri1  id_0,
    input  tri0  id_1,
    output uwire id_2
);
  assign id_2 = id_1 == 1;
  assign module_1.type_16 = 0;
  wire id_4;
endmodule
module module_1 #(
    parameter id_11 = 32'd92,
    parameter id_12 = 32'd51
) (
    input  tri1  id_0,
    output wand  id_1,
    input  tri   id_2,
    input  wand  id_3,
    output tri1  id_4,
    input  uwire id_5,
    output wor   id_6,
    output tri   id_7,
    output wire  id_8
);
  generate
    for (id_10 = id_0; id_10; id_8 = 1 >= id_2) begin : LABEL_0
      defparam id_11.id_12 = 1;
    end
  endgenerate
  module_0 modCall_1 (
      id_10,
      id_3,
      id_7
  );
endmodule
