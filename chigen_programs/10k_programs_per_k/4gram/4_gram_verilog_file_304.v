// Seed: 3678728048
module module_0;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always_latch @(id_2 == 1'b0 or posedge {1{id_4}}) id_5 = 1;
  for (id_6 = 1; id_2; id_6 = 1) begin : LABEL_0
    assign id_1 = 1;
  end
endmodule
