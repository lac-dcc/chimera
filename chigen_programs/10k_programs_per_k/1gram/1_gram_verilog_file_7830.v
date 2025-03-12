// Seed: 3614372260
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  input wire id_2;
  assign module_1.id_3 = 0;
  inout wire id_1;
  assign id_4 = !id_3;
  assign id_4[(1)] = id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd94
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5[id_3&-1 :-1],
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  inout logic [7:0] id_10;
  output wire id_9;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_8,
      id_10,
      id_14
  );
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input logic [7:0] id_5;
  input wire id_4;
  input wire _id_3;
  inout wire id_2;
  output wire id_1;
  assign id_8 = id_10[id_3+-1];
  wire id_15;
  wire id_16 = id_8;
endmodule
