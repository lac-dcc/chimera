// Seed: 2170133403
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_6 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  wire _id_6;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_7,
      id_3,
      id_4
  );
  assign id_7 = id_2[id_6];
endmodule
