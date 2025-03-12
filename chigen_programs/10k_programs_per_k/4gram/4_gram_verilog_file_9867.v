// Seed: 194541928
module module_0 #(
    parameter id_1 = 32'd75,
    parameter id_3 = 32'd62
);
  parameter id_1 = 1;
  logic [7:0] id_2;
  parameter id_3 = -1;
  assign id_2[id_1-:id_3] = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input logic [7:0] id_2;
  input wire id_1;
  logic id_4 = id_1 + -1, id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  assign id_3 = id_2#(
      .id_4(1),
      .id_2((-1)),
      .id_1(~1),
      .id_4(-1),
      .id_4(1),
      .id_3(1),
      .id_3(-1),
      .id_1(1'h0)
  ) [1];
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_6(1, -1'd0 - id_2, id_5, id_6);
    end
  end
  assign id_5 = id_2;
  wire id_7;
endmodule
