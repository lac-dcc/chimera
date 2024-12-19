// Seed: 850937154
module module_0;
  reg id_2;
  assign id_2 = 1'h0;
  initial begin : LABEL_0
    id_2 <= 1'b0;
    for (id_1 = 1; 1'd0; id_1 = 1) @(posedge id_1);
    id_2 <= 1;
  end
endmodule
module module_1 (
    input logic id_0,
    input logic id_1
);
  assign id_3 = 1;
  initial begin : LABEL_0
    #1;
    id_3 <= 1;
    id_4 <= 1;
    if (1) begin : LABEL_0
      id_3 = id_0;
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
