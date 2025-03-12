// Seed: 724405344
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri id_3,
    output tri0 id_4,
    output wire id_5,
    input supply0 id_6,
    input wire id_7,
    input wor id_8
    , id_15,
    input wand id_9,
    input uwire id_10,
    input uwire id_11,
    input tri1 id_12,
    output wand id_13
);
  wire id_16;
  parameter id_17 = -1;
  timeunit 1ps;
  wire id_18;
  assign module_1.id_17 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd49
) (
    input supply0 id_0,
    input tri id_1,
    output tri id_2,
    input wand id_3,
    input tri1 id_4,
    output wire id_5,
    input wire id_6,
    input supply0 id_7,
    output supply1 id_8,
    input supply1 id_9,
    output wor id_10,
    output uwire _id_11,
    output tri id_12,
    output tri id_13,
    output wand id_14,
    output uwire id_15,
    input wand id_16,
    output uwire id_17,
    output tri0 id_18,
    output wor id_19,
    output uwire id_20,
    input wand id_21,
    input wor id_22,
    output supply1 id_23,
    input wor id_24
);
  logic id_26;
  logic [-1 : 1 'b0 -  id_11  ^  1 'h0] id_27;
  always @(posedge -1'b0 == id_6) id_27 = -1'h0;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_4,
      id_9,
      id_8,
      id_19,
      id_21,
      id_0,
      id_16,
      id_0,
      id_1,
      id_7,
      id_22,
      id_17
  );
endmodule
