// Seed: 767878395
module module_0;
  wire id_2;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  final begin : LABEL_0
    assume ((1'b0));
    id_1 = 1;
    $display(1'h0 + id_3 & 1'd0 - ~1);
    #1;
    $display(1, 1'b0, 1 & (id_3), id_3, 1);
  end
  module_0 modCall_1 ();
endmodule
