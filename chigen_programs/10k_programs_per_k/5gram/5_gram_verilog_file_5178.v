// Seed: 4072717201
module module_0 (
    input  tri1 id_0,
    input  tri1 id_1,
    output tri1 id_2
);
  logic id_4;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input tri id_5
);
  logic id_7;
  ;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_0
  );
  assign modCall_1.id_0 = 0;
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
    id_11,
    id_12
);
  inout wire id_12;
  input logic [7:0] id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  assign id_2[1] = id_4 == id_9;
  assign id_4 = id_11[(1)];
endmodule
module module_3 #(
    parameter id_5 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout logic [7:0] id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire _id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_13[id_5] = id_5;
  logic id_14;
  ;
  module_2 modCall_1 (
      id_12,
      id_13,
      id_8,
      id_10,
      id_12,
      id_3,
      id_11,
      id_11,
      id_12,
      id_10,
      id_13,
      id_1
  );
  logic id_15;
  wire  id_16 = id_12;
  assign id_10 = ~id_8;
  assign id_2  = id_15;
endmodule
