// Seed: 2756596531
module module_0 (
    input tri1 id_0,
    output supply1 id_1
);
  assign id_1 = 1;
  wire id_3 = -1;
  wire id_4;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wor id_4,
    output supply1 id_5,
    output wire id_6
);
  assign id_6 = (~id_0);
  xor primCall (id_5, id_1, id_2, id_4, id_0, id_3);
  module_0 modCall_1 (
      id_3,
      id_5
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd28
) (
    input  tri0  id_0,
    output logic id_1,
    input  uwire id_2,
    output wire  id_3,
    output wor   _id_4,
    input  tri1  id_5,
    output wand  id_6
);
  logic [-1  -  1 : id_4] id_8;
  module_0 modCall_1 (
      id_0,
      id_6
  );
  assign modCall_1.id_3 = 0;
  initial begin : LABEL_0
    id_1 <= 1'b0;
  end
endmodule
