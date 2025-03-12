// Seed: 1390132391
module module_0 (
    id_1,
    id_2,
    id_3,
    module_0,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  assign module_1.id_2 = 0;
  wire [1 : 1 'b0] id_12;
  parameter id_13 = "";
endmodule
module module_1 #(
    parameter id_1 = 32'd23
) (
    _id_1,
    id_2
);
  inout reg id_2;
  output wire _id_1;
  always_comb @(posedge id_2) begin : LABEL_0
    id_2 <= -1;
  end
  logic [-1 : id_1  +  1] id_3;
  ;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
