// Seed: 2827131345
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
    id_25
);
  input wire id_25;
  output wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_26, id_27;
  wire id_28;
endmodule : id_29
module module_1 (
    input  tri0 id_0,
    input  tri0 id_1,
    output wand id_2,
    output tri1 id_3,
    input  tri1 id_4,
    input  wor  id_5
);
  wire id_7;
  assign id_2 = 1;
  wand id_8 = 1'b0;
  wand id_9 = 1;
  wire id_10;
  xnor (id_3, id_10, id_9, id_1, id_5, id_0);
  wire id_11, id_12;
  module_0(
      id_10,
      id_10,
      id_8,
      id_8,
      id_12,
      id_11,
      id_11,
      id_7,
      id_11,
      id_8,
      id_9,
      id_10,
      id_12,
      id_7,
      id_10,
      id_8,
      id_11,
      id_8,
      id_8,
      id_10,
      id_12,
      id_7,
      id_12,
      id_10,
      id_7
  );
endmodule
