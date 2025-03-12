// Seed: 598711262
module module_0 #(
    parameter id_15 = 32'd52
) (
    output uwire id_0,
    input wire id_1,
    input tri id_2,
    input wand id_3,
    input tri0 id_4,
    output wand id_5,
    output wor id_6,
    output uwire id_7,
    output tri0 id_8,
    output tri id_9,
    output wor id_10
    , id_13,
    input supply1 id_11
);
  assign module_1.id_0 = 0;
  generate
    logic id_14, _id_15 = id_15;
    logic [7:0][(  id_15  )] id_16;
    assign id_5 = -1;
  endgenerate
endmodule
module module_0 #(
    parameter id_0 = 32'd59,
    parameter id_9 = 32'd98
) (
    input uwire _id_0,
    input tri id_1[1 : id_9],
    output wand id_2,
    output tri0 id_3,
    input tri1 id_4,
    input supply1 id_5,
    input wire id_6,
    input wand id_7,
    input tri id_8,
    input uwire _id_9
    , id_12 = -1,
    input supply0 id_10[-1 : id_0]
);
  assign {id_12, module_1} = id_10 ==? 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_8,
      id_4,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3,
      id_1
  );
endmodule
