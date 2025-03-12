// Seed: 852825296
module module_0 (
    id_1
);
  input wire id_1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd94,
    parameter id_5 = 32'd66,
    parameter id_6 = 32'd6
) (
    id_1,
    _id_2,
    id_3
);
  output wire id_3;
  input wire _id_2;
  input wire id_1;
  assign id_3 = id_1;
  module_0 modCall_1 (id_1);
  tri id_4 = -1'b0;
  logic _id_5;
  wire _id_6[id_2 : id_5];
  ;
  generate
    wire [1 : (  id_6  )] id_7;
    wire [-1  ==  -1 : id_6] id_8, id_9, id_10;
  endgenerate
endmodule
