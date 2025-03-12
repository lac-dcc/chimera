// Seed: 3853024799
module module_0;
endmodule
module module_1;
  logic id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 ();
  wire id_3;
endmodule
program module_3 #(
    parameter id_4 = 32'd81,
    parameter id_5 = 32'd13
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5[id_4 :-1]
);
  input logic [7:0] _id_5;
  output wire _id_4;
  output wire id_3;
  module_0 modCall_1 ();
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_4 = id_1[id_5 : 1];
endprogram
