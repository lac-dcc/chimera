// Seed: 270484905
module module_0 #(
    parameter id_10 = 32'd97,
    parameter id_2  = 32'd7
) (
    id_1,
    module_0,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10
);
  inout wire _id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  logic id_11;
  ;
  `define pp_12 0
  assign id_1[-1] = id_7 ? id_3[id_2] : id_8;
  wire [id_10 : -1] id_13;
  wire [-1 : 1] id_14;
  assign module_1.id_27 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd59,
    parameter id_2  = 32'd57,
    parameter id_27 = 32'd44,
    parameter id_5  = 32'd99,
    parameter id_7  = 32'd11,
    parameter id_8  = 32'd27,
    parameter id_9  = 32'd50
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    _id_7,
    _id_8,
    _id_9,
    _id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout logic [7:0] id_12;
  output wire id_11;
  input wire _id_10;
  inout wire _id_9;
  input wire _id_8;
  inout wire _id_7;
  input wire id_6;
  output wire _id_5;
  input wire id_4;
  input wire id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_2  = id_12[id_8&&1'b0-:1];
  assign id_12 = 1 ? id_12 : id_2;
  reg id_14 = ~id_7;
  bit id_15;
  logic [7:0][id_2 : 1] id_16 = id_2;
  assign id_13 = id_2;
  always id_15 <= 1 ? id_16[id_7 : 1] : -1 ? id_9 : 1;
  wor [id_7 : id_9] id_17 = -1;
  bit [id_10 : (  id_10  )] id_18 = id_7;
  struct packed {
    logic [1 : { "" ,  1  }]   id_19;
    logic [-1  -  id_7 : id_5] id_20;
  } id_21;
  id_22 :
  assert property (@(posedge 1 - -1) id_22)
  else $clog2(id_2);
  ;
  logic [id_8 : -1 'h0] id_23 = 1;
  localparam id_24 = 1;
  wand id_25 = -1'b0;
  localparam id_26 = 1;
  logic _id_27;
  always #1 begin : LABEL_0
    id_21.id_20 = 1;
  end
  localparam id_28 = 1;
  assign id_9 = id_24[-1];
  module_0 modCall_1 (
      id_16,
      id_2,
      id_24,
      id_3,
      id_13,
      id_1,
      id_4,
      id_20,
      id_20,
      id_9
  );
  tri0 [id_27 : -1] id_29 = 1;
  always #1 begin : LABEL_1
    id_14 = 1;
    id_18 = (1);
  end
endmodule
