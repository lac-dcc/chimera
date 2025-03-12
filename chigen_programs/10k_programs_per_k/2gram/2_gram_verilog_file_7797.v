// Seed: 2305461427
module module_0 (
    id_1
);
  inout wire id_1;
  parameter id_2 = 1;
  wire id_3;
  wire id_4;
  parameter id_5 = (id_2) + -1;
  reg id_6;
  always_latch #1
    if (-1) begin : LABEL_0
      id_6 = id_1;
    end
  assign id_3 = id_2;
  assign id_6 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd10
) (
    output wor  id_0,
    input  wand id_1,
    input  wor  _id_2,
    input  wor  id_3
);
  logic ["" : id_2] id_5 = id_1;
  module_0 modCall_1 (id_5);
  assign modCall_1.id_6 = 0;
endmodule
