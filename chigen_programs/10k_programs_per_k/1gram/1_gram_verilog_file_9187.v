// Seed: 1040725904
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
    id_13
);
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wor id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_14;
  ;
  always $signed(75);
  ;
  assign id_5 = (id_6) & 1;
  wire id_15;
endmodule
module module_1 #(
    parameter id_10 = 32'd23,
    parameter id_12 = 32'd50,
    parameter id_5  = 32'd0,
    parameter id_7  = 32'd54,
    parameter id_9  = 32'd75
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    _id_7,
    id_8,
    _id_9,
    _id_10[id_9||1 : 1'b0^id_7]
);
  inout logic [7:0] _id_10;
  output wire _id_9;
  inout wire id_8;
  inout wire _id_7;
  input wire id_6;
  inout wire _id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_9 = & ~id_8;
  integer [1 : 1] id_11[id_10 : id_5];
  logic _id_12;
  module_0 modCall_1 (
      id_11,
      id_1,
      id_6,
      id_1,
      id_8,
      id_4,
      id_11,
      id_8,
      id_3,
      id_1,
      id_1,
      id_6,
      id_8
  );
  wire [id_12 : -1] id_13;
  localparam id_14 = 1 ? 1 : 1;
endmodule
