// Seed: 166182737
module module_0 (
    output tri id_0,
    input uwire id_1,
    input supply1 id_2,
    input wand id_3,
    input wire id_4,
    output uwire id_5,
    output tri1 id_6,
    output supply0 id_7,
    output supply1 id_8,
    output uwire id_9,
    output wand id_10,
    input tri1 id_11,
    output tri1 id_12,
    input supply0 id_13,
    input uwire id_14,
    output wand id_15,
    input tri1 id_16,
    input tri1 id_17,
    input wand id_18,
    input supply1 id_19,
    input wire id_20,
    output supply1 id_21,
    input supply0 id_22,
    input wor id_23,
    input tri1 id_24,
    input supply0 module_0,
    output wand id_26,
    output wand id_27,
    input wor id_28,
    output tri0 id_29,
    output uwire id_30
    , id_32
);
endmodule
module module_1 #(
    parameter id_18 = 32'd94,
    parameter id_4  = 32'd94,
    parameter id_7  = 32'd17
) (
    input supply1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri id_3,
    output wire _id_4,
    input tri id_5,
    output supply1 id_6,
    output tri0 _id_7,
    input wand id_8,
    input tri1 id_9,
    output tri id_10,
    input wire id_11,
    output tri id_12,
    inout supply1 id_13,
    inout tri id_14
    , _id_18,
    input tri0 id_15,
    output supply0 id_16
);
  assign id_6 = id_11;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_2,
      id_2,
      id_9,
      id_6,
      id_6,
      id_14,
      id_10,
      id_12,
      id_13,
      id_15,
      id_6,
      id_8,
      id_8,
      id_14,
      id_2,
      id_0,
      id_2,
      id_3,
      id_9,
      id_12,
      id_0,
      id_15,
      id_8,
      id_9,
      id_14,
      id_14,
      id_2,
      id_10,
      id_10
  );
  wire id_19;
  or primCall (id_10, id_9, id_5, id_3, id_15, id_2, id_0, id_14, id_11, id_13, id_1);
  struct packed {
    logic [-1 : id_7] id_20;
    logic [1 : id_18] id_21;
  } [-1 : id_4] id_22 = id_14;
endmodule
