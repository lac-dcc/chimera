// Seed: 1049949062
module module_0 ();
  logic [1 : -1] id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  module_0 modCall_1 ();
  inout logic [7:0] id_1;
  assign id_1 = id_2;
  assign id_1[1'b0] = id_1;
endmodule
module module_2 #(
    parameter id_3 = 32'd64
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  input logic [7:0] id_2;
  inout logic [7:0] id_1;
  module_0 modCall_1 ();
  assign id_1[id_3] = 1;
  always @(posedge -1 - -1) begin : LABEL_0
    assert (id_1);
  end
  logic id_4 = ~id_2[-1], id_5, id_6;
endmodule
