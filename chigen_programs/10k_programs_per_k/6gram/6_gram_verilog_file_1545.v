// Seed: 1292057747
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    output wire id_2
);
  logic id_4;
  ;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output wand  id_3,
    input  wand  id_4,
    input  uwire id_5,
    output wor   id_6,
    input  tri   id_7
);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6
  );
endmodule
module module_2 (
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_12;
  assign id_5 = id_12;
endmodule
module module_3 #(
    parameter id_10 = 32'd56,
    parameter id_12 = 32'd73,
    parameter id_16 = 32'd62,
    parameter id_8  = 32'd70
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    id_11,
    _id_12
);
  output wire _id_12;
  output supply0 id_11;
  input wire _id_10;
  inout wire id_9;
  inout wire _id_8;
  inout wire id_7;
  output wire id_6;
  output logic [7:0] id_5;
  output logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4[1] = id_8;
  logic [-1 : 1 'd0] id_13;
  assign id_13 = 1 ? id_10 : id_2;
  assign id_11 = 1;
  module_2 modCall_1 (
      id_7,
      id_1,
      id_7,
      id_9,
      id_9,
      id_7,
      id_2,
      id_9,
      id_7,
      id_9,
      id_7
  );
  assign id_4 = id_8;
  wire id_14;
  logic [7:0] id_15;
  logic [~  id_12 : 1  ==  1  +  id_10] _id_16;
  assign id_16 = id_15;
  assign id_14 = id_10;
  assign id_9 = id_15;
  assign id_8 = id_16;
  assign id_13[id_8] = id_15[id_16];
endmodule
