// Seed: 1771344843
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  supply0 id_19 = -1'd0;
  supply1 id_20 = 1;
endmodule
module module_1 #(
    parameter id_1  = 32'd41,
    parameter id_25 = 32'd69,
    parameter id_4  = 32'd26,
    parameter id_7  = 32'd32
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7
);
  inout wire _id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire _id_4;
  output wire id_3;
  inout wire id_2;
  input wire _id_1;
  wire id_8;
  struct packed {
    logic [1 : (  id_4  )] id_9;
    logic id_10;
  } id_11;
  assign id_11.id_9 = -1'b0;
  wire id_12;
  ;
  module_0 modCall_1 (
      id_11.id_9,
      id_5,
      id_3,
      id_9,
      id_9,
      id_5,
      id_6,
      id_11,
      id_11.id_9,
      id_11,
      id_11,
      id_12,
      id_12,
      id_11,
      id_9,
      id_2,
      id_8,
      id_12
  );
  wire [id_1 : 1] id_13[1  !=?  -1 : 1];
  logic id_14, id_15;
  wire id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, _id_25;
  wire [id_7 : {  id_25  &&  1 'b0 {  1 'b0 }  }] id_26;
  assign id_22 = id_11;
endmodule
