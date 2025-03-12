// Seed: 3941026386
module module_0 #(
    parameter id_17 = 32'd69
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
    id_16
);
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  localparam id_17 = 1;
  wire id_18;
  wire id_19, id_20;
  assign id_1[id_17] = id_18;
endmodule
module module_0 (
    module_1,
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
  output wire id_14;
  input wire id_13;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_8,
      id_9,
      id_7,
      id_9,
      id_9,
      id_8,
      id_5,
      id_10,
      id_6,
      id_8,
      id_8,
      id_14
  );
  input wire id_12;
  inout logic [7:0] id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  or primCall (id_14, id_7, id_10, id_4, id_12, id_11, id_5, id_2, id_9, id_8, id_13, id_3, id_6);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_14 = 1 ? -1 : id_11[-1];
endmodule
