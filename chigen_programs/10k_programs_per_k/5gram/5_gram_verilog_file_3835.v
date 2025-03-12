// Seed: 2410700814
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output tri id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_9 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output reg id_11;
  output wire id_10;
  output wire _id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_10,
      id_6
  );
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_13;
  always @(posedge 1'h0 or id_5) begin : LABEL_0
    id_11 = id_1;
    while (-1) begin : LABEL_1
      id_11 <= 1;
    end
  end
  logic [-1 'b0 : id_9] id_14;
  ;
  logic id_15 = (id_13[1'b0]);
endmodule
