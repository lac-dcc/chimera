// Seed: 4251431684
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output tri1 id_4,
    input tri id_5,
    input tri1 id_6,
    input uwire id_7,
    input supply0 id_8,
    input uwire id_9,
    output tri id_10,
    output wire id_11,
    output wor id_12,
    input tri0 id_13
);
  wire id_15;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd46,
    parameter id_9 = 32'd35
) (
    output tri0 id_0,
    output wand id_1,
    input tri0 id_2,
    output tri id_3,
    input wire _id_4,
    input tri id_5,
    input tri1 id_6,
    input wand id_7,
    output tri0 id_8,
    input wire _id_9,
    input wand id_10,
    input wire id_11,
    input tri0 id_12,
    output tri0 id_13,
    input supply0 id_14,
    output uwire id_15
    , id_17
);
  assign id_0 = (id_9);
  wire [1 'b0 : id_9] id_18 = id_7;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_14,
      id_10,
      id_1,
      id_6,
      id_11,
      id_2,
      id_14,
      id_14,
      id_15,
      id_0,
      id_8,
      id_10
  );
  logic [-1 : id_4] id_19;
  or primCall (id_13, id_2, id_12, id_6, id_7, id_14, id_18, id_17, id_5);
endmodule
