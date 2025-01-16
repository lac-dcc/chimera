// Seed: 4263134051
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input tri id_2,
    input tri id_3,
    output uwire id_4,
    input wire id_5,
    output wor id_6,
    output supply1 id_7,
    output tri0 id_8,
    input wand id_9,
    input wire id_10,
    output uwire id_11,
    output wor id_12,
    output uwire id_13,
    input wand id_14,
    input supply1 id_15,
    input wire id_16,
    output tri1 id_17,
    input supply1 id_18
);
  initial $display;
  wire id_20;
  wire id_21;
  assign id_11 = id_18;
  wire id_22;
  wire id_23 = id_21;
  wire id_24, id_25;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    input  tri0  id_1,
    input  logic id_2,
    output logic id_3,
    input  tri1  id_4,
    output tri1  id_5,
    output wand  id_6
);
  assign id_6 = -1'd0;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_0,
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_4,
      id_0,
      id_6,
      id_6,
      id_6,
      id_1,
      id_1,
      id_1,
      id_5,
      id_1
  );
  always
  fork
    if (-1) id_3 <= id_2;
  join_none
  logic id_8, id_9, id_10, id_11;
  id_12(
      id_8, 1'h0
  );
  assign id_3 = 1;
  assign id_8.id_2 = -1;
endmodule
