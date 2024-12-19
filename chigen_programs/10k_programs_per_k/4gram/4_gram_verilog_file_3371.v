// Seed: 1064799481
module module_0;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    module_1,
    id_5
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_5 <= 1'b0;
  end
  assign id_5 = 1;
  always_latch @(id_1) begin : LABEL_0
    return $display(1'b0, id_5, (1'd0), 1);
  end
  wire id_7;
  assign id_5 = id_1;
  assign id_5 = id_2;
  logic [7:0] id_8;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_2 = 1'b0;
  assign id_7 = id_3;
  assign id_8[1] = 1;
endmodule
