// Seed: 1086074507
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_8;
  ;
  logic id_9;
  wire  id_10;
endmodule
module module_1 #(
    parameter id_11 = 32'd33
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
    id_14
);
  input wire id_14;
  inout logic [7:0] id_13;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_8,
      id_3,
      id_2,
      id_14,
      id_7
  );
  input wire id_12;
  inout wire _id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_13[id_11] = id_14 ? 1 : 1;
  wire id_15;
endmodule
