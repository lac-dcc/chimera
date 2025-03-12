// Seed: 3653876104
module module_0;
  generate
    supply0 [-1 'b0 : 1] id_1;
  endgenerate
  assign id_1 = 1;
  assign module_2.id_1 = 0;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd2
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire _id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0][-1 'b0 : id_3] id_7;
  ;
  assign id_7 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  output wor id_1;
  module_0 modCall_1 ();
  assign id_1 = -1'b0;
endmodule
