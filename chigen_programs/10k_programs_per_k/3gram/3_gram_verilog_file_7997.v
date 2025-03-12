// Seed: 3879069657
module module_0 (
    input wor id_0,
    output supply1 id_1,
    output tri1 id_2,
    output wire id_3,
    output wor id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wor id_7,
    input uwire id_8,
    input supply1 id_9,
    output wor id_10,
    output tri id_11,
    output tri0 id_12,
    input uwire id_13,
    input wor id_14,
    output uwire id_15,
    input wire id_16,
    output tri id_17,
    output tri id_18,
    input supply1 id_19,
    input uwire id_20,
    input wor id_21,
    input tri1 id_22,
    output wand id_23,
    input uwire id_24,
    input tri1 id_25,
    output supply1 id_26,
    output wand id_27,
    input wor id_28,
    output supply0 id_29
);
  final $clog2(24);
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd99
) (
    input  wire _id_0,
    input  tri0 id_1,
    output tri  id_2,
    input  wand id_3,
    output tri0 id_4
);
  logic [7:0] id_6;
  assign id_6[id_0] = id_0;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_1,
      id_1,
      id_3,
      id_2,
      id_2,
      id_4,
      id_1,
      id_1,
      id_2,
      id_1,
      id_4,
      id_4,
      id_1,
      id_1,
      id_1,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_2,
      id_1,
      id_4
  );
  assign modCall_1.id_15 = 0;
  always @(posedge id_3 or negedge id_3);
endmodule
