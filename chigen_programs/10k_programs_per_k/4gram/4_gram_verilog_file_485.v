// Seed: 2470387789
module module_0;
endmodule
module module_1 #(
    parameter id_4 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  output reg id_3;
  input wire id_2;
  module_0 modCall_1 ();
  input wire id_1;
  always @(*) id_3 = id_4;
  assign id_3 = id_4;
  assign id_3 = -1;
  bit [id_4 : 1] id_5;
  always @(posedge id_5) begin : LABEL_0
    id_5 = id_2;
  end
  wire id_6;
  always @(*) begin : LABEL_1
    id_5 = id_1 ? 1 : -1'b0;
  end
  always_latch @(*) id_3 <= 1;
endmodule
