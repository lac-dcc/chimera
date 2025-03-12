// Seed: 2138772470
module module_0 (
    id_1
);
  output wire id_1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  always @(posedge id_1[-1 : id_4]) begin : LABEL_0
    disable id_5;
  end
  module_0 modCall_1 (id_2);
  wire id_6;
  assign id_2 = id_4;
endmodule
module module_2 #(
    parameter id_0 = 32'd90,
    parameter id_1 = 32'd51,
    parameter id_2 = 32'd35
) (
    input  tri1 _id_0,
    input  wor  _id_1,
    output tri  _id_2
);
  logic [1 : (  id_1  )] id_4;
  logic [id_0 : id_2  (  -1  *  id_0  +  1  )] id_5;
  ;
  module_0 modCall_1 (id_5);
endmodule
