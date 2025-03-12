// Seed: 3368695599
module module_0 (
    id_1
);
  input wire id_1;
  always @(*) begin : LABEL_0
    $unsigned(66);
    ;
  end
  timeunit 1ps;
  tri1 id_2 = -1;
endmodule
module module_1 #(
    parameter id_5 = 32'd47,
    parameter id_8 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
  output wire id_1;
  logic [7:0] id_6;
  ;
  wire id_7, _id_8;
  wire id_9;
  assign id_1 = -1 ? (-1'b0 != id_6[1 : id_8-~id_5]) : -1'b0;
endmodule
