// Seed: 1659722067
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
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd70,
    parameter id_5  = 32'd56,
    parameter id_7  = 32'd44
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    _id_11
);
  inout wire _id_11;
  inout logic [7:0] id_10;
  input wire id_9;
  output wire id_8;
  inout wire _id_7;
  inout wire id_6;
  input wire _id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_8 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_6,
      id_2,
      id_3,
      id_6,
      id_6
  );
  wire [1 : id_5] id_12;
  assign id_8 = id_10[id_11 : id_7];
endmodule
