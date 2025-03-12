// Seed: 2627218930
module module_0;
  wire id_1;
  wire id_2;
  wire id_3;
endmodule
module module_1 #(
    parameter id_5 = 32'd30
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  module_0 modCall_1 ();
  input wire _id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  wire id_8;
  assign id_1[id_5] = 1;
endmodule
module module_2 #(
    parameter id_12 = 32'd21,
    parameter id_2  = 32'd3,
    parameter id_3  = 32'd16
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  input wire id_14;
  output logic [7:0] id_13;
  input wire _id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire _id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_8[-1] = (1'h0 == id_14 + 1) ? 1 : (1) ? id_12 : id_8;
  assign id_13[-1'b0+:id_2] = 1;
  logic [7:0] id_16, id_17;
  module_0 modCall_1 ();
  assign id_16[id_12 : {1{id_3}}] = -1;
endmodule
