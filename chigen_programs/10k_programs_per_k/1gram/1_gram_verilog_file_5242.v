// Seed: 283273833
module module_0 (
    input uwire id_0,
    input tri1  id_1,
    input wand  id_2
);
  for (id_4 = -1; id_0; id_4 = -1) always @(1) if (1) id_4 <= id_2;
  assign module_1.id_8 = 0;
  assign id_4 = id_0 * id_2;
endmodule
module module_1 #(
    parameter id_11 = 32'd91,
    parameter id_2  = 32'd47,
    parameter id_8  = 32'd51
) (
    input uwire id_0,
    output wire id_1,
    input uwire _id_2,
    output tri id_3,
    output uwire id_4,
    input uwire id_5,
    output uwire id_6,
    input supply0 id_7,
    output wand _id_8,
    output tri id_9,
    input wand id_10,
    input tri1 _id_11,
    input wire id_12,
    input uwire id_13,
    input wire id_14
);
  logic id_16[1 : id_8];
  wire [1  ?  id_11 : -1 'b0 : id_2] id_17;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_5
  );
  assign id_9 = {id_17 + id_7, id_13, 1} - 1;
endmodule
