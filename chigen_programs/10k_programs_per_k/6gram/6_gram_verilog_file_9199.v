// Seed: 1406421978
module module_0 ();
  logic id_1;
  wire  id_2;
  wire id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12;
  wire id_13;
  always @(id_12 or posedge id_12) begin : LABEL_0
    id_1 = #id_14 id_12;
  end
  assign id_12 = id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd91
) (
    id_1,
    id_2,
    _id_3
);
  inout wire _id_3;
  output reg id_2;
  not primCall (id_1, id_4);
  inout logic [7:0] id_1;
  wire id_4;
  module_0 modCall_1 ();
  timeunit 1ps;
  always @(*) begin : LABEL_0
    id_2 <= 'd0;
  end
endmodule
