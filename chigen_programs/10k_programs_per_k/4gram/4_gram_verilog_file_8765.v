// Seed: 1203497414
module module_0 ();
  always @(id_1 or posedge 1'b0) $display(1'b0);
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1'h0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_7;
  wire id_8;
endmodule
module module_2;
  assign id_1 = id_1;
  assign module_0.id_1 = 0;
endmodule
