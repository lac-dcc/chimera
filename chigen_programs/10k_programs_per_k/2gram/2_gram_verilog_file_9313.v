// Seed: 3277668626
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    input wor id_2,
    output supply1 id_3,
    input uwire id_4,
    input wire id_5,
    output tri id_6,
    output uwire id_7,
    input tri id_8,
    output tri id_9,
    input tri id_10,
    input tri0 id_11,
    input wor id_12,
    input wire id_13,
    output wire id_14,
    input supply1 id_15,
    input tri0 id_16,
    output uwire id_17,
    output wire id_18,
    input tri0 id_19,
    output tri0 id_20,
    input tri id_21,
    input tri0 id_22,
    input wor id_23,
    output wand id_24
);
  wire id_26;
endmodule
module module_1 #(
    parameter id_5 = 32'd36,
    parameter id_7 = 32'd31
) (
    output uwire id_0,
    input supply0 id_1,
    output wand id_2,
    input tri id_3,
    output wand id_4,
    input tri0 _id_5,
    input tri1 id_6,
    input supply1 _id_7,
    output tri0 id_8
);
  logic [7:0][-1 'b0 : id_5] id_10;
  assign id_10[id_7] = id_6;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_3,
      id_0,
      id_6,
      id_3,
      id_4,
      id_4,
      id_6,
      id_2,
      id_3,
      id_6,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_8,
      id_2,
      id_6,
      id_0,
      id_6,
      id_1,
      id_3,
      id_8
  );
  assign modCall_1.id_11 = 0;
endmodule
