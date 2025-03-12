// Seed: 965452577
module module_0 #(
    parameter id_13 = 32'd12
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
    id_17,
    id_18
);
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire _id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = -1;
  parameter integer id_19 = (1'b0 < 1);
  logic [-1 'b0 : (  id_13  )] id_20;
  ;
  assign id_20 = 1;
  supply1 id_21 = 1 == "";
  wire id_22;
endmodule
module module_1 #(
    parameter id_1  = 32'd29,
    parameter id_10 = 32'd8,
    parameter id_3  = 32'd87,
    parameter id_4  = 32'd0,
    parameter id_7  = 32'd7
) (
    _id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire _id_10;
  input wire id_9;
  input wire id_8;
  input wire _id_7;
  output wire id_6;
  nand primCall (
      id_12,
      id_19,
      id_25,
      id_27,
      id_8,
      id_28,
      id_17,
      id_16,
      id_18,
      id_21,
      id_11,
      id_15,
      id_23,
      id_26,
      id_9,
      id_24,
      id_22,
      id_2
  );
  input wire id_5;
  input wire _id_4;
  inout wire _id_3;
  inout wire id_2;
  inout wire _id_1;
  localparam id_15 = 1;
  logic [id_7 : 1] id_16;
  ;
  logic [-1 : -1] id_17;
  logic id_18;
  localparam id_19 = id_15, id_20 = id_10 == id_17;
  assign id_18 = 1 == id_8 + id_17;
  union packed {
    id_21 id_22;
    struct packed {
      struct packed {
        logic [-1  -  id_10 : -1] id_23;
        logic [id_3 : id_1] id_24;
      } [1 : -1] id_25;
      logic [1 : {  -1  ,  {  -1  {  id_10  }  }  }  >  id_3] id_26;
    } [-1  *  -1 'b0 *  -1  -  id_1 : id_4] id_27;
  } id_28;
  module_0 modCall_1 (
      id_23,
      id_25,
      id_21,
      id_23,
      id_14,
      id_11,
      id_16,
      id_21,
      id_21,
      id_9,
      id_17,
      id_24,
      id_20,
      id_17,
      id_5,
      id_19,
      id_2,
      id_12
  );
endmodule
