// Seed: 2501911080
module module_0 (
    id_1,
    id_2
);
  output uwire id_2;
  inout wire id_1;
  wire id_3, id_4, id_5;
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd14,
    parameter id_6 = 32'd64,
    parameter id_7 = 32'd69
) (
    id_1,
    id_2,
    id_3[-1 :-1],
    _id_4,
    id_5[id_6 : (1)],
    _id_6,
    _id_7,
    id_8
);
  output wire id_8;
  inout wire _id_7;
  output wire _id_6;
  inout logic [7:0] id_5;
  inout wire _id_4;
  input logic [7:0] id_3;
  output logic [7:0] id_2;
  output wire id_1;
  assign id_2[1 :-1][id_7 : {-1, -1, id_4, 1}] = 1 | id_7;
  logic id_9;
  logic id_10;
  module_0 modCall_1 (
      id_9,
      id_8
  );
endmodule
