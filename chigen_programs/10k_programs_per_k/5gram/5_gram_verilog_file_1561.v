// Seed: 1610409738
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
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_10[-1'b0] = id_9;
endmodule
module module_1 #(
    parameter id_13 = 32'd8,
    parameter id_17 = 32'd29
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
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    _id_17
);
  inout wire _id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire _id_13;
  output supply1 id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0][1 : (  id_13  &  -1  )] id_18;
  id_19 :
  assert property (@(posedge 1) -1'b0)
  else $unsigned(75);
  ;
  localparam id_20 = -1;
  wire id_21;
  assign id_12 = 1 << 1;
  wire id_22;
  wire id_23;
  ;
  assign id_17 = id_11;
  localparam id_24 = -1;
  wire id_25;
  assign id_18[id_13] = id_1;
  wire [1 : id_17] id_26;
  wire \id_27 ;
  module_0 modCall_1 (
      id_20,
      id_20,
      id_5,
      id_9,
      id_1,
      id_19,
      id_21,
      id_8,
      id_26,
      id_18,
      id_19,
      id_5,
      id_26
  );
endmodule
