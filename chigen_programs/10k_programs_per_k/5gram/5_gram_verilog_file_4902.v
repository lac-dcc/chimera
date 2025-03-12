// Seed: 3551037178
module module_0 (
    input uwire id_0,
    output wand id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    output tri id_6,
    input supply0 id_7,
    input tri0 id_8,
    output supply0 id_9,
    output wor id_10,
    input tri0 id_11,
    input tri id_12
);
  assign id_9 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd21
) (
    output tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wand _id_5,
    input supply0 id_6,
    input wand id_7,
    input supply0 id_8,
    input tri id_9,
    input tri1 id_10,
    input wand id_11,
    input supply1 id_12,
    input wire id_13,
    input tri id_14,
    input tri0 id_15,
    output tri0 id_16,
    output supply1 id_17,
    output wand id_18,
    output tri0 id_19
);
  logic id_21;
  xor primCall (id_0, id_14, id_4, id_25, id_11, id_21, id_2);
  struct packed {
    id_22 id_23;
    logic [-1 : id_5] id_24;
  } id_25;
  ;
  module_0 modCall_1 (
      id_2,
      id_18,
      id_13,
      id_17,
      id_12,
      id_8,
      id_18,
      id_14,
      id_8,
      id_16,
      id_18,
      id_9,
      id_8
  );
endmodule
