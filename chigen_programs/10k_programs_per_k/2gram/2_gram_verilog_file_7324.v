// Seed: 3515221378
module module_0 (
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
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_17;
  assign id_1 = 1;
  wire id_18;
  wire id_19;
  assign id_6 = id_14;
  assign id_2 = 1'b0;
  wire id_20, id_21, id_22, id_23, id_24, id_25, id_26;
  wire id_27;
endmodule
module module_1 #(
    parameter id_4 = 32'd86,
    parameter id_5 = 32'd8
) (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  defparam id_4.id_5 = id_3 ^ id_1 ^ 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
