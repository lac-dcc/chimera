// Seed: 59866595
module module_0;
  wire id_1;
  assign module_1.type_7 = 0;
  wand id_2 = 1;
endmodule
module module_1 (
    output wand id_0,
    input  tri1 id_1,
    input  tri0 id_2
);
  wire id_4;
  wire id_5;
  assign id_0 = id_1;
  generate
    assign id_4 = id_5;
    if (1) begin : LABEL_0
      assign id_5 = (1);
    end else begin : LABEL_0
      assign id_0 = id_5;
    end
  endgenerate
  module_0 modCall_1 ();
  always @(posedge 1) begin : LABEL_0
    if (1) $display(1);
    else begin : LABEL_0
      #1;
      assert (1);
      if (1) $display({1{1}}, id_2);
      id_4 = 1'h0;
    end
  end
endmodule
