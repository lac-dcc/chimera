// Seed: 757629933
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output tri id_2;
  output wire id_1;
  assign id_2 = id_4[1];
  logic id_7;
  assign id_2 = 1;
  assign id_7 = 1'b0;
endmodule
module module_1 #(
    parameter id_2 = 32'd63,
    parameter id_4 = 32'd0
) (
    id_1,
    _id_2,
    id_3
);
  input wire id_3;
  inout wire _id_2;
  inout reg id_1;
  always_latch begin : LABEL_0
    id_1 <= 1;
  end
  logic _id_4;
  ;
  wire id_5;
  logic [7:0] id_6;
  ;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_7,
      id_6,
      id_7,
      id_5
  );
  wire [-1 : id_4] id_8;
  assign id_6[id_4 : id_2] = -1;
  assign id_5 = (id_1);
endmodule
