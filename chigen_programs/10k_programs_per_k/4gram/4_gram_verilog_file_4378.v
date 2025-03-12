// Seed: 1696713999
module module_0 (
    input wand id_0,
    output uwire id_1,
    input uwire id_2
    , id_9,
    input supply0 id_3,
    output wor id_4,
    output wire id_5,
    output tri1 id_6,
    input uwire id_7
);
endmodule
module module_1 (
    output wire id_0,
    output tri1 id_1,
    output tri id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wand id_5,
    output supply0 id_6
);
  assign id_0 = id_4;
  xor primCall (id_1, id_4, id_5, id_3);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_3,
      id_6,
      id_0,
      id_1,
      id_4
  );
  wire id_8;
endmodule
module module_2 #(
    parameter id_4 = 32'd94
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout tri id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire _id_4;
  input logic [7:0] id_3;
  inout wire id_2;
  inout wire id_1;
  wand id_9 = -1;
  assign id_8 = 1;
endmodule
module module_3 #(
    parameter id_1  = 32'd81,
    parameter id_10 = 32'd19,
    parameter id_14 = 32'd16,
    parameter id_16 = 32'd18,
    parameter id_19 = 32'd60,
    parameter id_2  = 32'd99,
    parameter id_23 = 32'd63,
    parameter id_5  = 32'd6
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15
);
  inout logic [7:0] id_15;
  inout wire _id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire _id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire _id_5;
  input logic [7:0] id_4;
  input wire id_3;
  inout wire _id_2;
  inout wire _id_1;
  logic [id_14 : 1] _id_16;
  ;
  wire id_17, id_18, _id_19;
  logic [7:0][id_2 : id_5  ^  id_19] id_20;
  wire id_21;
  wire id_22;
  wire _id_23;
  logic id_24;
  parameter id_25 = -1;
  assign id_1 = id_4[id_16+:id_23];
  assign id_20[1] = id_23;
  logic id_26;
  ;
  wire id_27;
  assign id_22 = id_5;
  logic [-1 'b0 : 1  +  1] id_28;
  assign id_15[id_10] = 1;
  wire [id_1 : -1 'd0] id_29;
  module_2 modCall_1 (
      id_26,
      id_21,
      id_4,
      id_1,
      id_9,
      id_25,
      id_3,
      id_13
  );
  wire id_30;
endmodule
