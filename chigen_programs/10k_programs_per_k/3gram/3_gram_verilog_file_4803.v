// Seed: 4057461163
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
    id_15
);
  input wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = (~1);
  assign id_7 = id_8;
endmodule
module module_1 #(
    parameter id_10 = 32'd15,
    parameter id_11 = 32'd21
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always_ff @(posedge id_5);
  module_0(
      id_5, id_2, id_5, id_9, id_5, id_4, id_7, id_7, id_4, id_1, id_5, id_9, id_3, id_2, id_4
  ); defparam id_10.id_11 = 1;
  wire id_12;
endmodule
