// Seed: 1812505595
module module_0;
  wire id_1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign module_1.id_7  = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd28,
    parameter id_6 = 32'd75,
    parameter id_7 = 32'd7,
    parameter id_8 = 32'd74
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_5 = 1, id_6 = 1'b0, id_7 = (1), id_8 = 1;
  xor primCall (id_1, id_4, id_5, id_6, id_7, id_8);
  module_0 modCall_1 ();
endmodule
module module_2;
  assign id_1 = 1;
  assign module_3.type_2 = 0;
endmodule
macromodule module_3 (
    input wor id_0
);
  module_2 modCall_1 ();
endmodule
