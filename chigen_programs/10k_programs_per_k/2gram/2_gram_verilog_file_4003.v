// Seed: 380027803
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9#(
        .id_10(-1),
        .id_11(id_12)
    ),
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  inout wire id_19;
  input wire id_18;
  output supply1 id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wand id_23 = -1'h0;
  assign id_17 = -1 ? 1 : -1;
  assign module_1.id_4 = 0;
  wire id_24;
  assign id_22 = id_7;
  logic id_25;
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6,
    output wand id_7,
    output tri id_8,
    input supply1 id_9,
    output tri id_10
);
  struct packed {
    logic [-1  **  1 : 1] id_12;
    integer id_13;
    logic id_14;
    logic [-1 : 1 'b0] id_15;
  } [-1 : -1  ==  -1] id_16;
  module_0 modCall_1 (
      id_16,
      id_13,
      id_15,
      id_14,
      id_14,
      id_16,
      id_12,
      id_13,
      id_15,
      id_16,
      id_13,
      id_15,
      id_14,
      id_12,
      id_13,
      id_12,
      id_13,
      id_14,
      id_14
  );
  logic \id_17 ;
  ;
  assign \id_17 = id_16;
  assign id_0   = \id_17 ;
  logic id_18;
  ;
  assign id_7 = id_16.id_13;
  logic id_19 = -1'b0;
endmodule
