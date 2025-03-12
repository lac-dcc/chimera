// Seed: 2618878132
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
    id_26,
    id_27,
    id_28,
    id_29
);
  input wire id_29;
  inout wire id_28;
  input wire id_27;
  input wire id_26;
  input wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  input wire id_21;
  input wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_30;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input wand id_2,
    input wand id_3,
    output tri1 id_4
);
  tri0 id_6 = id_3 !=? 1'b0;
  logic [-1 : 1] id_7;
  ;
  wire id_8;
  ;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_6,
      id_8,
      id_6,
      id_6,
      id_6,
      id_8,
      id_6,
      id_8,
      id_8,
      id_6,
      id_8,
      id_8,
      id_6,
      id_6,
      id_8,
      id_8,
      id_8,
      id_8,
      id_6,
      id_8,
      id_8,
      id_8,
      id_8,
      id_6,
      id_6,
      id_6
  );
  always @(negedge id_0 or posedge (-1'b0)) begin : LABEL_0
    id_7 <= id_6 == 1;
  end
endmodule
