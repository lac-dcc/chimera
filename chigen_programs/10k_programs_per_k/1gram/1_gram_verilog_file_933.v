// Seed: 226339947
module module_0 #(
    parameter id_11 = 32'd23,
    parameter id_14 = 32'd82,
    parameter id_3  = 32'd92,
    parameter id_6  = 32'd11,
    parameter id_9  = 32'd35
) (
    id_1,
    id_2,
    _id_3[id_6?-1 : id_3 : id_11],
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    _id_11,
    id_12
);
  input wire id_12;
  output wire _id_11;
  inout tri0 id_10;
  input wire _id_9;
  input wire id_8;
  output wire id_7;
  output wire _id_6;
  output wire id_5;
  input wire id_4;
  output logic [7:0] _id_3;
  output wire id_2;
  output wire id_1;
  assign id_10 = 1;
  parameter id_13 = 1;
  assign id_1 = id_4;
  logic _id_14;
  ;
  assign id_5 = id_13;
  wor [!  id_9 : id_14] id_15 = id_4 < 1;
endmodule
program module_1 #(
    parameter id_2 = 32'd81,
    parameter id_4 = 32'd42,
    parameter id_5 = 32'd73,
    parameter id_6 = 32'd1
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    _id_5
);
  input wire _id_5;
  input wire _id_4;
  input logic [7:0] id_3;
  inout wire _id_2;
  inout wor id_1;
  assign id_1 = 1;
  parameter [-1  &&  id_4  ?  id_2 : id_5 : id_4  -  -1] id_6 = 1;
  logic id_7 = 1;
  logic id_8;
  logic id_9;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_6,
      id_8,
      id_1,
      id_6,
      id_8,
      id_8,
      id_6,
      id_1,
      id_6,
      id_1
  );
  assign id_1 = id_8;
  logic id_10;
  bit id_11 = id_1, id_12 = id_3[1] | -1;
  assign id_8 = id_8;
  assign id_1 = 1;
  wire  id_13 = id_9[id_2 : 1][("")-id_6] - -1 - -1'h0, id_14 = -1;
  logic id_15;
  always_latch begin : LABEL_0
    if (id_6) id_7 <= id_2;
    id_12 = id_5;
  end
endprogram
