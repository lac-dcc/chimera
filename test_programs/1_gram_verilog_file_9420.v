// Seed: 1124569143
module module_0 (
    id_1
);
  inout wire id_1;
  reg id_2;
  parameter id_3 = 1;
  always_ff begin : LABEL_0
    if (1) id_2 <= !id_3;
  end
  wire id_4;
  wire id_5;
  always_comb $display;
  assign module_1.type_9 = 0;
endmodule
module module_1 #(
    parameter id_8 = 32'd88
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  tri1 id_7 = -1;
  defparam id_8 = id_2;
  nand primCall (id_2, id_7, id_5, id_4);
  module_0 modCall_1 (id_7);
endmodule
