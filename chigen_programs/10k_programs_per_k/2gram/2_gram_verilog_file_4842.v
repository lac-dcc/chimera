// Seed: 3108404811
module module_0 (
    output logic id_0,
    input wire id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wor id_4,
    input tri1 id_5
    , id_31,
    output wire id_6,
    output supply0 id_7,
    input wand id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wire id_11,
    input uwire id_12,
    input wand id_13,
    input wand id_14,
    output wor id_15,
    output wire id_16,
    output wor id_17,
    output wand id_18,
    input tri1 id_19,
    input tri id_20,
    input tri id_21,
    input wire id_22,
    output wand id_23,
    output wand id_24,
    output tri1 id_25,
    output supply1 id_26,
    input supply0 id_27,
    input supply0 id_28,
    output tri1 id_29
);
  always_latch id_0 <= id_27;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd36,
    parameter id_5 = 32'd11
) (
    output uwire id_0,
    input  uwire id_1,
    output logic id_2,
    input  uwire id_3,
    input  wor   _id_4,
    input  wor   _id_5
);
  initial id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0
  );
  uwire [id_5 : id_4  -  (  -1  )] id_7;
  assign id_7 = 1;
  assign id_7 = id_3 == $clog2(82);
  ;
  parameter id_8 = 1;
endmodule
