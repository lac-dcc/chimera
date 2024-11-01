// Seed: 3126587321
module module_0 (
    id_1
);
  inout wire id_1;
  always @(1) id_1 += "";
  assign id_1 = 1'd0 && id_1 == 1;
  wire id_2 = 1'd0;
  wire id_3;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0(
      id_4
  ); id_5 :
  assert property (@(posedge 1) id_5)
  else $display(1'b0);
endmodule
