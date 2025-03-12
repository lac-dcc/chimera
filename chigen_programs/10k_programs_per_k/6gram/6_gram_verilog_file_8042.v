// Seed: 1563611326
module module_0 (
    output tri id_0,
    input tri1 id_1,
    input wor id_2,
    input wand id_3,
    output supply1 id_4,
    output wand id_5,
    output wire id_6
);
  wire id_8;
  ;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd66
) (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    input wor id_3,
    input tri0 id_4,
    input wand id_5,
    input wor id_6,
    input wor id_7,
    input supply0 id_8,
    input tri1 id_9,
    input supply1 id_10,
    output tri0 id_11,
    output supply0 _id_12,
    input tri id_13,
    input tri1 id_14,
    input tri1 id_15,
    output wor id_16,
    output tri0 id_17
);
  logic [-1 : id_12] id_19 = id_13;
  module_0 modCall_1 (
      id_16,
      id_2,
      id_6,
      id_2,
      id_16,
      id_17,
      id_16
  );
  always @(1'b0 or posedge -1)
    if (1) id_19 = 1;
    else id_19 <= id_1 == 1;
endmodule
