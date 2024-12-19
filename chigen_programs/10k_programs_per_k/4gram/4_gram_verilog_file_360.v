// Seed: 3191997096
module module_0 (
    input  tri1 id_0,
    output wor  id_1
);
  assign id_1 = 1'b0;
  assign id_1 = id_0;
  wire id_3;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input  tri  id_0,
    output tri0 id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2;
  tri id_1;
  assign module_0.id_1 = 0;
  always @(posedge id_1 == (1) or posedge 1'b0) begin : LABEL_0
    id_2 = #1 1 ^ 1;
  end
endmodule
module module_0 (
    output wand  id_0,
    input  tri1  module_3,
    input  wor   id_2,
    input  tri0  id_3,
    input  uwire id_4,
    input  wand  id_5
);
  assign id_0 = id_5;
  xnor primCall (id_0, id_2, id_3, id_4, id_5);
  module_2 modCall_1 ();
  id_7(
      .id_0(1), .id_1(1'd0)
  );
endmodule
