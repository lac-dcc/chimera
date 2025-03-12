// Seed: 2480400053
module module_0 (
    input wor id_0,
    output wand id_1,
    input tri1 id_2,
    input wire id_3,
    input uwire id_4,
    input tri1 id_5,
    input tri id_6,
    input supply1 id_7,
    input tri0 id_8
    , id_14 = 1'b0,
    output uwire id_9,
    output wire id_10,
    output supply0 id_11,
    input wand id_12
);
  logic id_15;
  assign module_1.id_4 = 0;
  assign id_14 = -1'b0;
endmodule
module module_1 #(
    parameter id_7 = 32'd87
) (
    input wand id_0,
    output tri id_1,
    output tri0 id_2,
    input supply1 id_3[-1 : id_7],
    input tri id_4,
    input tri id_5,
    output tri id_6,
    input supply0 _id_7,
    input wire id_8,
    input tri1 id_9
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_9,
      id_5,
      id_3,
      id_5,
      id_0,
      id_3,
      id_2,
      id_1,
      id_1,
      id_5
  );
  pulldown (-1);
  logic [7:0][1  -  -1] id_11 = 1'd0;
endmodule
