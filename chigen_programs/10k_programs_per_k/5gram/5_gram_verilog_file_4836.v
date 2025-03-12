// Seed: 1037914631
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_5,
      id_6
  );
  output wire id_2;
  output wire id_1;
endmodule
module module_2 #(
    parameter id_11 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire _id_11;
  output wire id_10;
  input wire id_9;
  output logic [7:0] id_8;
  inout wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_7,
      id_5
  );
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_16 = 1 == 1;
  localparam id_17 = -1'b0 - id_16[id_11];
  wire id_18;
  assign id_8[(1)] = id_15;
endmodule
