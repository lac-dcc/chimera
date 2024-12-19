// Seed: 2793618309
module module_0 (
    output wire id_0
);
  module_2 modCall_1 ();
  assign modCall_1.type_13 = 0;
  always begin : LABEL_0
    id_0 = 1;
  end
endmodule
module module_1 (
    input  uwire id_0,
    output tri   id_1,
    input  wor   id_2
);
  assign id_1 = 1;
  module_0 modCall_1 (id_1);
  assign modCall_1.type_0 = 0;
endmodule
module module_2 #(
    parameter id_9 = 32'd80
);
  tri1 id_2;
  logic [7:0][1 'h0] id_3;
  reg id_4, id_5;
  initial id_5 <= id_5.id_1;
  assign id_1 = id_2 < id_5;
  uwire id_6, id_7;
  assign id_7 = 1;
  id_8(
      .product(id_1), .id_0(1'h0)
  ); defparam id_9 = "";
endmodule
