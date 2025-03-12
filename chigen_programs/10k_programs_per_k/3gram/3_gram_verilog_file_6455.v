// Seed: 3682160255
module module_0 #(
    parameter id_1 = 32'd7
);
  wire _id_1;
  wire [id_1 : -1] id_2;
endmodule
module module_1 #(
    parameter id_1 = 32'd35,
    parameter id_3 = 32'd37
) (
    _id_1,
    id_2
);
  inout wire id_2;
  output wire _id_1;
  buf primCall (id_2, id_4);
  logic [1 : 1] _id_3;
  wire id_4;
  module_0 modCall_1 ();
  wire [id_3 : (  id_1  )] id_5, id_6, id_7;
endmodule
module module_2 #(
    parameter id_12 = 32'd77
) (
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
    _id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire _id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input logic [7:0] id_5;
  input logic [7:0] id_4;
  inout wire id_3;
  inout tri0 id_2;
  inout wire id_1;
  assign id_2 = id_7 & id_5[1-:1];
  wire id_16;
  reg  id_17 = id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire [id_12 : 1] id_18 = id_5;
  wire id_19 = id_15;
  parameter id_20 = -1 | ((1));
  id_21 :
  assert property (@(1) 1)
  else begin : LABEL_0
    id_17 = -1;
  end
  logic id_22 = -1;
  wire  id_23 = id_19;
  assign id_21 = id_6;
  logic id_24, id_25;
  wire id_26 = id_16;
  localparam id_27 = |id_20;
  logic id_28 = id_17;
endmodule
