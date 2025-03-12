// Seed: 3368944600
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wand id_1;
  assign id_1 = 1;
  logic [-1 : 1] id_7;
  parameter id_8 = -1;
endmodule
module module_1 #(
    parameter id_12 = 32'd74
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
    id_10,
    id_11,
    _id_12
);
  input wire _id_12;
  inout wire id_11;
  input wire id_10;
  inout reg id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always_ff @(1 or posedge id_10) begin : LABEL_0
    $signed(66);
    ;
    id_9 = id_6;
    id_5[id_12] <= -1;
  end
  module_0 modCall_1 (
      id_1,
      id_8,
      id_1,
      id_8,
      id_8,
      id_8
  );
endmodule
