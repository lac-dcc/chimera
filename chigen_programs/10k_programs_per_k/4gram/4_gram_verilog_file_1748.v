// Seed: 2877731573
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd8
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_5,
      id_2
  );
  output wire id_3;
  inout wire id_2;
  input wire _id_1;
  logic [7:0] id_7;
  wire [1 : id_1] id_8;
  assign id_7[-1 : 1'b0] = (-1);
  initial begin : LABEL_0
    return 1'b0;
  end
endmodule
