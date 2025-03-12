// Seed: 3957705567
module module_0 #(
    parameter id_14 = 32'd71
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_8, id_9, id_10, id_11, id_12, id_13, _id_14, id_15, id_16;
  assign id_9  = id_13;
  assign id_11 = id_7;
  generate
    assign id_11 = id_12[1 : id_14];
  endgenerate
endmodule
module module_1 #(
    parameter id_3 = 32'd46
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  inout wire id_4;
  input wire _id_3;
  input wire id_2;
  output reg id_1;
  uwire [id_3 : id_3] id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4
  );
  always @(negedge id_3) begin : LABEL_0
    id_1 <= 1;
  end
  assign id_5 = id_4 + id_5;
  logic id_6;
  wire  id_7;
  logic id_8;
  ;
  wire id_9;
  wire id_10;
endmodule
