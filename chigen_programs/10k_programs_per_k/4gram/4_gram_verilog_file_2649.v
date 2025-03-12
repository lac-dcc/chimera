// Seed: 3338568832
module module_0 (
    id_1
);
  inout wire id_1;
  parameter id_2 = -1'd0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  logic id_3;
  module_0 modCall_1 (id_3);
endmodule
module module_2 #(
    parameter id_1 = 32'd88,
    parameter id_2 = 32'd80
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  module_0 modCall_1 (id_5);
  output wire id_4;
  output logic [7:0] id_3;
  input wire _id_2;
  input wire _id_1;
  assign id_3[~id_2==id_1] = id_1 ? id_2 ^ 1 : 1;
endmodule
