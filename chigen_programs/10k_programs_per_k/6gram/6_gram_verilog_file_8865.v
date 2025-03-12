// Seed: 1727305042
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output reg id_8;
  output tri0 id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_7 = 1;
  logic id_9;
  ;
  logic id_10, id_11, id_12;
  always @(*) begin : LABEL_0
    id_8 <= id_11;
    deassign id_10;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd11
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output reg id_2;
  inout wire _id_1;
  logic [-1 : id_1] id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_5,
      id_3,
      id_4,
      id_5,
      id_6,
      id_2
  );
  initial begin : LABEL_0
    id_2 <= -1'h0;
  end
endmodule
