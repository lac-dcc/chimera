// Seed: 1962156672
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd84,
    parameter id_17 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire _id_10;
  output wire id_9;
  output reg id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  module_0 modCall_1 (
      id_13,
      id_12,
      id_6
  );
  input logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  wire id_16;
  wire [-1 'd0 : id_10] _id_17;
  initial begin : LABEL_0
    $unsigned(40);
    ;
  end
  wire id_18;
  always @(id_4[id_17] or posedge 1 == id_18) id_8 <= {id_3[1'b0] == id_16, id_16};
endmodule
