// Seed: 2451268413
module module_0 (
    output tri0 id_0,
    output uwire id_1,
    output wand id_2,
    output supply1 id_3,
    input wand id_4,
    input wand id_5,
    input supply0 id_6,
    input tri1 id_7[1 : 1 'h0],
    output wand id_8,
    input tri id_9,
    input tri0 id_10,
    output wire id_11,
    input wor id_12,
    input wor id_13,
    output tri1 id_14,
    input tri0 id_15,
    input supply1 id_16,
    input wand id_17
);
  assign id_1 = id_15;
endmodule
module module_1 #(
    parameter id_0  = 32'd28,
    parameter id_14 = 32'd16,
    parameter id_23 = 32'd52,
    parameter id_5  = 32'd82,
    parameter id_8  = 32'd25
) (
    input tri _id_0,
    input wire id_1,
    input tri0 id_2,
    input wor id_3[id_5  ?  1  *  id_14  -  id_0 : id_8 : -1 'b0],
    output tri1 id_4,
    input uwire _id_5,
    input tri0 id_6,
    input wor id_7,
    input wor _id_8,
    input tri0 id_9,
    output supply1 id_10,
    input uwire id_11,
    input wand id_12,
    input tri1 id_13,
    input supply0 _id_14,
    output supply0 id_15,
    input supply0 id_16,
    output supply1 id_17,
    input supply0 id_18,
    input wor id_19,
    output tri0 id_20
);
  wire id_22, _id_23;
  integer id_24["" : id_23], id_25;
  assign id_20 = id_9;
  parameter id_26 = 1;
  module_0 modCall_1 (
      id_20,
      id_17,
      id_20,
      id_20,
      id_1,
      id_2,
      id_16,
      id_2,
      id_17,
      id_18,
      id_13,
      id_17,
      id_9,
      id_6,
      id_15,
      id_6,
      id_12,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule
