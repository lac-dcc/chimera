// Seed: 2310625221
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  input wire id_26;
  output wire id_25;
  output wire id_24;
  inout wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic [-1 : 1 'h0] id_27;
  ;
endmodule
module module_1 #(
    parameter id_12 = 32'd93,
    parameter id_6  = 32'd39,
    parameter id_8  = 32'd81
) (
    output tri0  id_0,
    output tri   id_1,
    input  uwire id_2,
    output tri0  id_3,
    output wire  id_4,
    input  uwire id_5,
    input  wor   _id_6,
    input  tri0  id_7,
    input  wand  _id_8,
    input  wire  id_9,
    output uwire id_10,
    input  wand  id_11,
    output wand  _id_12,
    input  tri1  id_13,
    output wire  id_14
);
  struct packed {
    logic [1 : -1 'b0] id_16;
    logic [id_12 : ""] id_17;
  } [id_8 : id_6] id_18;
  or primCall (id_0, id_7, id_16, id_13, id_2, id_17, id_18, id_5, id_11);
  assign id_1 = id_18.id_17;
  module_0 modCall_1 (
      id_18,
      id_17,
      id_16,
      id_18,
      id_17,
      id_17,
      id_17,
      id_16,
      id_18,
      id_17,
      id_16,
      id_17,
      id_18,
      id_16,
      id_17,
      id_16,
      id_17,
      id_18,
      id_16,
      id_16,
      id_17,
      id_17,
      id_18,
      id_17,
      id_18,
      id_16
  );
  wire id_19;
endmodule
