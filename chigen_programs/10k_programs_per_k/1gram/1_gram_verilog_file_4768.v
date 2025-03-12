// Seed: 130680811
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  assign module_1.id_5 = 0;
  localparam id_5 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd77
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  output logic [7:0] id_8;
  input wire id_7;
  input logic [7:0] id_6;
  input wire _id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_7
  );
  wire id_9;
  assign id_8[1] = -1;
  assign id_9 = id_6[1 : id_5];
endmodule
