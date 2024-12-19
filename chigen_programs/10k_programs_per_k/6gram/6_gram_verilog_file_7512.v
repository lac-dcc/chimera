// Seed: 1622103073
module module_0 ();
  assign id_1 = id_1;
  assign module_2.id_3 = 0;
endmodule
module module_1;
  always @(id_1 or posedge 1) begin : LABEL_0
    id_1 <= 1'b0;
    id_1 <= 1'b0;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_2 == 1;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    id_3 = 1;
    #1 id_3 = 1'b0;
    $display(1, 1);
    id_3 <= id_1;
  end
endmodule
