// Seed: 270958831
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
    .id_21(id_15),
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = id_17;
endmodule
module module_1 #(
    parameter id_2 = 32'd46
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  input logic [7:0] id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_1 = id_2;
  wire id_6;
  wire id_7;
  wire [!  id_2 : -1] id_8;
  assign id_4 = id_8;
  assign id_4[-1] = id_5[-1] + id_7;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_8,
      id_3,
      id_7,
      id_1,
      id_3,
      id_3,
      id_7,
      id_7,
      id_3,
      id_6,
      id_8,
      id_8,
      id_3,
      id_8,
      id_3,
      id_7,
      id_3,
      id_8
  );
endmodule
