// Seed: 2733760455
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input logic [7:0] id_1;
  assign id_2 = id_1[-1];
endmodule
module module_1 #(
    parameter id_4 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1[id_4] = id_1 ? 1 : -1;
  assign id_1[1'h0] = -1;
  wire id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_7
  );
  logic id_8;
  ;
  wire id_9;
endmodule
