// Seed: 1853196477
module module_0;
  always @(negedge 1) begin : LABEL_0
    id_1 = 1'b0;
  end
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  tri id_3;
  module_0 modCall_1 ();
  assign id_2 = 1;
  generate
    assign id_2 = id_3;
  endgenerate
endmodule
module module_2 (
    output wand id_0,
    input  wire id_1,
    output tri0 id_2
    , id_4
);
  assign id_4[1+:""] = 1;
  bufif0 primCall (id_0, id_1, id_4);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_3 (
    output supply1 id_0
    , id_3,
    output wire id_1
);
  assign id_0 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_1 = 1'h0;
  always @(posedge id_3) begin : LABEL_0
    #1 $display(id_3, 1, id_3, id_3);
  end
  tri0 id_4 = 1;
endmodule
