// Seed: 1561026208
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
  inout logic [7:0] id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = (id_8[1]);
endmodule
module module_1 #(
    parameter id_13 = 32'd29,
    parameter id_19 = 32'd82
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
    _id_13,
    id_14
);
  output wire id_14;
  input wire _id_13;
  inout logic [7:0] id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_8,
      id_5,
      id_8,
      id_14,
      id_7,
      id_12
  );
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output uwire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_15;
  wire id_16;
  wire id_17;
  wire [1 'd0 : -1] id_18;
  wire _id_19, id_20;
  assign id_3  = (!id_12[id_13==id_19]) - id_6;
  assign id_10 = id_5;
endmodule
