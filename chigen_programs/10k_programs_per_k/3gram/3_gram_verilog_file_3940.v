// Seed: 710289021
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8 = id_7;
endmodule
module module_1 #(
    parameter id_11 = 32'd98,
    parameter id_14 = 32'd24
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
    id_13
);
  output wire id_13;
  output wire id_12;
  inout wire _id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_5,
      id_1
  );
  parameter id_14 = (1);
  wire [id_14 : id_14] id_15;
  wire [id_11 : 1 'b0] id_16;
  assign id_4 = !id_11;
endmodule
