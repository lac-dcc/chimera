// Seed: 276281072
module module_0 ();
  always @(1 == {1{1'd0 | 1}} or posedge 1'b0) begin : LABEL_0
    if (id_1) disable id_2;
    else id_1 <= id_2;
  end
endmodule
module module_0 (
    output logic id_0,
    input  tri   module_1,
    input  logic id_2,
    input  wor   id_3,
    output logic id_4
);
  initial begin : LABEL_0
    id_4 = new;
    id_0 = new id_6;
    id_6#(
        .id_3((1'b0)),
        .id_6(1)
    ) <= 1 - id_3;
    $display;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  assign id_0 = (1) == id_2;
  assign id_4 = id_3 & 1;
endmodule
