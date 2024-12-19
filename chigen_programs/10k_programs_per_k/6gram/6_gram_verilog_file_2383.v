// Seed: 1323577153
module module_0 ();
  assign id_1[1] = id_1[1'b0+1 : 1'd0];
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  logic id_2,
    output logic id_3
);
  module_0 modCall_1 ();
  logic id_5 = id_1;
  initial begin : LABEL_0
    id_3 = id_5;
    id_0 <= 1'd0;
    $display(1, 1'h0, id_2, 1'b0, 1, 1'h0, id_1, 1, 1);
    id_5 <= id_2;
  end
endmodule
