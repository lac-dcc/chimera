// Seed: 2802044111
module module_0;
  reg id_1;
  generate
    reg id_2;
  endgenerate
  always begin : LABEL_0
    ;
    if (1'b0) begin : LABEL_0
      id_1 = 1;
    end
  end
  id_3 :
  assert property (@(posedge 1) 1) begin : LABEL_0
    begin : LABEL_0
      id_2 <= id_1;
    end
    begin : LABEL_0
      id_2 <= 1 - id_2;
      for (id_3 = id_3; 1; id_2 = 1) begin : LABEL_0
        @(posedge 1'b0) id_1 <= id_2;
        @(1 or posedge 1'd0) @(1) id_1 = id_2;
      end
      id_1 <= id_2;
      $display();
      id_3 <= 1;
    end
    id_3 = id_2;
  end
endmodule
module module_1;
  assign id_1 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
