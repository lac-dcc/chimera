// Seed: 2811776457
module module_0 #(
    parameter id_13 = 32'd47,
    parameter id_4  = 32'd71
) (
    id_1,
    id_2[id_4 :-1&id_13],
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11[1 :-1],
    id_12[-1 :-1],
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  inout wire id_16;
  assign module_1.id_1 = 0;
  input wire id_15;
  inout wire id_14;
  input wire _id_13;
  input logic [7:0] id_12;
  output logic [7:0] id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire _id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  logic id_18 = id_15;
endmodule
module module_1 #(
    parameter id_0 = 32'd15,
    parameter id_5 = 32'd35,
    parameter id_9 = 32'd87
) (
    input uwire _id_0,
    input supply0 id_1,
    output wor id_2,
    input tri0 id_3,
    output wand id_4,
    input supply0 _id_5
);
  reg [id_5  &&  -1 : id_5] id_7, id_8;
  assign id_2 = 1;
  parameter id_9 = 1;
  wire id_10;
  wand id_11;
  ;
  wire id_12;
  assign id_11 = -1'b0;
  initial id_8 <= 1;
  wire id_13, id_14[1 : -1], id_15, id_16, id_17;
  logic id_18;
  module_0 modCall_1 (
      id_16,
      id_18,
      id_15,
      id_9,
      id_10,
      id_10,
      id_12,
      id_13,
      id_15,
      id_16,
      id_18,
      id_18,
      id_9,
      id_11,
      id_10,
      id_12,
      id_13
  );
  logic id_19;
  assign id_18[id_0][id_9 : ""==(1)] = id_15;
  localparam id_20 = id_9 != 1;
  assign id_11 = id_13;
endmodule
