// Seed: 484377660
module module_0 #(
    parameter id_1 = 32'd11,
    parameter id_3 = 32'd69,
    parameter id_4 = 32'd17,
    parameter id_6 = 32'd61,
    parameter id_7 = 32'd83
);
  wire _id_1;
  supply0 [id_1  ^  id_1 : id_1] id_2;
  wire _id_3;
  wire _id_4;
  ;
  for (id_5 = -1; id_4 <= id_1; id_5 = -1) begin : LABEL_0
    assign id_2 = -1 == id_4;
  end
  wire _id_6, _id_7;
  ;
  assign id_3 = id_5;
  logic [7:0][id_4  +  id_7 : id_7  &  id_6  &  id_3  +  -1] id_8, id_9, id_10, id_11, id_12, id_13,
      id_14;
  assign id_13[id_6] = id_12[1];
  always_comb @(*) begin : LABEL_1
    fork
      id_5 = id_6;
      id_14[1 : id_1] = -1;
    join_any
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd67,
    parameter id_4 = 32'd26
) (
    input  tri  id_0,
    input  wire id_1,
    input  wire id_2,
    input  tri  _id_3,
    input  tri1 _id_4
    , id_7,
    output tri1 id_5
);
  module_0 modCall_1 ();
  timeunit 1ps;
  always @(negedge -1) begin : LABEL_0
    if (1) disable id_8;
  end
  struct packed {
    logic [id_4  !=  id_4 : -1 'b0] id_9;
    logic [1 'b0 : id_3] id_10;
  } [1 : -1] id_11;
  ;
endmodule
