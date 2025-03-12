// Seed: 2604754423
module module_0 #(
    parameter id_3 = 32'd56,
    parameter id_5 = 32'd79
) (
    input supply1 id_0,
    output tri1 id_1
);
  wire _id_3;
  wire id_4;
  ;
  wire _id_5;
  wire [id_5 : id_3] id_6;
  if (-1) begin : LABEL_0
    wire [id_5 : -1] id_7, id_8, id_9, id_10;
    struct packed {logic id_11;} id_12[-1 : id_5  |  -1];
    ;
  end else logic id_13 = 1 | id_4;
  wire id_14;
  ;
  wire [-1 'h0 : -1] id_15, id_16;
  wire id_17, id_18;
  wire id_19;
endmodule
module module_1 #(
    parameter id_1  = 32'd13,
    parameter id_10 = 32'd72,
    parameter id_14 = 32'd21,
    parameter id_16 = 32'd55,
    parameter id_2  = 32'd19,
    parameter id_5  = 32'd99,
    parameter id_6  = 32'd21
) (
    output wand  id_0,
    input  tri   _id_1,
    input  tri0  _id_2,
    input  uwire id_3,
    output tri0  id_4,
    input  wor   _id_5,
    input  tri0  _id_6,
    input  uwire id_7,
    output tri1  id_8
);
  logic _id_10;
  ;
  logic [7:0][id_5  -  id_1 : 1] id_11;
  module_0 modCall_1 (
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
  logic id_12[1 'b0 : 1], id_13;
  assign id_11[-1 : 1'b0-1'h0] = id_7 >> 1 ^ -1'h0;
  logic _id_14;
  ;
  tri0 [id_2 : id_14] id_15[id_10 : id_6], _id_16, id_17;
  wire [-1 : (  id_16  )] id_18, id_19;
  wire [id_6 : 1] id_20;
  logic [-1 : -1] id_21;
  logic id_22;
  ;
  localparam id_23 = 1;
  assign id_17 = -1;
  wire [-1 : -1] id_24, id_25;
  wire id_26;
endmodule
