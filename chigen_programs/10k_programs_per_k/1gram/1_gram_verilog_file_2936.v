// Seed: 2631565834
module module_0 (
    input wire id_0,
    output wand id_1
    , id_30,
    input wand id_2,
    input wire id_3,
    output tri id_4,
    input tri id_5,
    output tri0 id_6,
    input tri1 id_7,
    input wand id_8,
    input supply0 id_9,
    output supply1 id_10,
    output wand id_11,
    input wand id_12,
    input tri id_13,
    output tri id_14,
    input supply0 id_15,
    input wor id_16,
    input tri id_17,
    input tri1 id_18,
    output tri0 id_19,
    input wand id_20,
    input supply1 id_21,
    output tri id_22,
    input wire id_23,
    input wor id_24,
    input wire id_25,
    input supply0 id_26,
    output tri1 id_27,
    input wire id_28
);
  wire id_31;
  assign module_1.id_6 = 0;
  logic id_32;
endmodule
module module_1 #(
    parameter id_7 = 32'd36,
    parameter id_8 = 32'd6
) (
    output tri1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    inout tri1 id_3,
    output supply0 id_4,
    output supply1 id_5,
    input wor id_6,
    input tri0 _id_7,
    input uwire _id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri1 id_11,
    input tri0 id_12[1  ||  1 : 1  ?  id_8 : id_7],
    input supply1 id_13,
    input supply0 id_14,
    output tri0 id_15,
    input tri id_16
);
  assign id_1 = id_3;
  wire id_18, id_19;
  assign id_9 = id_12;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_13,
      id_3,
      id_1,
      id_3,
      id_0,
      id_12,
      id_16,
      id_16,
      id_9,
      id_9,
      id_10,
      id_12,
      id_1,
      id_12,
      id_10,
      id_10,
      id_3,
      id_9,
      id_12,
      id_16,
      id_15,
      id_12,
      id_10,
      id_16,
      id_16,
      id_4,
      id_13
  );
  assign id_0 = id_7;
endmodule
