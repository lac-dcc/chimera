// Seed: 1718033634
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    output wire id_3,
    input wire id_4,
    output wor id_5,
    input wand id_6,
    input supply0 id_7,
    input supply1 id_8,
    output tri0 id_9,
    output tri0 id_10,
    input tri1 id_11,
    input tri0 id_12,
    input tri id_13,
    output tri id_14,
    output uwire id_15,
    input uwire id_16
);
  logic id_18;
  ;
  wand id_19 = id_8 - 1;
  assign id_18 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd8,
    parameter id_5  = 32'd90
) (
    input tri0 id_0[1 : id_5],
    input tri id_1,
    output wire id_2,
    input tri1 id_3,
    input supply1 id_4,
    input uwire _id_5,
    output tri1 id_6,
    output tri0 id_7,
    input tri id_8,
    output uwire id_9,
    input uwire _id_10,
    input wire id_11,
    input tri id_12,
    input tri1 id_13,
    output wor id_14,
    input wor void id_15,
    output tri0 id_16
);
  logic [7:0][id_10] id_18, id_19;
  logic id_20, id_21;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_13,
      id_9,
      id_1,
      id_6,
      id_3,
      id_15,
      id_4,
      id_2,
      id_9,
      id_8,
      id_11,
      id_11,
      id_6,
      id_9,
      id_3
  );
  assign modCall_1.id_3 = 0;
  assign id_21 = -1'b0;
endmodule
