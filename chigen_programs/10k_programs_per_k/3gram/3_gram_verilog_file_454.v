// Seed: 3664333171
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire  id_5;
  logic id_6;
endmodule
module module_1 #(
    parameter id_1  = 32'd6,
    parameter id_13 = 32'd15
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13
);
  inout wire _id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  module_0 modCall_1 (
      id_10,
      id_2,
      id_11,
      id_10
  );
  inout logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire _id_1;
  pullup (id_8[id_13-id_1+:1], -1);
endmodule
