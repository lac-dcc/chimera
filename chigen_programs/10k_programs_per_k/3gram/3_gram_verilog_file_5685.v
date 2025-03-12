// Seed: 2086963436
module module_0 ();
  wire id_1;
endmodule
module module_1 #(
    parameter id_5 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6
);
  input wire id_6;
  inout wire _id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  module_0 modCall_1 ();
  input wire id_1;
  wire [-1 : (  id_5  )] id_7;
  logic [-1 : 1] id_8;
  ;
  localparam id_9 = 1;
endmodule
module module_2 #(
    parameter id_12 = 32'd88,
    parameter id_6  = 32'd38,
    parameter id_7  = 32'd66
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15
);
  output reg id_15;
  input wire id_14;
  output wire id_13;
  input wire _id_12;
  output wire id_11;
  inout wire id_10;
  output logic [7:0] id_9;
  output wire id_8;
  inout wire _id_7;
  inout wire _id_6;
  input wire id_5;
  output wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  module_0 modCall_1 ();
  output wire id_1;
  always_ff @(posedge id_3[id_12-:-1] ^ -1 or id_6) begin : LABEL_0
    $signed(31);
    ;
  end
  for (id_16 = id_10 - 1; -1; id_15 = -1'b0) begin : LABEL_1
    assign id_9[id_6+:id_12-id_7] = 1;
  end
  parameter id_17 = {1{1}};
endmodule
