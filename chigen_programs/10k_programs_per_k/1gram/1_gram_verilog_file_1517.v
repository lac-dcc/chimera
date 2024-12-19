// Seed: 1881719809
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9, id_10;
  assign id_9 = 1'b0;
  wire id_11;
endmodule
module module_1 #(
    parameter id_15 = 32'd24,
    parameter id_16 = 32'd28
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_8;
  wire id_12;
  logic [7:0] id_13;
  wire id_14;
  defparam id_15 = 1, id_16 = (id_4);
  assign {1} = 1;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_2,
      id_5,
      id_10,
      id_2,
      id_12,
      id_5
  );
  always_latch @(1'b0) id_13[1 : 1] = 1 - id_9;
  wire id_17, id_18;
endmodule
