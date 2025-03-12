// Seed: 3459963888
module module_0 #(
    parameter id_1 = 32'd33
) (
    _id_1,
    id_2,
    id_3[-1 : 1],
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  input wire id_2;
  output wire _id_1;
  logic id_8, id_9[{  1  } : 1  +  id_1];
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_18 = 32'd43,
    parameter id_2  = 32'd26,
    parameter id_21 = 32'd50,
    parameter id_25 = 32'd58,
    parameter id_7  = 32'd98,
    parameter id_8  = 32'd37
) (
    input uwire id_0,
    output tri1 id_1,
    output supply0 _id_2,
    output uwire id_3,
    input supply1 id_4,
    output wor id_5,
    input tri0 id_6,
    input tri1 _id_7,
    input tri _id_8,
    input wire id_9,
    input uwire id_10
    , id_23,
    input wire id_11,
    output logic id_12,
    input wire id_13,
    output tri1 id_14,
    input uwire id_15,
    input tri1 id_16,
    input supply1 id_17,
    input wire _id_18[id_7 : id_21],
    output wor id_19,
    output uwire id_20[~  id_2 : id_7],
    input supply1 _id_21
);
  logic id_24;
  wire [-1 'd0 : 1] _id_25;
  tri1 id_26, id_27[1 'b0 : -1];
  assign id_23[id_8^id_18] = -1;
  parameter id_28 = 1;
  assign id_25.id_26 = id_26;
  module_0 modCall_1 (
      id_25,
      id_28,
      id_23,
      id_24,
      id_28,
      id_28,
      id_28
  );
  assign id_5 = id_6 ^ -1'b0;
  wire id_29[id_25 : id_25];
  always_ff id_12 <= 1;
endmodule
