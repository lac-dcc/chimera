// Seed: 3721115128
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
    id_11
);
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4 = id_7;
  assign id_1 = 1;
  assign module_1.id_15 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    output supply1 id_2,
    output wand id_3,
    input wor id_4,
    input supply0 id_5,
    input tri id_6,
    input wire id_7,
    output wand id_8,
    output supply0 id_9,
    output tri id_10,
    input wor id_11,
    input supply1 id_12,
    input supply1 id_13
);
  wand id_15, id_16;
  wire id_17;
  wire id_18, id_19;
  wire id_20, id_21;
  nor primCall (
      id_9, id_4, id_13, id_7, id_5, id_19, id_16, id_18, id_20, id_11, id_6, id_21, id_0
  );
  assign id_15 = -1'd0;
  module_0 modCall_1 (
      id_21,
      id_16,
      id_15,
      id_17,
      id_20,
      id_19,
      id_15,
      id_19,
      id_15,
      id_17,
      id_15
  );
  wire id_22;
  wire id_23;
  assign id_2 = -1;
endmodule
