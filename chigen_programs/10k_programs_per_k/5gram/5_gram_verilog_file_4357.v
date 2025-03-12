// Seed: 2123694902
module module_0 #(
    parameter id_17 = 32'd35
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
    id_14,
    id_15,
    id_16,
    _id_17,
    id_18
);
  inout wire id_18;
  input wire _id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire [id_17 : -1] id_19;
endmodule
module module_1 #(
    parameter id_6 = 32'd50
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  localparam id_6 = 1;
  assign id_3[id_6] = id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_1,
      id_5,
      id_2,
      id_5,
      id_1,
      id_5,
      id_5,
      id_6,
      id_5
  );
endmodule
