// Seed: 3918569507
module module_0 #(
    parameter id_9 = 32'd24
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_8;
  logic _id_9 = id_6[id_9];
endmodule
module module_1 #(
    parameter id_15 = 32'd81,
    parameter id_16 = 32'd93
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
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_9,
      id_9,
      id_4,
      id_6
  );
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic _id_15;
  assign id_7 = id_15;
  wire [(  -1  ) : -1] _id_16;
  assign id_4[id_16][id_15^1] = -1;
endmodule
