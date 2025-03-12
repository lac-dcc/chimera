// Seed: 1485974714
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  wire id_4;
  assign id_4 = id_1[1'h0];
  wire id_5;
endmodule
module module_1 #(
    parameter id_7 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input logic [7:0] id_5;
  output reg id_4;
  inout wire id_3;
  input wire id_2;
  inout reg id_1;
  initial begin : LABEL_0
    id_1 <= id_2;
  end
  always begin : LABEL_1
    id_4 <= id_5;
  end
  wire id_6;
  wire _id_7 = id_5[id_7];
  module_0 modCall_1 (
      id_5,
      id_6,
      id_3
  );
endmodule
