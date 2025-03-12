// Seed: 2313488593
module module_0 (
    id_1
);
  input wire id_1;
  bit id_2, id_3;
  initial id_3 = id_1;
  logic id_4;
  ;
  final id_4 <= "" + -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd21,
    parameter id_2 = 32'd55
) (
    _id_1,
    _id_2,
    id_3
);
  output wire id_3;
  input wire _id_2;
  input wire _id_1;
  wire [id_1 : id_2  |  id_1  %  id_2] id_4;
  module_0 modCall_1 (id_4);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout reg id_2;
  output wire id_1;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
  always_ff begin : LABEL_0
    id_2 <= id_4;
  end
  wire id_5;
endmodule
