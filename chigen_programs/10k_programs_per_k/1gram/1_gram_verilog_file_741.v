// Seed: 2407030506
module module_0;
  always_comb id_1 <= 1;
endmodule
module module_1;
  assign id_1 = 1'h0;
  uwire id_2;
  wire  id_3;
  for (id_4 = 1; id_3; id_1 = id_4) begin : LABEL_0
    assign id_2 = 1'h0;
  end
  uwire id_5;
  logic [7:0] id_6;
  assign id_4 = id_3;
  assign id_6[1'h0] = id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  always_comb $display(1);
  assign id_5 = id_1;
  always begin : LABEL_0
    id_3 = 1;
  end
  assign id_5 = 1'b0;
endmodule
